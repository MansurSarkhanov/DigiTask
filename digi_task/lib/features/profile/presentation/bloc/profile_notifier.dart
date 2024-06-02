import 'package:digi_task/features/profile/data/repository/profile_repository_impl.dart';
import 'package:digi_task/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter/material.dart';

class ProfileNotifier extends ChangeNotifier {
  ProfileState state = ProfileInitial();
  final _profileRepository = ProfileRepositoryImpl();
  Future<void> getUserInformation() async {
    state = ProfileProgress();
    notifyListeners();
    final result = await _profileRepository.getUserInformation();
    if (result.isSuccess()) {
      final userModel = result.tryGetSuccess();

      state = ProfileSuccess(userModel: userModel!);
      notifyListeners();
    } else {
      state = ProfileFailure();
      notifyListeners();
    }
  }
}
