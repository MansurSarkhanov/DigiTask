import 'package:digi_task/core/constants/path/image_paths.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/core/utility/extension/image_path_ext.dart';
import 'package:flutter/material.dart';

class OrganizationsCard extends StatelessWidget {
  const OrganizationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
              context.colors.primaryColor80,
              context.colors.primaryColor70,
              context.colors.primaryColor60,
              context.colors.primaryColor50,
              context.colors.primaryColor30,
            ]),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.schedule,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Günü və saatı',
                              style: context.typography.body1SemiBold.copyWith(color: context.colors.neutralColor100),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Tədbir adı',
                          style: context.typography.h6SemiBold.copyWith(color: context.colors.neutralColor100),
                        ),
                      ],
                    ),
                    Image.asset(
                      ImagePath.cardinfo.toPathPng,
                      height: 130,
                      width: 130,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Keçirələcəyi yer',
                      style: context.typography.subtitle2SemiBold.copyWith(color: context.colors.neutralColor100),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
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
