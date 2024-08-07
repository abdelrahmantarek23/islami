import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/hadeth_details_screen.dart';
import 'package:islami/hadeth_model.dart';
import 'package:provider/provider.dart';

import '../../colors.dart';
import '../../providers/my_provider.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];
  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    final isDarkMode = pro.appTheme == ThemeMode.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/images/ahadeth_bg.png",
          height: 219,
        ),
        Divider(),
        Text(
          "ahadeth".tr(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium
        ),
        Divider(),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              endIndent: 40,
              indent: 40,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, HadethDetailsScreen.routeName,
                      arguments: allAhadeth[index]);
                },
                child: Text(
                  allAhadeth[index].title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isDarkMode ? Colors.white : Colors.black,
                  )
                ),
              );
            },
            itemCount: allAhadeth.length,
          ),
        )
      ],
    );
  }

  loadHadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((value) {
      List<String> ahadeth = value.split("#");

      for (int i = 0; i < ahadeth.length; i++) {
        String hadeth = ahadeth[i];
        List<String> hadethLines = hadeth.trim().split("\n");
        String title = hadethLines[0];
        hadethLines.removeAt(0);
        List<String> content = hadethLines;
        HadethModel hadethModel = HadethModel(title, content);
        allAhadeth.add(hadethModel);
        setState(() {});
      }
    });
  }
}
