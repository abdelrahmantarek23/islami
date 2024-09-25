import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/colors.dart';
import 'package:provider/provider.dart';

import '../../providers/my_provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int tasbehCount = 0;
  int index = 0;
  double angel = 0;
  List<String> tasbeh = [
    "سبحان الله",
    "الحمدلله",
    "لا إله إلا الله",
    "الله أكبر",
    "لا حول ولا قوة إلا بالله"
  ];
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    final isDarkMode = pro.appTheme == ThemeMode.dark;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: Image.asset(
                    isDarkMode
                        ? "assets/images/head_sebha_dark.png"
                        : "assets/images/head_sebha.png",
                    fit: BoxFit.cover,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .085,
                        bottom: 26),
                    child: Transform.rotate(
                      angle: angel,
                      child: Image.asset(
                        isDarkMode
                            ? "assets/images/body_sebha_dark.png"
                            : "assets/images/body_sebha.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "number_of_tasbeehs".tr(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: isDarkMode
                    ? AppColors.PrimaryColorDark
                    : AppColors.PrimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "$tasbehCount",
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color:
                    isDarkMode ? AppColors.YellowColor : AppColors.PrimaryColor,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Text(
                tasbeh[index],
                style: TextStyle(
                  color: isDarkMode ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTap() {
    tasbehCount++;
    angel += 3;
    if(tasbehCount % 33 == 0) {
      index++;
    }
    if(index == tasbeh.length){
      index = 0;
    }
    setState(() {});
  }
}
