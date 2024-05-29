import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCardItem extends StatelessWidget {
  const ProfileCardItem({
    super.key,
    required this.title,
    this.leadingIcon,
    this.subtitle,
    this.trailingIcon,
    this.isNotification = false,
    required this.onPressed,
  });
  final String title;
  final String? subtitle;

  final String? leadingIcon;
  final String? trailingIcon;
  final bool? isNotification;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: context.colors.neutralColor100,
      child: ListTile(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        onTap: onPressed,
        contentPadding: subtitle != null
            ? const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8)
            : const EdgeInsets.only(left: 19, right: 19, top: 5, bottom: 5),
        title: Text(
          title,
          style: subtitle != null
              ? context.typography.subtitle1SemiBold
              : context.typography.subtitle2Medium.copyWith(color: context.colors.neutralColor50),
        ),
        subtitle: subtitle != null
            ? Text(
                'texnik@gmail.com',
                style: context.typography.body1Regular,
              )
            : null,
        leading: subtitle != null ? null : SvgPicture.asset(leadingIcon!),
        trailing: trailingIcon != null
            ? (isNotification == false
                ? SvgPicture.asset(trailingIcon!)
                : Theme(
                    data: ThemeData(useMaterial3: false),
                    child: Switch(
                      activeColor: context.colors.primaryColor50,
                      value: true,
                      onChanged: (value) {},
                    ),
                  ))
            : null,
      ),
    );
  }
}
