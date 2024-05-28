import 'package:digi_task/data/model/response/performance_model.dart';
import 'package:digi_task/data/model/response/user_task_model.dart';
import 'package:digi_task/data/services/jwt/dio_configuration.dart';

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
      print('performanceList: $performanceList');
      if (performanceList is List) {
        return performanceList.map((e) => PerformanceModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}
