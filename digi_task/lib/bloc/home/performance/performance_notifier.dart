import 'package:digi_task/bloc/home/performance/performance_state.dart';
import 'package:flutter/material.dart';

import '../../../data/repository/home_repository.dart';

class PerformanceNotifier extends ChangeNotifier {
  PerformanceState state = PerformanceInitial();
  final HomeRepository _homeRepository = HomeRepository();
  Future<void> fetchPerfomance() async {
    state = PerformanceLoading();
    notifyListeners();
    final result = await _homeRepository.fetchPerformances();
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
