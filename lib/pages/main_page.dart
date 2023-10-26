import 'package:crono/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../drawer/drawer_screen.dart';
import 'account_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: DrawerScreen(
        setIndex: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      mainScreen: currentScreen(),
      borderRadius: 24,
      showShadow: true,
      angle: 0.0,
      menuBackgroundColor: Colors.lightBlue.shade300,
    );
  }

  Widget currentScreen() {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return MyAccount();
      case 2:
        return Container(
          color: Colors.purple,
        );
      case 3:
        return Container(
          color: Colors.pink,
        );
      case 4:
        return Container(
          color: Colors.green,
        );
      default:
        return HomePage();
    }
  }
}
