import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/core/utility/extension/icon_path_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/path/icon_path.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(shape: BoxShape.circle, color: context.colors.backgroundColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(IconPath.notification.toPathSvg),
      ),
    );
  }
}
