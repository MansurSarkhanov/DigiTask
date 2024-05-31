import 'package:digi_task/bloc/home/main/main_notifier.dart';
import 'package:digi_task/bloc/home/performance/performance_notifier.dart';
import 'package:digi_task/bloc/home/task/task_notifier.dart';
import 'package:digi_task/core/constants/routes.dart';
import 'package:digi_task/presentation/pages/login/login_page.dart';
import 'package:digi_task/presentation/pages/notification/notification_page.dart';
import 'package:digi_task/presentation/pages/splash/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'bloc/auth/login/login_notifier.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/login/view/reset_password_view.dart';
import 'presentation/pages/onboarding/onboarding_page.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.splash.path,
      name: AppRoutes.splash.name,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.onboarding.path,
      name: AppRoutes.onboarding.name,
      builder: (context, state) => const OnboardingPage(),
    ),
    
    GoRoute(
      path: AppRoutes.login.path,
      name: AppRoutes.login.name,
        builder: (context, state) => ChangeNotifierProvider(
              create: (context) => LoginNotifier(),
              child: const LoginPage(),
            ),
        routes: [
          GoRoute(
            path: AppRoutes.resetPassword.path,
            name: AppRoutes.resetPassword.name,
            builder: (context, state) => const ResetPassword(),
          ),
        ]
    ),
    GoRoute(
      path: AppRoutes.home.path,
      name: AppRoutes.home.name,
      builder: (context, state) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MainNotifier()..fetchUserTask(),
          ),
          
          ChangeNotifierProvider(
            create: (context) => PerformanceNotifier()..fetchPerfomance(),
          ),
          ChangeNotifierProvider(
            create: (context) => TaskNotifier()..fetchTasks(),
          ),
        ],
        // ..fetchPerfomance(),
        child: const HomePage(),
      ),
        routes: [
          GoRoute(
            path: AppRoutes.notification.path,
            name: AppRoutes.notification.name,
            builder: (context, state) => const NotificationPage(),
          ),
        ]
    ),
  ],
);
