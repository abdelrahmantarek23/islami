import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/colors.dart';
import 'package:islami/hadeth_model.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "HadethScreen";
  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as HadethModel;
    var pro = Provider.of<MyProvider>(context);
    final isDarkMode = pro.appTheme == ThemeMode.dark;
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            isDarkMode
                ? "assets/images/main_dark_bg.png"
                : "assets/images/main_bg.png",
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              model.title,
              style: TextStyle(
                  color: isDarkMode ? Color(0xFFFACC1D) : Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: isDarkMode ? Color(0xFF141A2E) : Colors.white,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      model.content[index],
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.elMessiri(
                        fontSize: 25,
                        color: isDarkMode ? Color(0xFFFACC1D) : Colors.black,
                      ),
                    ),
                  );
                },
                itemCount: model.content.length,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
