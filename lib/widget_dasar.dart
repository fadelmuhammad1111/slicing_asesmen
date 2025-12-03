import 'package:flutter/material.dart';

class WidgetDasar extends StatefulWidget {
  const WidgetDasar({super.key});

  @override
  State<WidgetDasar> createState() => _WidgetDasarState();
}

class _WidgetDasarState extends State<WidgetDasar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            pinned: true,
            flexibleSpace: ,
          )
        ],
      ),
    );
  }
}