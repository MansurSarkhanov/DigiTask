import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/presentation/pages/home/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundColor,
      bottomNavigationBar: BottomNavBar(tabController: tabController),
      appBar: AppBar(
        backgroundColor: context.colors.neutralColor100,
        title: Text(
          'Xoş gəlmisiniz !',
          style: context.typography.h5Medium,
        ),
        actions: const [NotificationIcon()],
      ),
    );
  }
}
