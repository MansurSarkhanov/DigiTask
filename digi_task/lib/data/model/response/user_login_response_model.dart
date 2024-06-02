


class UserLoginResponseModel {
  String? email;
  String? accessToken;
  String? refreshToken;
  String? userType;

  UserLoginResponseModel({this.email, this.accessToken, this.refreshToken, this.userType});

  UserLoginResponseModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['user_type'] = userType;
    return data;
  }
}
