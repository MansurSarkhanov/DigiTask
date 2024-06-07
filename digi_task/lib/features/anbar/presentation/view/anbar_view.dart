import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/core/utility/extension/icon_path_ext.dart';
import 'package:digi_task/shared/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/path/icon_path.dart';

class AnbarView extends StatelessWidget {
  const AnbarView({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: Text('Anbar', style: context.typography.subtitle2Medium),
        actions: [
          SvgPicture.asset(IconPath.import.toPathSvg),
          const SizedBox(
            width: 8,
          ),
          SvgPicture.asset(IconPath.export.toPathSvg),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 24, bottom: 16),
        child: Column(
          children: [
            CustomSearchBar(
              fillColor: context.colors.neutralColor100,
              hintText: 'Anbarda axtar',
              isAnbar: true,
            ),
          ],
        ),
      ),
    );
  }
}
