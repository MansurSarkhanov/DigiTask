import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_login_response_model.g.dart';

@JsonSerializable()
class UserLoginResponseModel extends Equatable {
  final String? email;
  final String? access_token;
  final String? refresh_token;

  const UserLoginResponseModel({this.email, this.access_token, this.refresh_token});

  factory UserLoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UserLoginResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserLoginResponseModelToJson(this);
  }

  @override
  List<Object?> get props => [email, access_token, refresh_token];
}
