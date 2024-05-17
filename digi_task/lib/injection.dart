import 'package:digi_task/data/services/network/auth_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => AuthService());
}
