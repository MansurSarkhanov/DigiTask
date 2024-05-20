import 'package:digi_task/data/model/response/user_task_model.dart';
import 'package:dio/dio.dart';

import '../../../core/constants/app_keys.dart';

final class HomeService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppKeys.baseUrl,
      contentType: 'application/json',
    ),
  );
  Future<UserTaskModel?> fetcUserTaskData(String? token) async {
    final response = await dio.get(
      'services/mainpage/',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    if (response.statusCode! >= 200 && response.statusCode! <= 299) {
      final userTask = UserTaskModel.fromJson(response.data);
      return userTask;
    }
    return null;
  }
}
