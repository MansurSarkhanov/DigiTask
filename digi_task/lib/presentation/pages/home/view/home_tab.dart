import 'package:digi_task/bloc/home/main/main_notifier.dart';
import 'package:digi_task/bloc/home/main/main_state.dart';
import 'package:digi_task/core/constants/path/icon_path.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/core/utility/extension/icon_path_ext.dart';
import 'package:digi_task/features/tasks/presentation/view/tasks_tab.dart';
import 'package:digi_task/presentation/pages/home/widgets/tasks_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../features/performance/presentation/bloc/performance_notifier.dart';
import '../../../../features/performance/presentation/bloc/performance_state.dart';
import '../widgets/component_title.dart';
import '../widgets/organizations_card.dart';
import '../widgets/user_task_card.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key, required this.state});

  final MainState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: switch (state) {
        MainLoading() => const Center(child: CircularProgressIndicator()),
        MainError() => const Center(
            child: Text("Error"),
          ),
        MainSuccess() => Builder(builder: (_) {
            final successState = state as MainSuccess;
            return RefreshIndicator(
              onRefresh: () async {
                await context.read<MainNotifier>().fetchUserTask();
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "12 May",
                      style: context.typography.subtitle2SemiBold,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TasksCard(
                      taskDetails: successState.taskDetails,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ComponentTitle(
                      title: 'Davam edən tasklar',
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Consumer<MainNotifier>(
                      builder: (context, notifier, child) {
                        if (notifier.userTaskModel?.ongoingTasks?.isNotEmpty ?? false) {
                          final nowDateTime = DateTime.now();
                          final dateTime = DateTime.parse(notifier.userTaskModel?.ongoingTasks?.first.date ?? '');
                          String formattedDate = DateFormat('MMM d').format(dateTime);
                          String nowFormattedDate = DateFormat('MMM d').format(nowDateTime);

                          return UserTaskCard(
                            iconRow: Row(
                              children: [
                                if (notifier.userTaskModel?.ongoingTasks?.first.isInternet == true) ...[
                                  ServiceType(
                                    image: IconPath.internet.toPathSvg,
                                    title: "Internet",
                                  ),
                                ],
                                if (notifier.userTaskModel?.ongoingTasks?.first.isTv == true) ...[
                                  ServiceType(
                                    image: IconPath.tv.toPathSvg,
                                    title: "Tv",
                                  ),
                                ],
                                if (notifier.userTaskModel?.ongoingTasks?.first.isVoice == true) ...[
                                  ServiceType(
                                    image: IconPath.voice.toPathSvg,
                                    title: "Voice",
                                  ),
                                ]
                              ],
                            ),
                            location: notifier.userTaskModel?.ongoingTasks?.first.location ?? '',
                            name: notifier.userTaskModel?.ongoingTasks?.first.firstName ?? '',
                            number: notifier.userTaskModel?.ongoingTasks?.first.contactNumber ?? '',
                            status: notifier.userTaskModel?.ongoingTasks?.first.status ?? '',
                            time: formattedDate == nowFormattedDate
                                ? "Bu gün, ${notifier.userTaskModel?.ongoingTasks?.first.time ?? ''}"
                                : "$formattedDate, ${notifier.userTaskModel?.ongoingTasks?.first.time ?? ''}",
                            notifier: notifier,
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ComponentTitle(
                      title: 'Tədbirlər',
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const OrganizationsCard(),
                    const SizedBox(
                      height: 24,
                    ),
                    if (context.watch<MainNotifier>().isAdmin) ...[
                      ComponentTitle(
                        title: 'Texniklərin performansı',
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Consumer<PerformanceNotifier>(
                        builder: (context, notifier, child) {
                          if (notifier.state is PerformanceLoading) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (notifier.state is PerformanceSuccess) {
                            final performance = (notifier.state as PerformanceSuccess).performanceList;
                            return Container(
                                margin: const EdgeInsets.only(bottom: 24),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: context.colors.primaryColor50,
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Ad     ',
                                                style:
                                                    context.typography.subtitle2SemiBold.copyWith(color: Colors.white)),
                                            Text('Qrup   ',
                                                style:
                                                    context.typography.subtitle2SemiBold.copyWith(color: Colors.white)),
                                            Text('Tasklar',
                                                style:
                                                    context.typography.subtitle2SemiBold.copyWith(color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                        children: performance!
                                            .map(
                                              (e) => Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 16.0, right: 40, top: 10),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "${e.firstName}",
                                                            maxLines: 1,
                                                            style: context.typography.subtitle2Regular
                                                                .copyWith(color: context.colors.primaryColor50),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            "${e.group?.group}",
                                                            style: context.typography.subtitle2Regular,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${e.taskCount?.total}",
                                                          style: context.typography.subtitle2SemiBold
                                                              .copyWith(color: context.colors.primaryColor50),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: context.colors.neutralColor90,
                                                    height: 12,
                                                  )
                                                ],
                                              ),
                                            )
                                            .toList()),
                                  ],
                                ));
                          }
                          return const SizedBox.shrink();
                        },
                      )
                    ]
                  ],
                ),
              ),
            );
          }),
        _ => const SizedBox.shrink()
      },
    );
  }
}

