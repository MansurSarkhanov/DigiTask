import 'package:digi_task/core/constants/path/icon_path.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/core/utility/extension/icon_path_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContinueTasks extends StatefulWidget {
  const ContinueTasks({super.key});

  @override
  State<ContinueTasks> createState() => _ContinueTasksState();
}

class _ContinueTasksState extends State<ContinueTasks> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Davam edən tasklar',
              style: context.typography.subtitle2SemiBold,
            ),
            const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
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
                    SizedBox(
                      height: 40,
                      width: 70,
                      child: SvgPicture.asset(
                        IconPath.tv.toPathSvg,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      IconPath.location.toPathSvg,
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Yasamal, Mirzə Şərifzadə 14',
                      style: context.typography.body1SemiBold.copyWith(color: context.colors.primaryColor50),
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
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Bu gün, 16:00 - 18:00',
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
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '0555555555',
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
                          'Yolda',
                          style: context.typography.captionSemiBold.copyWith(color: context.colors.primaryColor50),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
