import 'package:digi_task/core/constants/routes.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/presentation/components/button/login_button.dart';
import 'package:digi_task/presentation/components/input/custom_form_filed.dart';
import 'package:digi_task/presentation/components/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const LogoWidget(height: 116, width: 134),
              const SizedBox(
                height: 24,
              ),
              const CustomFormField(
                title: 'Mail adresiniz',
                hintText: "Mail adresiniz",
                icon: Icons.mail_outline,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomFormField(
                title: 'Şifrəniz',
                hintText: "*****",
                icon: Icons.key_outlined,
              ),
              const Spacer(),
              LoginButton(
                onPressed: () {},
              ),
              TextButton(
                onPressed: () {
                  context.goNamed(AppRoutes.resetPassword.name);
                },
                child: Text(
                  "Şifrəni unutmusunuz?",
                  style: context.typography.body2Regular.copyWith(
                      color: context.colors.primaryColor50,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: context.colors.primaryColor50),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
