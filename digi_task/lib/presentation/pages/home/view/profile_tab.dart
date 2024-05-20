import 'package:digi_task/core/constants/path/icon_path.dart';
import 'package:digi_task/core/utility/extension/icon_path_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileCardItem(
          title: "Texnik adı",
          subtitle: 'texnik@gmail.com',
          trailingIcon: IconPath.pencil.toPathSvg,
        ),
        ProfileCardItem(
          title: "Bildirişlər",
          trailingIcon: IconPath.pencil.toPathSvg,
          leadingIcon: IconPath.profnoti.toPathSvg,
        ),
        ProfileCardItem(
          title: "Dəstək",
          trailingIcon: IconPath.more.toPathSvg,
        ),
        ProfileCardItem(
          title: "Haqqında",
          trailingIcon: IconPath.info.toPathSvg,
        ),
        ProfileCardItem(
          title: "Çıxış et",
          trailingIcon: IconPath.logout.toPathSvg,
        ),
      ],
    );
  }
}

class ProfileCardItem extends StatelessWidget {
  const ProfileCardItem({
    super.key,
    required this.title,
    this.leadingIcon,
    this.subtitle,
    required this.trailingIcon,
  });
  final String title;
  final String? subtitle;

  final String? leadingIcon;
  final String trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: subtitle != null ? const Text('texnik@gmail.com') : null,
        leading: subtitle != null ? null : SvgPicture.asset(leadingIcon!),
        trailing: SvgPicture.asset(trailingIcon),
      ),
    );
  }
}
