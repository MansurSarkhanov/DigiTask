import 'package:digi_task/data/model/failure/empty_task_model.dart';
import 'package:digi_task/features/tasks/data/model/task_model.dart';
import 'package:digi_task/features/tasks/data/service/task_network_service.dart';
import 'package:digi_task/injection.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../domain/repository/task_repository.dart';

final class TaskRepositoryImpl implements ITaskRepository {
  final _taskService = getIt.get<TaskNetworkService>();
  @override
  Future<Result<List<TaskModel>?, EmptyTaskModel>> getTasks({String? query}) async {
    try {
      final result = await _taskService.getTasks(query: query);
      return Result.success(result);
    } catch (e) {
      return Result.error(EmptyTaskModel(message: e.toString()));
    }
  }
}
