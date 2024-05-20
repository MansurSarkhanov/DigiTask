import 'package:digi_task/data/model/response/user_task_model.dart';
import 'package:digi_task/data/services/local/secure_service.dart';
import 'package:digi_task/data/services/network/home_service.dart';
import 'package:digi_task/injection.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class IHomeRepository {
  Future<Result<UserTaskModel, Exception>> fetchUserTaskData();
}

final class HomeRepository implements IHomeRepository {
  final _homeDataSource = getIt.get<HomeService>();
  final _secureStorage = getIt.get<SecureService>();

  @override
  Future<Result<UserTaskModel, Exception>> fetchUserTaskData() async {
    try {
      final token = await _secureStorage.token;
      final result = await _homeDataSource.fetcUserTaskData(token);
      return Result.success(result!);
    } catch (e) {
      return Result.error(Exception());
    }
  }
}
