import 'package:digi_task/bloc/home/home_notifier.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/presentation/pages/home/view/tasks_tab.dart';
import 'package:digi_task/presentation/pages/home/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  String currentSectionText(String userName) {
    switch (tabController.index) {
      case 0:
        return userName;
      case 1:
        return "Performans";

      case 2:
        return "Tasklar";
      case 3:
        return "Profil";
      default:
        return "Error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeNotifier>().fetchUserTask();
        },
      ),
      backgroundColor: context.colors.backgroundColor,
      bottomNavigationBar: BottomNavBar(tabController: tabController),
      appBar: AppBar(
        backgroundColor: context.colors.neutralColor100,
        title: Text(
          currentSectionText("Xoş gəlmisən, ${context.read<HomeNotifier>().userTaskModel.firstName} !"),
          style: context.typography.subtitle1Medium,
        ),
        actions: const [NotificationIcon()],
      ),
      body: Consumer<HomeNotifier>(
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
