import 'package:digi_task/bloc/home/home_state.dart';
import 'package:digi_task/data/model/response/user_task_model.dart';
import 'package:digi_task/data/repository/home_repository.dart';
import 'package:flutter/foundation.dart';

class HomeNotifier extends ChangeNotifier {
  HomeState homeState = HomeInitial();
  final HomeRepository _homeRepository = HomeRepository();
  UserTaskModel userTaskModel = UserTaskModel();

  Future<void> fetchUserTask() async {
    homeState = HomeLoading();
    notifyListeners();
    final result = await _homeRepository.fetchUserTaskData();

    if (result.isSuccess()) {
      userTaskModel = result.tryGetSuccess()!;
      homeState = HomeSuccess();
      notifyListeners();
    } else if (result.isError()) {
      homeState = HomeError();
      notifyListeners();
    } else {
      homeState = HomeError();
      notifyListeners();
    }
  }
}
