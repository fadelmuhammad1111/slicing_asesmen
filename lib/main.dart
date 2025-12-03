import 'package:belajarwidget/belajar_listview.dart';
import 'package:belajarwidget/bottom_navbar.dart';
import 'package:belajarwidget/day1.dart';
import 'package:belajarwidget/drawer.dart';
import 'package:belajarwidget/setting.dart';
import 'package:belajarwidget/slicing_asesmen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BelajarListview",
      initialRoute: "/",
      routes: {
        "/": (context) => BottomNavbar(),
        "/kasir": (context) => BelajarListView(),
        "/camera": (context) => Day1(),
        "/dashboard": (context) => SlicingAsesmen(),
        "/setting": (context) => SettingPage(),
      },
    );
  }
}