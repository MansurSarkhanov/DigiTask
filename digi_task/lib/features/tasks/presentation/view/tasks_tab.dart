import 'package:digi_task/core/constants/path/icon_path.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/core/utility/extension/icon_path_ext.dart';
import 'package:digi_task/features/tasks/presentation/bloc/task_notifier.dart';
import 'package:digi_task/features/tasks/presentation/bloc/task_state.dart';
import 'package:digi_task/presentation/pages/home/widgets/user_task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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

  int selecteIndex = 0;
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
                    onPressed: () {
                      setState(() {
                        selecteIndex = index;
                      });
                      switch (index) {
                        case 0:
                          context.read<TaskNotifier>().fetchTasks();
                          break;
                        case 1:
                          context.read<TaskNotifier>().fetchTasks(query: "waiting");
                          break;
                        case 2:
                          context.read<TaskNotifier>().fetchTasks(query: "inprogress");
                          break;
                        case 3:
                          context.read<TaskNotifier>().fetchTasks(query: "completed");
                          break;
                      }
                    },
                    showCheckmark: false,
                    label: Text(texts[index]),
                    labelStyle: context.typography.overlineSemiBold
                        .copyWith(color: selecteIndex == index ? Colors.white : context.colors.primaryColor50),
                    labelPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    backgroundColor: Colors.white,
                    selectedColor: context.colors.primaryColor50,
                    selected: selecteIndex == index,
                    shape: const StadiumBorder(side: BorderSide(color: Colors.transparent))),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer<TaskNotifier>(
          builder: (context, notifier, child) {
            if (notifier.state is TaskProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (notifier.state is TaskSuccess) {
              final taskNotifier = notifier.state as TaskSuccess;
              return Expanded(
                child: ListView.builder(
                  itemCount: taskNotifier.tasks?.length,
                  itemBuilder: (context, index) {
                    final nowDateTime = DateTime.now();
                    final dateTime = DateTime.parse(taskNotifier.tasks?[index].date ?? '');
                    String formattedDate = DateFormat('MMM d').format(dateTime);
                    String nowFormattedDate = DateFormat('MMM d').format(nowDateTime);
                    return Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                        child: UserTaskCard(
                            iconRow: Row(
                              children: [
                                if (taskNotifier.tasks?[index].isInternet == true) ...[
                                  ServiceType(
                                    image: IconPath.internet.toPathSvg,
                                    title: "Internet",
                                  ),
                                ],
                                if (taskNotifier.tasks?[index].isTv == true) ...[
                                  ServiceType(
                                    image: IconPath.tv.toPathSvg,
                                    title: "Tv",
                                  ),
                                ],
                                if (taskNotifier.tasks?[index].isVoice == true) ...[
                                  ServiceType(
                                    image: IconPath.voice.toPathSvg,
                                    title: "Voice",
                                  ),
                                ],
                              ],
                            ),
                            name: taskNotifier.tasks?[index].firstName ?? 'Not found user',
                            time: formattedDate == nowFormattedDate
                                ? 'Bu gün, ${taskNotifier.tasks?[index].time}'
                                : '$formattedDate, ${taskNotifier.tasks?[index].time}',
                            location: taskNotifier.tasks?[index].location ?? '',
                            number: taskNotifier.tasks?[index].contactNumber ?? '',
                            status: taskNotifier.tasks?[index].status ?? '',
                            notifier: notifier));
                  },
                ),
              );
            }
            return const SizedBox.shrink();
          },
        )
      ],
    );
  }
}

class ServiceType extends StatelessWidget {
  const ServiceType({
    super.key,
    required this.image,
    required this.title,
  });
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Container(
        decoration: BoxDecoration(color: context.colors.secondaryColor60, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SvgPicture.asset(
                image,
                height: 16,
                width: 16,
                color: context.colors.neutralColor40,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                title,
                style: context.typography.overlineSemiBold.copyWith(color: context.colors.neutralColor40),
              )
            ],
          ),
        ),
      ),
    );
  }
}
