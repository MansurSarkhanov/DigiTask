import 'package:digi_task/features/performance/data/repository/performance_repository_impl.dart';
import 'package:digi_task/features/performance/presentation/bloc/performance_state.dart';
import 'package:flutter/material.dart';

class PerformanceNotifier extends ChangeNotifier {
  PerformanceState state = PerformanceInitial();
  final _performanceRepository = PerformanceRepositoryImpl();
  Future<void> fetchPerfomance() async {
    state = PerformanceLoading();
    notifyListeners();
    final result = await _performanceRepository.getPerformance();
    if (result.isSuccess()) {
      final performanceModel = result.tryGetSuccess();
      state = PerformanceSuccess(performanceList: performanceModel);
      notifyListeners();
    } else if (result.isError()) {
      state = PerformanceError();
      notifyListeners();
    } else {
      state = PerformanceError();
      notifyListeners();
    }
  }
}
