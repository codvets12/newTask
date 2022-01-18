import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project1/provider/auth_provider/auth_provider.dart';
import 'package:provider/provider.dart';

Widget MyBottombar(BuildContext context) {
  int selectedindex = 0;
  return BottomNavigationBar(
    mouseCursor: SystemMouseCursors.grab,
    //type: BottomNavigationBarType.shifting,
    onTap: Provider.of<AuthProvider>(context, listen: false).OnTappedItem,
    currentIndex: selectedindex,
    selectedFontSize: 20,
    selectedIconTheme: IconThemeData(color: Colors.blue, size: 15),
    selectedItemColor: Colors.blue,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag),
        label: 'Assets',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.summarize),
        label: 'Summary',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.people),
        label: 'people',
      ),
    ],
  );
}
