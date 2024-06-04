import 'package:digi_task/data/services/local/secure_service.dart';
import 'package:digi_task/data/services/local/shared_service.dart';
import 'package:digi_task/data/services/network/auth_service.dart';
import 'package:digi_task/data/services/network/home_service.dart';
import 'package:digi_task/features/performance/data/service/performance_network_service.dart';
import 'package:digi_task/features/profile/data/repository/profile_repository_impl.dart';
import 'package:digi_task/features/profile/data/service/profile_network_service.dart';
import 'package:digi_task/features/profile/domain/repository/profile_repository.dart';
import 'package:digi_task/features/profile/presentation/bloc/profile_notifier.dart';
import 'package:digi_task/features/tasks/data/service/task_network_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'app_router.dart';
import 'bloc/auth/auth_notifier.dart';
import 'bloc/auth/login/login_notifier.dart';
import 'data/repository/auth_repository.dart';

final getIt = GetIt.instance;

Future<void> init() async {

  getIt.registerFactory(() => SharedPreferenceService());
  getIt.registerFactory(() => SecureService(secureStorage: const FlutterSecureStorage()));

  getIt.registerLazySingleton(() => AuthService());
  getIt.registerLazySingleton(() => TaskNetworkService());
  getIt.registerLazySingleton(() => ProfileNetworkService());
  getIt.registerLazySingleton(() => PerformanceNetworkService());
  getIt.registerLazySingleton(() => HomeService());




  getIt.registerSingleton<IAuthRepository>(
    AuthRepository(
      authDataSource: getIt(),
      secureStorage: getIt(),
      preferenceService: getIt(),

    ),
  );
  getIt.registerSingleton<ProfileRepository>(
    ProfileRepositoryImpl(profileService: getIt()),
  );

  getIt.registerFactory(() => LoginNotifier(getIt()));
  getIt.registerFactory(() => ProfileNotifier(getIt()));


  getIt.registerSingleton(AuthNotifier(getIt())..checkAuth()); 
  
  getIt.registerSingleton(AppRouter(authNotifier: getIt()));
}
