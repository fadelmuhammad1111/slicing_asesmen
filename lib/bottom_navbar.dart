import 'package:belajarwidget/belajar_listview.dart';
import 'package:belajarwidget/day1.dart';
import 'package:belajarwidget/drawer.dart';
import 'package:belajarwidget/slicing_asesmen.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {

  int bottomIndex = 0;

  final pages = [
    Day1(),
    BelajarListView(),
    SlicingAsesmen(),
    DrawerPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIndex,
        onTap: (i) => setState(() =>
        bottomIndex = i
        ),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: "Camera"
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: "ListView"
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard"
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting"
            ),
          ],
        ),
        body: pages[bottomIndex],
    );
  }
}