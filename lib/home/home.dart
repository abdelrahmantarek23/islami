import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/home/tabs/ahadeth_tab.dart';
import 'package:islami/home/tabs/quran_tab.dart';
import 'package:islami/home/tabs/radio_tab.dart';
import 'package:islami/home/tabs/sebha_tab.dart';
import 'package:islami/home/tabs/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/main_bg.png",
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              "Islami",
              style: GoogleFonts.elMessiri(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {

              });
            },
            showUnselectedLabels: false,
            showSelectedLabels: false,
            type: BottomNavigationBarType.shifting,
            backgroundColor: Color(0xffB7935f),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Color(0xffB7935f),
                  icon: ImageIcon(AssetImage("assets/images/moshaf_blue.png")),
                  label: "moshaf"),
              BottomNavigationBarItem(
                  backgroundColor: Color(0xffB7935f),
                  icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                  label: "sebha"),
              BottomNavigationBarItem(
                  backgroundColor: Color(0xffB7935f),
                  icon: ImageIcon(AssetImage("assets/images/radio.png")),
                  label: "radio"),
              BottomNavigationBarItem(
                  backgroundColor: Color(0xffB7935f),
                  icon: ImageIcon(AssetImage("assets/images/ahadeth.png")),
                  label: "ahadeth"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "settings"),
            ],
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
  List<Widget> tabs=[
    QuranTab(),
    SebhaTab(),
    RadioTab(),
    AhadethTab(),
    SettingsTab(),
  ];
}
