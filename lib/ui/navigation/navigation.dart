import 'package:flutter/material.dart';

import 'package:intern_project/ui/products_screen/products_screen.dart';
import 'package:intern_project/ui/settings_screen/settings_screen.dart';



class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  int _selectedPage = 0;

  void onSelectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
      const ProductsScreen(),
      const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_rounded),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label:"Settings",
          ),
        ],
        onTap: onSelectPage,
      ),
    );
  }
}
