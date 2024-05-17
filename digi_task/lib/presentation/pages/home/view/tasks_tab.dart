import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/presentation/pages/home/widgets/user_task_card.dart';
import 'package:flutter/material.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> with TickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: TabBar(
            labelColor: context.colors.primaryColor50,
            labelStyle: context.typography.subtitle2Medium,
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: context.colors.neutralColor80,
            indicatorColor: context.colors.primaryColor50,
            tabs: const [
              Tab(
                text: "Qoşulmalar",
              ),
              Tab(text: "Problemlər"),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(

                padding: const EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  final texts = ['Hamisi', 'Gözləmədə olan', 'Qəbul edilən', 'Keçmiş'];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: RawChip(
                        showCheckmark: false,
                        label: Text(texts[index]),
                        labelStyle: context.typography.overlineSemiBold
                            .copyWith(color: index == 0 ? Colors.white : context.colors.primaryColor50),
                        labelPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        backgroundColor: Colors.white,
                        selectedColor: context.colors.primaryColor50,
                        selected: index == 0 ? true : false,
                        shape: const StadiumBorder(side: BorderSide(color: Colors.transparent))),
                  );
                },
              ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                child: UserTaskCard(),
              );
            },
          ),
        )
      ],
    );
  }
}
