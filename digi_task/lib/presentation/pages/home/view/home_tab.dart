import 'package:digi_task/bloc/home/main/main_notifier.dart';
import 'package:digi_task/bloc/home/main/main_state.dart';
import 'package:digi_task/core/constants/path/icon_path.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/core/utility/extension/icon_path_ext.dart';
import 'package:digi_task/presentation/pages/home/widgets/tasks_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      child: (state is MainLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
            const TasksCard(),
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
                  Consumer<MainNotifier>(builder: (context, notifier, child) {
                    return UserTaskCard(
                      iconRow: Row(
                        children: [
                          if (notifier.userTaskModel?.ongoingTasks?.first.isInternet == true) ...[
                            SizedBox(
                              height: 40,
                              width: 110,
                              child: SvgPicture.asset(
                                IconPath.internet.toPathSvg,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            )
                          ],
                          if (notifier.userTaskModel?.ongoingTasks?.first.isTv == true) ...[
                            SizedBox(
                              height: 40,
                              width: 70,
                              child: SvgPicture.asset(
                                IconPath.tv.toPathSvg,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            )
                          ],
                          if (notifier.userTaskModel?.ongoingTasks?.first.isVoice == true) ...[
                            SizedBox(
                              height: 40,
                              width: 70,
                              child: SvgPicture.asset(
                                IconPath.voice.toPathSvg,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            )
                          ]
                        ],
                      ),
                      location: notifier.userTaskModel?.ongoingTasks?.first.location ?? '',
                      name: '',
                      number: notifier.userTaskModel?.ongoingTasks?.first.contactNumber ?? '',
                      status: notifier.userTaskModel?.ongoingTasks?.first.status ?? '',
                      time: notifier.userTaskModel?.ongoingTasks?.first.time ?? '',
                      notifier: notifier,
                    );
                  }),
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
            const OrganizationsCard()
          ],
        ),
      ),
    );
  }
}
