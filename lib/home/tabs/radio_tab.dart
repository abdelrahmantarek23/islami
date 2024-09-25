import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/my_provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    final isDarkMode = pro.appTheme == ThemeMode.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/images/radio_bg.png",
          height: 412,
        ),
        Text(
          "holy_quran_radio".tr(),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w600, fontSize: 25, height: -3),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.skip_next),
              iconSize: 30,
              color: isDarkMode ? Color(0xFFFACC1D) : Color(0xFFB7935F),
            ),
            SizedBox(width: 20),
            IconButton(onPressed: (){},
                icon: Icon(Icons.play_arrow),iconSize: 50,
              color: isDarkMode ? Color(0xFFFACC1D) : Color(0xFFB7935F),
            ),
            SizedBox(width: 20),
            IconButton(onPressed: (){},
              icon: Icon(Icons.skip_previous),iconSize: 30,
              color: isDarkMode ? Color(0xFFFACC1D) : Color(0xFFB7935F),
            ),
          ],
        )
      ],
    );
  }
}
