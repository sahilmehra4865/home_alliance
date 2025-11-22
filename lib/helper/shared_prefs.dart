import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String isLogin = "isLogin";
  static const String jwtToken = "jwtToken";
  static const String refreshToken = "refreshToken";
  static const String tokenTime = "tokenTime";
  static const String expireIn = "expireIn";
  static const String userProfilePic = "userProfilePic";
  static const String userId = "userId";
  static const String userName = "userName";
  static const String recentsExplorePeoples = "recentsExplorePeoples";
  static const String recentLocations = "recentLocations";
  static const String pushNotificationToken = "pushNotificationToken";
  static const String recentFacilitiesPeoples = "recentFacilitiesPeoples";
  static const String chatId = "chatId";

  static SharedPreferences? prefs;

  static void clearSharedPrefs() {
    prefs!.remove(isLogin);
    prefs!.remove(jwtToken);
    prefs!.remove(userName);
    // prefs!.remove(userProfilePic);
    prefs!.remove(userId);
    prefs!.remove(chatId);
    prefs!.remove(refreshToken);
    prefs!.remove(tokenTime);
    prefs!.remove(expireIn);
  }
}
