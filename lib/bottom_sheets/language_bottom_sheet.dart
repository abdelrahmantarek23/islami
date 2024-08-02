import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/colors.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Locale currentLocal = context.locale;
    var provider = Provider.of<MyProvider>(context);

    return Container(
      // height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
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
              context.setLocale(Locale("en"));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("english".tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: currentLocal == Locale("en")
                            ? AppColors.PrimaryColor
                            : AppColors.blackColor)),
                currentLocal == Locale("en")
                    ? Icon(
                        Icons.done,
                        size: 35,
                      )
                    : SizedBox(),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              context.setLocale(Locale("ar"));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("arabic".tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: currentLocal != Locale("en")
                            ? AppColors.PrimaryColor
                            : AppColors.blackColor)),
                currentLocal != Locale("en")
                    ? Icon(
                        Icons.done,
                        size: 35,
                      )
                    : SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
