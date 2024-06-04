import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/features/performance/presentation/bloc/performance_notifier.dart';
import 'package:digi_task/presentation/components/custom_progress_indicator.dart';
import 'package:digi_task/presentation/pages/home/widgets/select_time_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/performance_state.dart';

class PerformanceTab extends StatefulWidget {
  const PerformanceTab({super.key});

  @override
  State<PerformanceTab> createState() => _PerformanceTabState();
}

class _PerformanceTabState extends State<PerformanceTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          const Row(
            children: [
              SelectTimeCard(),
              SizedBox(
                width: 16,
              ),
              SelectTimeCard(),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: context.colors.primaryColor50,
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ad     ', style: context.typography.subtitle2SemiBold.copyWith(color: Colors.white)),
                        Text('Qrup   ', style: context.typography.subtitle2SemiBold.copyWith(color: Colors.white)),
                        Text('Tasklar', style: context.typography.subtitle2SemiBold.copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Consumer<PerformanceNotifier>(
                  builder: (context, notifier, child) {
                    if (notifier.state is PerformanceLoading) {
                      return const Center(child: CustomProgressIndicator());
                    } else if (notifier.state is PerformanceSuccess) {
                      final performance = (notifier.state as PerformanceSuccess).performanceList;
                      return Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 40),
                          color: Colors.white,
                          child: ListView.builder(
                            itemCount: performance?.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0, right: 40, top: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${performance?[index].firstName}",
                                            maxLines: 1,
                                            style: context.typography.subtitle2Regular
                                                .copyWith(color: context.colors.primaryColor50),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${performance?[index].group?.group}",
                                            style: context.typography.subtitle2Regular,
                                          ),
                                        ),
                                        Text(
                                          "${performance?[index].taskCount?.total}",
                                          style: context.typography.subtitle2SemiBold
                                              .copyWith(color: context.colors.primaryColor50),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: context.colors.neutralColor90,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
