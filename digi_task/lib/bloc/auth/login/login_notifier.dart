import 'package:digi_task/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';

import 'login_state.dart';

class LoginNotifier extends ChangeNotifier {
  LoginState state = LoginInitial();
  final AuthRepository _authRepository = AuthRepository();

  Future<void> loginUser({required String email, required String password}) async {
    state = LoginProgress();
    notifyListeners();
    final result = await _authRepository.login(email: email, password: password);

    if (result.isSuccess()) {
      state = LoginSuccess();
      notifyListeners();
    } else {
      final errorMessage = result.tryGetError()!.detail ?? 'Failed to login';
      state = LoginFailure(message: errorMessage);
      notifyListeners();
    }
  }
}
