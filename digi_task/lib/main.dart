import 'package:digi_task/app_router.dart';
import 'package:digi_task/bloc/theme/theme_scope.dart';
import 'package:digi_task/bloc/theme/theme_scope_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    const ThemeScopeWidget(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeScope.of(context);
    final extensions = <ThemeExtension<dynamic>>[theme.appColors, theme.appTypography];
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent, 
    ));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Digi Task',
      theme: ThemeData(extensions: extensions),
      routerConfig: appRouter,
    );
  }
}
