// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginResponseModel _$UserLoginResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserLoginResponseModel(
      email: json['email'] as String?,
      access_token: json['access_token'] as String?,
      refresh_token: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$UserLoginResponseModelToJson(
        UserLoginResponseModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
    };
