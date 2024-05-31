import 'package:digi_task/data/model/failure/user_task_failure.dart';
import 'package:digi_task/data/model/response/tasks_model.dart';
import 'package:digi_task/data/model/response/user_task_model.dart';
import 'package:digi_task/data/services/network/home_service.dart';
import 'package:digi_task/injection.dart';
import 'package:multiple_result/multiple_result.dart';

import '../model/failure/empty_performance_failure.dart';
import '../model/response/performance_model.dart';

abstract interface class IHomeRepository {
  Future<Result<UserTaskModel, UserTaskFailure>> fetchUserTaskData();
  Future<Result<List<PerformanceModel>, EmptyPerformanceFailure>> fetchPerformances();
  Future<Result<List<TasksModel>, EmptyPerformanceFailure>> fetchTasks();



}

final class HomeRepository implements IHomeRepository {
  final _homeDataSource = getIt.get<HomeService>();

  @override
  Future<Result<UserTaskModel, UserTaskFailure>> fetchUserTaskData() async {
    try {
      final result = await _homeDataSource.fetcUserTaskData();
      return Result.success(result!);
    } catch (e) {
      return Result.error(UserTaskFailure());
    }
  }

  @override
  Future<Result<List<PerformanceModel>, EmptyPerformanceFailure>> fetchPerformances() async {
    try {
      final result = await _homeDataSource.fetchPerformance();
      return Result.success(result!);
    } catch (e) {
      return Result.error(EmptyPerformanceFailure());
    }
  }
  
  @override
  Future<Result<List<TasksModel>, EmptyPerformanceFailure>> fetchTasks({String? queryTask}) async {
    try {
      final result = await _homeDataSource.fetchTasks(query: queryTask);
      return Result.success(result!);
    } catch (e) {
      return Result.error(EmptyPerformanceFailure());
    }
  }
}
