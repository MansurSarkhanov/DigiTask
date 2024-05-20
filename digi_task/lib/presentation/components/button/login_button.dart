import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/strings/onboarding_strings.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });
  final VoidCallback onPressed;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return context.colors.primaryColor70;
          }
          return context.colors.primaryColor50;
        }),
      ),
      onPressed: onPressed,
      child: Center(
        child: isLoading == true
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
          OnboardingStrings.login,
          style: context.typography.captionRegular.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
