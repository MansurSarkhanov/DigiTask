import 'package:flutter/material.dart';

import '../../../data/repository/home_repository.dart';
import 'task_state.dart';

class TaskNotifier extends ChangeNotifier {
  TasksState state = TasksInitial();
  final _homeRepository = HomeRepository();

  Future<void> fetchTasks({String? query}) async {
    state = TasksLoading();
    notifyListeners();
    final result = await _homeRepository.fetchTasks(queryTask: query);
    if (result.isSuccess()) {
      final tasks = result.tryGetSuccess();
      state = TasksSuccess(tasks: tasks);
      notifyListeners();
    } else if (result.isError()) {
      state = TasksError();
      notifyListeners();
    } else {
      state = TasksError();
      notifyListeners();
    }
  }
}
