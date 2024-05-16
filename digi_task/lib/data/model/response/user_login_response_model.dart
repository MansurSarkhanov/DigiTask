import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_login_response_model.g.dart';

@JsonSerializable()
class UserLoginResponseModel extends Equatable {
  final String? email;
  final String? accessToken;
  final String? refreshToken;

  const UserLoginResponseModel({this.email, this.accessToken, this.refreshToken});

  factory UserLoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UserLoginResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserLoginResponseModelToJson(this);
  }

  @override
  List<Object?> get props => [email, accessToken, refreshToken];
}
