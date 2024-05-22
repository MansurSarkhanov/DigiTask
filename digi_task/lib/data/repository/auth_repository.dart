import 'package:digi_task/data/model/failure/auth_login_failure.dart';
import 'package:digi_task/data/model/response/user_login_response_model.dart';
import 'package:digi_task/data/services/local/secure_service.dart';
import 'package:digi_task/data/services/network/auth_service.dart';
import 'package:digi_task/injection.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class IAuthRepository {
  Future<Result<UserLoginResponseModel, AuthLoginFailure>> login({required String email, required String password});
}

class AuthRepository implements IAuthRepository {
  final _authDataSource = getIt.get<AuthService>();
  final _secureStorage = getIt.get<SecureService>();

  @override
  Future<Result<UserLoginResponseModel, AuthLoginFailure>> login(
      {required String email, required String password}) async {
    try {
      final result = await _authDataSource.login(email: email, password: password);
      print(result!.access_token);
      print(result.refresh_token);
      print(result.email);
      await _secureStorage.saveToken(result.access_token ?? '');
      return Result.success(result);
    } on DioException catch (_) {
      return Result.error(AuthLoginFailure(detail: 'Invalid credentials. Please try again.'));
    } catch (e) {
      return Result.error(AuthLoginFailure(detail: e.toString()));
    }
  }
}
