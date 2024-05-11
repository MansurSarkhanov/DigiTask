import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/strings/onboarding_strings.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return context.colors.primaryColor70;
          }
          return context.colors.primaryColor50;
        }),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          OnboardingStrings.login,
          style: context.typography.captionRegular.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
