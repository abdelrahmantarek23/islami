import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/colors.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      // height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: provider.appTheme == ThemeMode.dark
            ? AppColors.PrimaryColorDark
            : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("light".tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: provider.appTheme == ThemeMode.dark
                            ? Colors.white
                            : AppColors.PrimaryColor)),
                provider.appTheme == ThemeMode.dark
                    ? SizedBox()
                    : Icon(
                        Icons.done,
                        size: 35,
                      ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("dark".tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: provider.appTheme == ThemeMode.dark
                            ? AppColors.YellowColor
                            : AppColors.PrimaryColorDark)),
                provider.appTheme == ThemeMode.light
                    ? SizedBox()
                    : Icon(
                  Icons.done,
                  size: 35,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
