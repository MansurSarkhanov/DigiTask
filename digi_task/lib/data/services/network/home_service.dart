import 'package:digi_task/data/model/response/performance_model.dart';
import 'package:digi_task/data/model/response/user_task_model.dart';
import 'package:digi_task/data/services/jwt/dio_configuration.dart';
import 'package:digi_task/features/tasks/data/model/task_model.dart';

final class HomeService {
  Future<UserTaskModel?> fetcUserTaskData() async {
    final response = await baseDio.get('services/mainpage/');
    if (response.statusCode! >= 200 && response.statusCode! <= 299) {
      final userTask = UserTaskModel.fromJson(response.data);
      return userTask;
    }
    return null;
  }

  Future<List<PerformanceModel>?> fetchPerformance() async {
    final response = await baseDio.get('services/performance/');
    if (response.statusCode! >= 200 && response.statusCode! <= 299) {
      final performanceList = response.data;
      if (performanceList is List) {
        return performanceList.map((e) => PerformanceModel.fromJson(e)).toList();
      }
    }
    return null;
  }

  Future<List<TaskModel>?> fetchTasks({String? query}) async {
    final response = query == null
        ? await baseDio.get('services/status/')
        : await baseDio.get(
            'services/status/',
            queryParameters: {'status': query},
          );
    if (response.statusCode! >= 200 && response.statusCode! <= 299) {
      final tasks = response.data;
      print("Tasks: $tasks");
      if (tasks is List) {
        return tasks.map((e) => TaskModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}
