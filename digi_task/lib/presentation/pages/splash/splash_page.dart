import 'package:digi_task/core/constants/strings/splash_strings.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primaryColor60,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(90.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/im_logo.png'),
              const SizedBox(height: 24),
              Text(
                SplashStrings.splashTitle,
                style: context.typography.h4SemiBold.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
