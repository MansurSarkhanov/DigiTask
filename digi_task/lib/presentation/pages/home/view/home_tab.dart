import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/presentation/pages/home/widgets/tasks_card.dart';
import 'package:flutter/material.dart';

class HomeTaView extends StatelessWidget {
  const HomeTaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "12 May",
            style: context.typography.subtitle2SemiBold,
          ),
          const SizedBox(
            height: 16,
          ),
          const TasksCard()
        ],
      ),
    );
  }
}
