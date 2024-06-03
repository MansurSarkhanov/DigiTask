import 'package:digi_task/core/constants/path/icon_path.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/core/utility/extension/icon_path_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileField extends StatelessWidget {
  const ProfileField({
    super.key,
    required this.title,
    required this.controller,
    this.isWithIcon = false,
    this.iconPath,
  });
  final String title;
  final TextEditingController controller;
  final bool? isWithIcon;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.typography.body2SemiBold.copyWith(color: context.colors.neutralColor10),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          style: context.typography.body2Regular.copyWith(color: context.colors.neutralColor40),
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: isWithIcon == true
                ? SvgPicture.asset(
                    IconPath.arrowright.toPathSvg,
                    width: 16,
                    height: 16,
                    fit: BoxFit.none,
                  )
                : null,
            prefixIcon: isWithIcon == true
                ? SvgPicture.asset(
                    iconPath ?? IconPath.date.toPathSvg,
                    width: 16,
                    height: 16,
                    fit: BoxFit.none,
                  )
                : null,
            filled: true,
            fillColor: context.colors.neutralColor100,
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(24)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(24)),
          ),
        ),
      ],
    );
  }
}
