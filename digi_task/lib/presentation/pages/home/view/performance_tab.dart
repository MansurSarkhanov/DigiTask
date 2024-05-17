import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:flutter/material.dart';

class PerformanceTab extends StatefulWidget {
  const PerformanceTab({super.key});

  @override
  State<PerformanceTab> createState() => _PerformanceTabState();
}

class _PerformanceTabState extends State<PerformanceTab> with TickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          TabBar(
            labelColor: context.colors.primaryColor50,
            labelStyle: context.typography.subtitle2Medium,
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: context.colors.neutralColor80,
            indicatorColor: context.colors.primaryColor50,
            tabs: const [
              Tab(
                text: "Aylıq",
              ),
              Tab(text: "Son 3 ay"),
              Tab(text: "Son 6 ay"),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: context.colors.primaryColor50,
                          borderRadius:
                              const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Ad', style: context.typography.subtitle2SemiBold.copyWith(color: Colors.white)),
                            Text('Qrup', style: context.typography.subtitle2SemiBold.copyWith(color: Colors.white)),
                            Text('Tasklar', style: context.typography.subtitle2SemiBold.copyWith(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        color: Colors.white,
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0, right: 40, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Faiq Ə.',
                                        style: context.typography.subtitle2Regular
                                            .copyWith(color: context.colors.primaryColor50),
                                      ),
                                      Text(
                                        'Yasamal',
                                        style: context.typography.subtitle2Regular,
                                      ),
                                      Text(
                                        '36',
                                        style: context.typography.subtitle2SemiBold
                                            .copyWith(color: context.colors.primaryColor50),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: context.colors.neutralColor90,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
