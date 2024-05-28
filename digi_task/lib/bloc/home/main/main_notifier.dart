import 'package:digi_task/bloc/home/main/main_state.dart';
import 'package:digi_task/data/model/response/performance_model.dart';
import 'package:digi_task/data/model/response/user_task_model.dart';
import 'package:digi_task/data/repository/home_repository.dart';
import 'package:flutter/foundation.dart';

class MainNotifier extends ChangeNotifier {
  MainState homeState = MainInitial();
  final HomeRepository _homeRepository = HomeRepository();
  List<PerformanceModel>? performanceModel;

  UserTaskModel? userTaskModel;

  Future<void> fetchUserTask() async {
    homeState = MainLoading();
    notifyListeners();
    final result = await _homeRepository.fetchUserTaskData();

    if (result.isSuccess()) {
      userTaskModel = result.tryGetSuccess();
      homeState = MainSuccess();
      notifyListeners();
    } else if (result.isError()) {
      homeState = MainError();
      notifyListeners();
    } else {
      homeState = MainError();
      notifyListeners();
    }
  }
}
