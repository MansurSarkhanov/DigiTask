import 'package:digi_task/features/performance/data/model/performance_model.dart';
import 'package:digi_task/features/performance/data/service/performance_network_service.dart';
import 'package:digi_task/features/performance/domain/repository/performance_repository.dart';
import 'package:digi_task/injection.dart';
import 'package:multiple_result/multiple_result.dart';

class PerformanceRepositoryImpl implements PerformanceRepository {
  final _performanceService = getIt.get<PerformanceNetworkService>();
  @override
  Future<Result<List<PerformanceModel>?, Exception>> getPerformance() async {
    try {
      final result = await _performanceService.getPerformance();
      return Result.success(result!);
    } catch (e) {
      return Result.error(Exception(e));
    }
  }
}
