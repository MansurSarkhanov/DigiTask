import 'package:another_flushbar/flushbar.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:flutter/material.dart';

void openFlushbar(BuildContext context, state) {
  Flushbar(
    animationDuration: const Duration(milliseconds: 800),
    backgroundColor: Colors.transparent,
    flushbarPosition: FlushbarPosition.TOP,
    titleText: Text(
      "Auth Error",
      style: context.typography.body1SemiBold,
    ),
    messageText: Text(
      state.message,
      style: context.typography.body2Medium,
    ),
    titleColor: context.colors.primaryColor50,
    message: state.message,
    borderColor: context.colors.primaryColor50,
    borderRadius: BorderRadius.circular(16),
    margin: const EdgeInsets.all(20),
    duration: const Duration(seconds: 3),
  ).show(context);
}
