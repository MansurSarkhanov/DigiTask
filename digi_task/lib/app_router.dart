import 'package:digi_task/core/constants/routes.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/core/utility/extension/icon_path_ext.dart';
import 'package:digi_task/features/performance/presentation/bloc/performance_notifier.dart';
import 'package:digi_task/features/profile/presentation/bloc/profile_notifier.dart';
import 'package:digi_task/features/profile/presentation/view/profile_edit_view.dart';
import 'package:digi_task/features/tasks/presentation/bloc/task_notifier.dart';
import 'package:digi_task/features/tasks/presentation/view/create_task_view.dart';
import 'package:digi_task/presentation/pages/login/login_page.dart';
import 'package:digi_task/presentation/pages/notification/notification_page.dart';
import 'package:digi_task/presentation/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'bloc/auth/auth_notifier.dart';
import 'bloc/auth/login/login_notifier.dart';
import 'core/constants/path/icon_path.dart';
import 'features/profile/presentation/view/profile_tab.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/onboarding/onboarding_page.dart';

final _appRouterKey = GlobalKey<NavigatorState>();

final class AppRouter {
  GoRouter get instance => _appRouter;

  late final GoRouter _appRouter;
  AppRouter({
    required AuthNotifier authNotifier,
  }) {
    _appRouter = GoRouter(
      initialLocation: AppRoutes.splash.path,
      navigatorKey: _appRouterKey,
      refreshListenable: authNotifier,
      redirect: (context, state) {
        final authState = authNotifier.authState;

        // if (authState == AuthState.onboarding) {
        //   if (state.matchedLocation == AppRoutes.onboarding.path) {
        //     return null;
        //   }

        //   return AppRoutes.onboarding.path;
        // }
        //  else
        if (authState == AuthState.unauthenticated) {
          if (state.matchedLocation == AppRoutes.login.path) {
            return null;
          }

          return AppRoutes.onboarding.path;
        } else if (authState == AuthState.authenticated) {
          final isOnLoginPage = state.matchedLocation == AppRoutes.login.path;
          final isOnSplashPage = state.matchedLocation == AppRoutes.splash.path;

          if (isOnLoginPage || isOnSplashPage) {
            return AppRoutes.home.path;
          }
        }

        return state.matchedLocation;
      },
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
                  create: (context) => GetIt.instance<LoginNotifier>(),
                  child: const LoginPage(),
          ),
        ),
     
        GoRoute(
            path: AppRoutes.home.path,
            name: AppRoutes.home.name,
            builder: (context, state) => MultiProvider(
                  providers: [
                  
                    ChangeNotifierProvider(
                      create: (context) => PerformanceNotifier()..fetchPerfomance(),
                    ),
                    ChangeNotifierProvider(
                      create: (context) => GetIt.instance<TaskNotifier>()..fetchTasks(),
                    ),
                    ChangeNotifierProvider(
                      create: (context) => GetIt.instance<ProfileNotifier>()..getUserInformation(),
                    ),
                  ],
                  child: const HomePage(),
                ),
            routes: [
              GoRoute(
                path: AppRoutes.notification.path,
                name: AppRoutes.notification.name,
                builder: (context, state) => const NotificationPage(),
              ),
              GoRoute(
                path: AppRoutes.createTask.path,
                name: AppRoutes.createTask.name,
                builder: (context, state) => ChangeNotifierProvider(
                    create: (context) => GetIt.instance<TaskNotifier>(), child: const CreateTaskView()),
              ),
              GoRoute(
                path: AppRoutes.profileEdit.path,
                name: AppRoutes.profileEdit.name,
                builder: (context, state) => ChangeNotifierProvider(
                  create: (context) => GetIt.instance<ProfileNotifier>(),
                  child: const ProfileEditView(),
                ),
              ),
              GoRoute(
                path: AppRoutes.profile.path,
                name: AppRoutes.profile.name,
                builder: (context, state) => ChangeNotifierProvider(
                  create: (context) => GetIt.instance<ProfileNotifier>()..getUserInformation(),
                  child: Scaffold(
                      appBar: AppBar(
                        backgroundColor: Colors.white,
                        centerTitle: true,
                        leading: IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: SvgPicture.asset(IconPath.arrowleft.toPathSvg)),
                        title: Text('Profil', style: context.typography.subtitle2Medium),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: IconButton(onPressed: () {}, icon: SvgPicture.asset(IconPath.menu.toPathSvg)),
                          )
                        ],
                      ),
                      body: const ProfileTab()),
                ),
              ),
            ]),
      ],
    );
  }
}
