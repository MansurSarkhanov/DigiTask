import 'package:digi_task/bloc/home/main/main_notifier.dart';
import 'package:digi_task/core/constants/path/icon_path.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/core/utility/extension/icon_path_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../bloc/home/main/main_state.dart';

class UserTaskCard extends StatefulWidget {
  const UserTaskCard({super.key});

  @override
  State<UserTaskCard> createState() => _UserTaskCardState();
}

class _UserTaskCardState extends State<UserTaskCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainNotifier>(builder: (context, notifier, child) {
      if (notifier.homeState is MainSuccess) {
        if (notifier.userTaskModel?.ongoingTasks?.isNotEmpty ?? false) {
          final dateTime = DateTime.parse(notifier.userTaskModel?.ongoingTasks?.first.date ?? '2024-05-20');
          final nowTime = DateTime.now();
          String nowFormattedDate = DateFormat('MMM d').format(nowTime);
          String formattedDate = DateFormat('MMM d').format(dateTime);
        
    
       
          return Container(
            decoration: BoxDecoration(
              color: context.colors.neutralColor100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ayxan O.',
                        style: context.typography.subtitle1SemiBold,
                      ),
                      if (notifier.userTaskModel?.ongoingTasks?.isNotEmpty ?? false) ...[
                        Row(
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
                        )
                      ]
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        IconPath.location.toPathSvg,
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          '${notifier.userTaskModel?.ongoingTasks?.first.location}',
                          overflow: TextOverflow.ellipsis,
                          style: context.typography.body1SemiBold.copyWith(color: context.colors.primaryColor50),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        IconPath.clock.toPathSvg,
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        formattedDate == nowFormattedDate
                            ? 'Bu gün, ${notifier.userTaskModel?.ongoingTasks?.first.time}'
                            : '$formattedDate, ${notifier.userTaskModel?.ongoingTasks?.first.time}',
                        style: context.typography.body1SemiBold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        IconPath.phone.toPathSvg,
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${notifier.userTaskModel?.ongoingTasks?.first.contactNumber}',
                        style: context.typography.body1SemiBold.copyWith(color: context.colors.successColor60),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: context.colors.primaryColor50, width: 1.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 10),
                          child: Text(
                            "${notifier.userTaskModel?.ongoingTasks?.first.status}",
                            style: context.typography.captionSemiBold.copyWith(color: context.colors.primaryColor50),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }
      }
      return const SizedBox.shrink();
    });
  }
}
