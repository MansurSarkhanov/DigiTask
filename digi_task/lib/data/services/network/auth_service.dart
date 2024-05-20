import 'package:digi_task/core/constants/app_keys.dart';
import 'package:digi_task/data/model/request/user_login_request_model.dart';
import 'package:digi_task/data/model/response/user_login_response_model.dart';
import 'package:dio/dio.dart';


final class AuthService {
final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppKeys.baseUrl,
      contentType: 'application/json',
    ),
  );
  Future<UserLoginResponseModel?> login({required String email, required String password}) async {

    final user = UserLoginRequestModel(email: email, password: password).toJson();
    final response = await dio.post('accounts/login/', data: user);
    if (response.statusCode == 200) {
      final credentialUser = UserLoginResponseModel.fromJson(response.data);
      return credentialUser;
    }
    return null;
  }
}
