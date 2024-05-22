import 'package:digi_task/injection.dart';
import 'package:dio/dio.dart';

import '../local/secure_service.dart';

class JwtInterceptor extends Interceptor {
  final _secureStorage = getIt.get<SecureService>();
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _secureStorage.token;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
      super.onRequest(options, handler);
    }
    handler.next(options);
  }
}
