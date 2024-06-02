import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:flutter/material.dart';

class ProfileField extends StatelessWidget {
  const ProfileField({
    super.key,
    required this.title,
    required this.controller,
  });
  final String title;
  final TextEditingController controller;
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
