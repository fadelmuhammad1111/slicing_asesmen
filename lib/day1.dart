import 'package:flutter/material.dart';

@override
void main() {
  runApp(const Day1());
}

class Day1 extends StatelessWidget {
  const Day1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrier", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .center, // Mengatur posisi teks menjadi di tengah
          children: [
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.blue,
              child: Center(
                child: Icon(
                  Icons.camera_enhance,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                      side: BorderSide(color: Colors.blue, width: 3),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.blue[100], size: 30),
                        SizedBox(width: 10),
                        Text(
                          "Favorite",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                      side: BorderSide(color: Colors.blue, width: 3),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.share, color: Colors.blue[100], size: 30),
                        SizedBox(width: 10),
                        Text(
                          "Share",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  "Save As",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            SizedBox(height: 25),
            OutlinedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.blue, width: 3),
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.blue, fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}