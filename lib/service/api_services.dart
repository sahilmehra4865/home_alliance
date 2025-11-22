import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:home_alliance/models/jobs_response.dart';
import 'package:home_alliance/models/login_response.dart';
import '../helper/common_widgets.dart';
import '../helper/dialog_helper.dart';
import '../helper/shared_prefs.dart';
import '../models/job_detail_response.dart';
import '../utils/api_constants.dart';

class ApiService extends GetConnect {
  @override
  void onInit() {
    httpClient.timeout = const Duration(minutes: 5);

    httpClient.addRequestModifier((Request request) async {
      final token = SharedPrefs.prefs?.getString(SharedPrefs.jwtToken);
      final refreshToken = SharedPrefs.prefs?.getString(SharedPrefs.refreshToken);
      final generatedAtString = SharedPrefs.prefs?.getString(SharedPrefs.tokenTime);
      final expiresInSeconds = SharedPrefs.prefs?.getInt(SharedPrefs.expireIn) ?? 0;

      // ✅ Convert stored date string to DateTime
      DateTime? generatedAt = generatedAtString != null ? DateTime.tryParse(generatedAtString) : null;

      // ✅ Check if token expired
      if (refreshToken != null &&
          _isTokenExpired(generatedAt, expiresInSeconds) &&
          !request.url.toString().contains(ApiConstants.refresh)) {
        log("⚠️ Token expired — refreshing...");
        await _refreshToken();
      }

      // ✅ After possible refresh, re-fetch latest tokens
      final updatedToken = SharedPrefs.prefs?.getString(SharedPrefs.jwtToken);
      final updatedRefreshToken = SharedPrefs.prefs?.getString(SharedPrefs.refreshToken);

      // ✅ Use refresh token header only for refresh API
      if (request.url.toString().contains(ApiConstants.refresh)) {
        if (updatedRefreshToken != null && updatedRefreshToken.isNotEmpty) {
          request.headers['Authorization'] = 'Bearer $updatedRefreshToken';
          log("🔄 Using Refresh Token for ${request.url}");
        }
      } else {
        if (updatedToken != null && updatedToken.isNotEmpty) {
          request.headers['Authorization'] = 'Bearer $updatedToken';
        }
      }

      log("➡️ API Request: ${request.method} ${request.url}");
      return request;
    });

    httpClient.addResponseModifier((request, response) async {
      log("⬅️ API Response [${response.statusCode}]: ${request.url}");
      if (response.statusCode == null || response.statusCode! >= 400) {
        log("❌ API Error: ${response.statusCode} ${response.statusText}");
      }
      return response;
    });
  }

  // ----------- LOGIN API ------------
  Future<LoginResponse?> login(String email, String password) async {
    final url = '${ApiConstants.baseUrl}${ApiConstants.login}';
    final data = {"email": email, "password": password};

    try {
      final response = await post(url, data);
      if (response.status.hasError) throw HttpException(errorHandler(response));
      final loginResponse = LoginResponse.fromJson(response.body);

      // ✅ Save tokens and times
      await _saveTokenInfo(loginResponse);

      return loginResponse;
    } on SocketException {
      DialogHelper.message("No internet connection");
      rethrow;
    } on HttpException catch (e) {
      DialogHelper.message(e.message);
      rethrow;
    } catch (e, stack) {
      log("⚠️ Login Exception: $e", stackTrace: stack);
      DialogHelper.message("Something went wrong. Please try again.");
      rethrow;
    }
  }

  // ----------- REFRESH TOKEN API ------------
  Future<LoginResponse?> refreshTokenApi() async {
    final url = '${ApiConstants.baseUrl}${ApiConstants.refresh}';
    try {
      final response = await post(url, "");
      if (response.status.hasError) throw HttpException(errorHandler(response));

      final refreshResponse = LoginResponse.fromJson(response.body);
      await _saveTokenInfo(refreshResponse);

      return refreshResponse;
    } on SocketException {
      DialogHelper.message("No internet connection");
      rethrow;
    } on HttpException catch (e) {
      DialogHelper.message(e.message);
      rethrow;
    } catch (e, stack) {
      log("⚠️ RefreshToken Exception: $e", stackTrace: stack);
      DialogHelper.message("Something went wrong. Please try again.");
      rethrow;
    }
  }

  // ----------- USER DETAILS API ------------
  Future<DetailsResponse?> getDetails() async {
    final url = '${ApiConstants.baseUrl}${ApiConstants.me}';

    try {
      final response = await get(url);
      if (response.status.hasError) {
        throw HttpException(errorHandler(response));
      }
      return DetailsResponse.fromJson(response.body);
    } catch (e, stack) {
      log("⚠️ getDetails Exception: $e", stackTrace: stack);
      // DialogHelper.message("Failed to fetch user details.");
      rethrow;
    }
  }

  // ----------- JOB LIST API ------------

  Future<JobListResponse?> getJobs(bool isOpen) async {
    final url = '${ApiConstants.baseUrl}${ApiConstants.getJobs}';

    // prepare query params
    final Map<String, dynamic> query = {"type": isOpen ? "open" : "close"};

    try {
      final response = await get(url, query: query);

      if (response.status.hasError) {
        throw HttpException(errorHandler(response));
      }

      return JobListResponse.fromJson(response.body);
    } catch (e, stack) {
      log("⚠️ getJobs Exception: $e", stackTrace: stack);
      rethrow;
    }
  }

  // ----------- JOB DETAIL API ------------
  Future<JobDetailResponse?> getJobById(String jobId) async {
    final url = '${ApiConstants.baseUrl}${ApiConstants.getJobById}$jobId';

    try {
      final response = await get(url);
      if (response.status.hasError) {
        throw HttpException(errorHandler(response));
      }
      return JobDetailResponse.fromJson(response.body);
    } catch (e, stack) {
      log("⚠️ getJobById Exception: $e", stackTrace: stack);
      //   DialogHelper.message("Failed to fetch job details.");
      rethrow;
    }
  }

  // ----------- COMMON ERROR HANDLER ------------
  String errorHandler(Response response) {
    switch (response.statusCode) {
      case 400:
        return "Bad request. Please check your input.";
      case 401:
        return "Unauthorized. Please log in again.";
      case 403:
        return "Access denied.";
      case 404:
        return "Requested resource not found.";
      case 500:
        return "Server error. Please try again later.";
      default:
        return response.statusText ?? "Unexpected error occurred.";
    }
  }

  // ----------- PRIVATE HELPERS ------------

  bool _isTokenExpired(DateTime? generatedAt, int expiresInSeconds) {
    if (generatedAt == null) return true;
    final expiryTime = generatedAt.add(Duration(seconds: expiresInSeconds));
    return DateTime.now().isAfter(expiryTime);
  }

  Future<void> _refreshToken() async {
    try {
      await refreshTokenApi();
    } catch (e) {
      log("❌ Token refresh failed: $e");
    }
  }

  Future<void> _saveTokenInfo(LoginResponse response) async {
    await SharedPrefs.prefs?.setString(SharedPrefs.jwtToken, response.accessToken ?? '');
    await SharedPrefs.prefs?.setString(SharedPrefs.refreshToken, response.refreshToken ?? '');
    await SharedPrefs.prefs?.setString(SharedPrefs.tokenTime, DateTime.now().toString());
    await SharedPrefs.prefs?.setInt(SharedPrefs.expireIn, response.expiresIn ?? 0);
    log("💾 Token info saved successfully");
  }
}
