class LoginResponse {
  String? accessToken;
  String? refreshToken;
  String? tokenType;
  int? expiresIn;

  LoginResponse({this.accessToken, this.tokenType, this.expiresIn});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['refresh_token'] = this.refreshToken;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}


class DetailsResponse {
  String? firstName;
  String? lastName;
  String? nickname;
  String? email;
  String? phone;
  String? avatar;
  String? role;
  List<Mso>? mso;

  DetailsResponse(
      {this.firstName,
        this.lastName,
        this.nickname,
        this.email,
        this.phone,
        this.avatar,
        this.role,
        this.mso});

  DetailsResponse.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    nickname = json['nickname'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    role = json['role'];
    if (json['mso'] != null) {
      mso = <Mso>[];
      json['mso'].forEach((v) {
        mso!.add(new Mso.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['nickname'] = this.nickname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['role'] = this.role;
    if (this.mso != null) {
      data['mso'] = this.mso!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Mso {
  int? id;
  String? name;

  Mso({this.id, this.name});

  Mso.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
