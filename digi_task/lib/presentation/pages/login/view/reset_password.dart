import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/presentation/components/button/login_button.dart';
import 'package:digi_task/presentation/components/input/custom_form_filed.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
        centerTitle: true,
        title: Text(
          'Şifrəni yenilə',
          style: context.typography.subtitle1Medium.copyWith(color: context.colors.neutralColor10),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Mail adresinizi daxil edin.',
                style: context.typography.subtitle2Medium.copyWith(color: context.colors.neutralColor40),
              ),
              const SizedBox(height: 24),
              const CustomFormField(title: 'Mail adresiniz', icon: Icons.mail_outline, hintText: 'Mail adresiniz'),
              const SizedBox(height: 80),
              LoginButton(
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
