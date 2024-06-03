import 'package:digi_task/core/constants/path/icon_path.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/core/utility/extension/icon_path_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserTaskCard extends StatelessWidget {
  const UserTaskCard(
      {super.key,
      required this.name,
      required this.time,
      required this.location,
      required this.number,
      required this.status,
      required this.notifier,
      required this.iconRow});
  final String name;
  final String time;
  final String location;
  final String number;
  final String status;
  final dynamic notifier;
  final Widget iconRow;

  @override
  Widget build(BuildContext context) {
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
                  name,
                  style: context.typography.subtitle1SemiBold,
                ),
                iconRow
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
                    location,
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
                  color: context.colors.neutralColor50,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  time,
                  style: context.typography.body1SemiBold.copyWith(color: context.colors.neutralColor50),
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
                  IconPath.phonegreen.toPathSvg,
                  height: 18,
                  width: 18,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  number,
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
                      status,
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
