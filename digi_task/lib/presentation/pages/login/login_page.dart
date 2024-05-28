import 'package:digi_task/bloc/auth/login/login_notifier.dart';
import 'package:digi_task/core/constants/routes.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/presentation/components/button/login_button.dart';
import 'package:digi_task/presentation/components/input/custom_form_filed.dart';
import 'package:digi_task/presentation/components/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../bloc/auth/login/login_state.dart';
import '../../components/flushbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<LoginNotifier>().addListener(() {
      final loginState = context.read<LoginNotifier>().state;
      if (loginState is LoginSuccess) {
        context.goNamed(AppRoutes.home.name);
      } else if (loginState is LoginFailure) {
        openFlushbar(context, loginState);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.neutralColor100,
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
              CustomFormField(
                controller: emailController,
                title: 'Mail adresiniz',
                hintText: "Mail adresiniz",
                icon: Icons.mail_outline,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormField(
                controller: passwordController,
                title: 'Şifrəniz',
                hintText: "*****",
                icon: Icons.key_outlined,
              ),
              const Spacer(),
              Consumer<LoginNotifier>(
                builder: (context, notifier, child) {
                  return LoginButton(
                    isLoading: (notifier.state is LoginProgress) ? true : false,
                    onPressed: () {
                      FocusManager.instance.primaryFocus!.unfocus();
                      notifier.loginUser(email: emailController.text, password: passwordController.text);
                    },
                  );
                },
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
