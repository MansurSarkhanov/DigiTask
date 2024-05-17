import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/presentation/pages/home/widgets/tasks_card.dart';
import 'package:flutter/material.dart';

import '../widgets/organizations_card.dart';
import '../widgets/user_task_card.dart';

class HomeTaView extends StatelessWidget {
  const HomeTaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
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
            const UserTaskCard(),
            const SizedBox(
              height: 24,
            ),
            const OrganizationsCard()
          ],
        ),
      ),
    );
  }
}
