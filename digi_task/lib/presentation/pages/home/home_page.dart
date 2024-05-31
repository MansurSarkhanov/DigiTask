import 'package:digi_task/bloc/home/main/main_notifier.dart';
import 'package:digi_task/core/constants/path/icon_path.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/core/utility/extension/icon_path_ext.dart';
import 'package:digi_task/presentation/pages/home/view/tasks_tab.dart';
import 'package:digi_task/presentation/pages/home/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/routes.dart';
import 'view/home_tab.dart';
import 'view/performance_tab.dart';
import 'view/profile_tab.dart';
import 'widgets/notification_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);

    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentSectionText() {
      switch (tabController.index) {
        case 0:
          return "Xoş gəlmisən, ${context.watch<MainNotifier>().userTaskModel?.firstName} !";
        case 1:
          return "Performans";

        case 2:
          return "Tapşırıq";
        case 3:
          return "Profil";
        default:
          return "Error";
      }
    }

    return Scaffold(
      backgroundColor: context.colors.backgroundColor,
      bottomNavigationBar: BottomNavBar(tabController: tabController),
      appBar: AppBar(
        backgroundColor: context.colors.neutralColor100,
        title: Text(
          currentSectionText(),
          style: context.typography.subtitle1Medium,
        ),
        actions: [
          AppBarIcon(
            iconPath: IconPath.message.toPathSvg,
            onTap: () {},
          ),
          const SizedBox(
            width: 14,
          ),
          AppBarIcon(
            iconPath: IconPath.notification.toPathSvg,
            onTap: () => context.goNamed(AppRoutes.notification.name),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Consumer<MainNotifier>(
        builder: (context, notifier, child) {
          return TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              HomeTabView(
                state: notifier.homeState,
              ),
              const PerformanceTab(),
              const TasksTab(),
              const ProfileTab(),
            ],
          );
        },
      ),
    );
  }
}
