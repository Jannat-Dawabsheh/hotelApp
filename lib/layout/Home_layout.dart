import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_ui/screens/calender_page.dart';
import 'package:flutter_advanced_ui/screens/favourite_page.dart';
import 'package:flutter_advanced_ui/screens/notification_page.dart';
import 'package:flutter_advanced_ui/screens/search_page.dart';
import 'package:flutter_advanced_ui/shared/widget_extension.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../shared/theme_constants.dart';
import '../widgets/Home_tab_bar.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  int _activePageIndex=0;
  List<Widget> screens=[
    const SearchPage(),
    const NotificationPage(),
    const FavouritePage(),
    const CalenderPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color:Colors.black,
            ),
            children: [ // Text("Find the best\nfor your holiday"),
             TextSpan(text:"Find "),
             TextSpan(text:"the best", style:TextStyle(
              backgroundColor:AppColors.mainColor,
              height:32/24,
             )),
             TextSpan(text:"\nfor your holiday"),


            ]
          )
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(CupertinoIcons.search)),
        ],
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          padding:const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: GNav(
              backgroundColor: Color(0xffe4e7e8),
              tabBackgroundColor: AppColors.secondryColor,
              tabMargin: const EdgeInsets.all(6),
              tabBorderRadius: 20,
              activeColor: Colors.white,
              duration: const Duration(microseconds: 300),
              onTabChange: (index){
                setState(() {
                  _activePageIndex=index;
                });
              },
              tabs: [
              GButton(icon: CupertinoIcons.search),
              GButton(icon: CupertinoIcons.bell),
              GButton(icon: CupertinoIcons.heart),
              GButton(icon: CupertinoIcons.calendar),
            ],),
          ),
        ),
      ),
      body: screens[_activePageIndex],
      );
  }
}

  