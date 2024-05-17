import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/constants/app_keys.dart';

abstract interface class ISecureService {
  Future<void> saveToken(String value);
  Future<String?> get token;
  Future<void> clearToken();
}

class SecureService implements ISecureService {
  final FlutterSecureStorage secureStorage;
  SecureService({required this.secureStorage});

  @override
  Future<void> saveToken(String value) async {
    try {
      final token = value;
      await secureStorage.write(key: AppKeys.token, value: token);
    } catch (e, s) {
      Error.throwWithStackTrace(e, s);
    }
  }

  @override
  Future<String?> get token async {
    try {
      final token = await secureStorage.read(key: AppKeys.token);
      return token;
    } catch (e, s) {
      Error.throwWithStackTrace(e, s);
    }
  }

  @override
  Future<void> clearToken() async {
    try {
      await secureStorage.delete(key: AppKeys.token);
    } catch (e, s) {
      Error.throwWithStackTrace(e, s);
    }
  }
}
