import 'package:digi_task/core/constants/path/icon_path.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/core/utility/extension/icon_path_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      bottomNavigationBar: SafeArea(
        child: TabBar(
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          padding: const EdgeInsets.only(bottom: 8),
          controller: tabController,
          labelPadding: EdgeInsets.zero,
          labelStyle: context.typography.overlineSemiBold.copyWith(color: context.colors.neutralColor40),
          tabs: [
            Tab(
              text: "Ana səhifə",
              icon: SvgPicture.asset(
                IconPath.home.toPathSvg,
                height: 22,
                width: 22,
              ),
            ),
            Tab(
              text: "Performans",
              icon: SvgPicture.asset(
                IconPath.performance.toPathSvg,
                height: 22,
                width: 22,
              ),
            ),
            Tab(
              text: "Tasklar",
              icon: SvgPicture.asset(
                IconPath.task.toPathSvg,
                height: 22,
                width: 22,
              ),
            ),
            Tab(
              text: "Profil",
              icon: SvgPicture.asset(
                IconPath.profile.toPathSvg,
                height: 22,
                width: 22,
              ),
            ),
          ],
        ),
      ),
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
