import 'package:digi_task/core/constants/path/icon_path.dart';
import 'package:digi_task/core/constants/theme/theme_ext.dart';
import 'package:digi_task/core/utility/extension/icon_path_ext.dart';
import 'package:flutter/material.dart';

import '../widgets/profile_card_item.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 24),
      child: Column(
        children: [
          ProfileCardItem(
            onPressed: () {},
            title: "Texnik adı",
            subtitle: 'texnik@gmail.com',
            trailingIcon: IconPath.pencil.toPathSvg,
          ),
          const SizedBox(
            height: 16,
          ),
          ProfileCardItem(
            onPressed: () {},
            title: "Bildirişlər",
            isNotification: true,
            leadingIcon: IconPath.profnoti.toPathSvg,
            trailingIcon: IconPath.arrowright.toPathSvg,
          ),
          ProfileCardItem(
            onPressed: () {},
            title: "Dəstək",
            leadingIcon: IconPath.more.toPathSvg,
            trailingIcon: IconPath.arrowright.toPathSvg,
          ),
          ProfileCardItem(
            onPressed: () {},
            title: "Haqqında",
            leadingIcon: IconPath.info.toPathSvg,
            trailingIcon: IconPath.arrowright.toPathSvg,
          ),
          ProfileCardItem(
            isExit: true,
            title: "Çıxış et",
            leadingIcon: IconPath.logout.toPathSvg,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    insetPadding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Material(
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Text(
                                  "Çıxış",
                                  style: context.typography.subtitle1Medium,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Çıxış etmək istədiyinizdən əminsiniz?',
                                style: context.typography.body2Regular.copyWith(color: context.colors.neutralColor50),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        padding: WidgetStateProperty.all(const EdgeInsets.all(16)),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        ),
                                        backgroundColor: WidgetStateProperty.all(Colors.white),
                                        side: WidgetStateProperty.all(
                                          BorderSide(color: context.colors.primaryColor50),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Ləğv et',
                                        style: context.typography.body2SemiBold
                                            .copyWith(color: context.colors.primaryColor50),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        padding: WidgetStateProperty.all(const EdgeInsets.all(16)),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        ),
                                        backgroundColor: WidgetStateProperty.all(context.colors.errorColor50),
                                        side: WidgetStateProperty.all(
                                          BorderSide(color: context.colors.errorColor50),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Çıxış et',
                                        style: context.typography.body2SemiBold
                                            .copyWith(color: context.colors.neutralColor100),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
           
          ),
        ],
      ),
    );
  }
}
