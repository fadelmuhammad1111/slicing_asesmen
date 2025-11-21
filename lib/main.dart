import 'package:belajarwidget/belajar_listview.dart';
import 'package:belajarwidget/slicing_asesmen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BelajarListview",
      home: SlicingAsesmen(),
    );
  }
}