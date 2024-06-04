import 'package:digi_task/core/constants/path/icon_path.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/core/utility/extension/icon_path_ext.dart';
import 'package:digi_task/presentation/components/input/profile_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../data/model/profile_model.dart';

class ProfileEditView extends StatefulWidget {
  const ProfileEditView({super.key});

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController qrupController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userModel = GoRouterState.of(context).extra as UserProfileModel;
    return Scaffold(
      backgroundColor: context.colors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: SvgPicture.asset(IconPath.arrowleft.toPathSvg)),
        title: Text('Profile edit', style: context.typography.subtitle2Medium),
        actions: [IconButton(onPressed: () {}, icon: SvgPicture.asset(IconPath.menu.toPathSvg))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileField(
                title: "Ad Soyad",
                controller: nameController..text = "${userModel.firstName} ${userModel.lastName}",
              ),
              const SizedBox(
                height: 12,
              ),
              ProfileField(
                title: "Region",
                controller: regionController..text = "${userModel.group?.region}",
              ),
              const SizedBox(
                height: 12,
              ),
              ProfileField(
                title: "Qrup",
                controller: qrupController..text = "${userModel.group?.group}",
              ),
              const SizedBox(
                height: 32,
              ),
              ProfileField(
                title: "Əlaqə nömrəsi",
                controller: phoneController..text = "${userModel.phone}",
                isWithIcon: true,
                iconPath: IconPath.phoneblue.toPathSvg,
              ),
              const SizedBox(
                height: 12,
              ),
              ProfileField(
                title: "Mail adresi",
                controller: mailController..text = "${userModel.email}",
                isWithIcon: true,
                iconPath: IconPath.mail.toPathSvg,
              ),
              const SizedBox(
                height: 12,
              ),
              ProfileField(
                title: "Şifrə",
                controller: passwordController..text = "Şifrəni dəyiş",
                isWithIcon: true,
                iconPath: IconPath.key.toPathSvg,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
