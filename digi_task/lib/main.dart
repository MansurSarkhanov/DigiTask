import 'package:digi_task/bloc/theme/theme_scope.dart';
import 'package:digi_task/bloc/theme/theme_scope_widget.dart';
import 'package:digi_task/presentation/pages/login/login_page.dart';
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
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digi Task',
      theme: ThemeData(extensions: extensions),
      home: const LoginPage(),
    );
  }
}
