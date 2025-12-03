import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widget Navigasi")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Setting"),
              onTap: () {
                Navigator.pushNamed(context, "/setting");
              },
              leading: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}