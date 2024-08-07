import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/providers/sura_details_provider.dart';
import 'package:islami/sura_model.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = "SuraDetails";
  SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    var pro = Provider.of<MyProvider>(context);
    final isDarkMode = pro.appTheme == ThemeMode.dark;
    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider()..loadSuraFile(model.index),
      builder: (context, child) {
        var provider = Provider.of<SuraDetailsProvider>(context);
        return Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                pro.appTheme == ThemeMode.dark
                    ? "assets/images/main_dark_bg.png"
                    : "assets/images/main_bg.png",
                fit: BoxFit.cover,
              ),
            ),
            Scaffold(
              appBar: AppBar(
                title: Text(
                  model.name,
                  style: TextStyle(
                      color: isDarkMode ? Color(0xFFFACC1D) : Colors.black),
                ),
              ),
              body: Container(
                padding: const EdgeInsets.all(8.0),
                margin: EdgeInsets.all(12),
                child: Card(
                  color: isDarkMode ? Color(0xFF141A2E) : Colors.white,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      return Text(
                        provider.verses[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isDarkMode ? Color(0xFFFACC1D) : Colors.black,
                        )
                      );
                    },
                    itemCount: provider.verses.length,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
