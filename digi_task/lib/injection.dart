import 'package:digi_task/data/services/local/secure_service.dart';
import 'package:digi_task/data/services/local/shared_service.dart';
import 'package:digi_task/data/services/network/auth_service.dart';
import 'package:digi_task/data/services/network/home_service.dart';
import 'package:digi_task/features/profile/data/service/profile_network_service.dart';
import 'package:digi_task/features/tasks/data/service/task_network_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => AuthService());
  getIt.registerLazySingleton(() => TaskNetworkService());
  getIt.registerLazySingleton(() => ProfileNetworkService());


  getIt.registerLazySingleton(() => SharedPreferenceService());
  getIt.registerLazySingleton(() => SecureService(secureStorage: const FlutterSecureStorage()));

  getIt.registerLazySingleton(() => HomeService());

  

}
