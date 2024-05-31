import 'package:digi_task/features/tasks/data/model/task_model.dart';

import '../../../../data/services/jwt/dio_configuration.dart';

abstract class ITaskNetworkService {
  Future<List<TaskModel>> getTasks();
}

final class TaskNetworkService implements ITaskNetworkService {
  @override
  Future<List<TaskModel>> getTasks({String? query}) async {
    try {
      final response = query != null
          ? await baseDio.get('services/status/', queryParameters: {"status": query})
          : await baseDio.get('services/status/');
      final tasks = response.data;
      return tasks.map((e) => TaskModel.fromJson(e)).toList();
    } catch (e, s) {
      return Error.throwWithStackTrace(e, s);
    }
  }
}
