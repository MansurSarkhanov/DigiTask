import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/core/utility/extension/icon_path_ext.dart';
import 'package:digi_task/features/tasks/data/model/create_task_model.dart';
import 'package:digi_task/features/tasks/presentation/bloc/task_notifier.dart';
import 'package:digi_task/features/tasks/presentation/view/widgets/select_service_card.dart';
import 'package:digi_task/presentation/components/button/login_button.dart';
import 'package:digi_task/presentation/components/input/app_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/path/icon_path.dart';

class CreateTaskView extends StatefulWidget {
  const CreateTaskView({super.key});

  @override
  State<CreateTaskView> createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends State<CreateTaskView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController registrationController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController adressController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController groupController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  bool isInternet = false;
  bool isTv = false;
  bool isVoice = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.neutralColor100,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: SvgPicture.asset(IconPath.arrowleft.toPathSvg)),
        title: Text('Yeni Tapşırıq', style: context.typography.subtitle2Medium),
        actions: [IconButton(onPressed: () {}, icon: SvgPicture.asset(IconPath.menu.toPathSvg))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            children: [
              AppField(
                title: 'Ad Soyad',
                controller: nameController,
                filledColor: context.colors.backgroundColor,
                isProfileView: false,
                hintText: 'Ayxan Osmanov',
              ),
              const SizedBox(
                height: 16,
              ),
              AppField(
                title: 'Qeydiyyat nömrəsi',
                controller: registrationController,
                filledColor: context.colors.backgroundColor,
                isProfileView: false,
                hintText: '(555) 000-0000',
              ),
              const SizedBox(
                height: 16,
              ),
              AppField(
                title: 'Əlaqə nömrəsi',
                controller: contactController,
                filledColor: context.colors.backgroundColor,
                isProfileView: false,
                hintText: '(555) 000-0000',
              ),
              const SizedBox(
                height: 16,
              ),
              AppField(
                title: 'Adres',
                controller: adressController,
                filledColor: context.colors.backgroundColor,
                isProfileView: false,
                hintText: 'Küçə',
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: AppField(
                      title: 'Tarix',
                      controller: nameController,
                      filledColor: context.colors.backgroundColor,
                      isProfileView: false,
                      hintText: 'DD/MM',
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: AppField(
                      title: 'Başlayır',
                      controller: nameController,
                      filledColor: context.colors.backgroundColor,
                      isProfileView: false,
                      hintText: '00 : 00',
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: AppField(
                      title: 'Bitir',
                      controller: nameController,
                      filledColor: context.colors.backgroundColor,
                      isProfileView: false,
                      hintText: '00 : 00',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Servis',
                    style: context.typography.body2SemiBold.copyWith(color: context.colors.neutralColor60),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SelectServiceCard(
                          isSelected: isTv,
                          onTap: () {
                            setState(() {
                              isTv = !isTv;
                            });
                          },
                          image: IconPath.tv.toPathSvg,
                          title: 'Tv',
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: SelectServiceCard(
                          isSelected: isInternet,
                          onTap: () {
                            setState(() {
                              isInternet = !isInternet;
                            });
                          },
                          image: IconPath.internet.toPathSvg,
                          title: 'İnternet',
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: SelectServiceCard(
                          isSelected: isVoice,
                          onTap: () {
                            setState(() {
                              isVoice = !isVoice;
                            });
                          },
                          image: IconPath.voice.toPathSvg,
                          title: 'Voice',
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              AppField(
                title: 'Texniki Qrup',
                controller: groupController,
                filledColor: context.colors.backgroundColor,
                isProfileView: false,
                hintText: 'Qrup 1',
              ),
              const SizedBox(
                height: 16,
              ),
              AppField(
                title: 'Qeyd',
                controller: noteController,
                filledColor: context.colors.backgroundColor,
                isProfileView: false,
                hintText: 'Qeydlər',
                minLine: 3,
              ),
              const SizedBox(
                height: 32,
              ),
              Consumer<TaskNotifier>(
                builder: (context, notifier, child) {
                  return ActionButton(
                    title: 'Əlavə et',
                    onPressed: () {
                      final model = CreateTaskModel(
                          contactNumber: contactController.text.trim(),
                          registrationNumber: registrationController.text.trim(),
                          isInternet: isInternet,
                          isTv: isTv,
                          isVoice: isVoice,
                          user: null,
                          date: "2024-06-07",
                          location: adressController.text.trim(),
                          description: null,
                          note: noteController.text.trim(),
                          group: [1],
                          time: "15:00-18:00",
                          taskType: "connection",
                          status: "inprogress");
                      notifier.createTask(model);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
