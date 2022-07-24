import 'package:flutter/material.dart';

import 'package:intern_project/ui/products_screen/products_screen.dart';
import 'package:intern_project/ui/settings_screen/settings_screen.dart';

import '../../generated/l10n.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  int _selectedPage = 0;

  void onSelectPage(int index) {
    setState(
      () {
        _selectedPage = index;
      },
    );
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
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_basket_rounded),
            label: S.of(context).products,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: S.of(context).settings,
          ),
        ],
        onTap: onSelectPage,
      ),
    );
  }
}
