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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Davam edən tasklar',
                          style: context.typography.subtitle2Medium,
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tədbirlər',
                          style: context.typography.subtitle2Medium,
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const OrganizationsCard(),
                    const SizedBox(
                      height: 24,
                    ),
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
