import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/tabs/Hadeth/hadeth_tab.dart';
import 'package:islami/ui/screens/home/tabs/Radio/radio_tab.dart';
import 'package:islami/ui/screens/home/tabs/Sebha/sebha_tab.dart';
import 'package:islami/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami/ui/utilities/app_theme.dart';
import 'package:islami/ui/utilities/app_utlities.dart';

import '../../utilities/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String  routeName= "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currenttabindex=0;

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(image: DecorationImage(image: AssetImage(AppUtlities.background),fit: BoxFit.fill)),
      child:  Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.transparent,
          elevation: 0,
          title:Text("Islami",style:AppTheme.appBarTextStyle),
        ),
          bottomNavigationBar: buildBottomNavigationBar(),
        body: tabs[currenttabindex],

      ),
    );
  }

  Widget buildBottomNavigationBar() => Theme(
    data: ThemeData(canvasColor: AppColors.primiary),
    child: BottomNavigationBar(
      currentIndex: currenttabindex,
      onTap: (index){
        currenttabindex= index;
        setState(() {});

      },
      selectedItemColor: AppColors.accent,
      iconSize: 42,
      items: [
        BottomNavigationBarItem(icon:ImageIcon(AssetImage(AppUtlities.iconQuran)),label: "Quran"),
        BottomNavigationBarItem(icon:ImageIcon(AssetImage(AppUtlities.iconhadeth)),label: "Hadeth"),
        BottomNavigationBarItem(icon:ImageIcon(AssetImage(AppUtlities.iconSebha)),label: "Sebha"),
        BottomNavigationBarItem(icon:ImageIcon(AssetImage(AppUtlities.iconradio)),label: "Radio"),
      ],
    ),
  );
}
