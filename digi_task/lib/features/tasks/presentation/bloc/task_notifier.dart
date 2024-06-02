import 'package:digi_task/features/tasks/data/repository/task_repository_impl.dart';
import 'package:flutter/material.dart';

import 'task_state.dart';

class TaskNotifier extends ChangeNotifier {
  TaskState state = TaskInitial();
  final _taskRepository = TaskRepositoryImpl();

  Future<void> fetchTasks({String? query}) async {
    state = TaskProgress();
    notifyListeners();
    final result = await _taskRepository.getTasks(query: query);
    if (result.isSuccess()) {
      final tasks = result.tryGetSuccess();
      state = TaskSuccess(tasks: tasks);
      notifyListeners();
    } else if (result.isError()) {
      state = TaskFailure();
      notifyListeners();
    } else {
      state = TaskFailure();
      notifyListeners();
    }
  }
}
