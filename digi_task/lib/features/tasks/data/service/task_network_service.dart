import 'package:digi_task/features/tasks/data/model/create_task_model.dart';
import 'package:digi_task/features/tasks/data/model/task_model.dart';

import '../../../../data/services/jwt/dio_configuration.dart';

abstract class ITaskNetworkService {
  Future<List<TaskModel>> getTasks();
  Future<bool> createTask({required CreateTaskModel model});
}

final class TaskNetworkService implements ITaskNetworkService {
  @override
  Future<List<TaskModel>> getTasks({String? query}) async {
    try {
      final response = query != null
          ? await baseDio.get('services/status/', queryParameters: {"status": query})
          : await baseDio.get('services/status/');
      final tasks = response.data as List;
      print(tasks);

      final taskList = tasks.map((e) => TaskModel.fromJson(e)).toList();
      return taskList;
    } catch (e, s) {
      return Error.throwWithStackTrace(e, s);
    }
  }

  @override
  Future<bool> createTask({required CreateTaskModel model}) async {
    try {
      final taskModel = model.toJson();
      final response = await baseDio.post('services/create_task/', data: taskModel);
      print(response);
      return true;
    } catch (e, s) {
      return Error.throwWithStackTrace(e, s);
    }
  }
}
