import 'package:digi_task/data/model/response/user_task_model.dart';
import 'package:digi_task/data/services/jwt/dio_configuration.dart';

final class HomeService {
  Future<UserTaskModel?> fetcUserTaskData(String? token) async {
    final response = await crudDio.get('services/mainpage/');
    if (response.statusCode! >= 200 && response.statusCode! <= 299) {
      final userTask = UserTaskModel.fromJson(response.data);
      print(response.data);
      return userTask;
    }
    return null;
  }
}
  //  dio.get(
    //   'services/mainpage/',
    //   options: Options(
    //     headers: {
    //       'Authorization':
    //           'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE2MjMzNjIxLCJpYXQiOjE3MTYyMzMwMjEsImp0aSI6IjI0NGJkZWFiMGU3NTRkMTdiMDdhYTg0MWIxNDQzMGFlIiwidXNlcl9pZCI6MX0.tRksqWkxAaNwIQ-nHB9S55OYe8963QQI05NyJ7ernOg',
    //     },
    //   ),
    // );