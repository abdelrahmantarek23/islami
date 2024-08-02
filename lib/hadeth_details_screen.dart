import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            title: Text(model.title),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      model.content[index],
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.elMessiri(
                        fontSize: 25,
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
