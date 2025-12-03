import 'package:flutter/material.dart';

class BelajarListView extends StatefulWidget {
  const BelajarListView({super.key});

  @override
  State<BelajarListView> createState() => _BelajarListViewState();
}

class _BelajarListViewState extends State<BelajarListView> {
  List<Map<String, dynamic>> products = [
    {
      "name": "Mie Instan Sodap",
      "image": "assets/images/gua.jpg",
      "stock": 9,
      "price": 3000,
      "quantity": 0,
    },
    {
      "name": "Mie 2",
      "image": "assets/images/1.jpg",
      "stock": 15,
      "price": 10000,
      "quantity": 0,
    },
    {
      "name": "Nasi Goreng Sodap",
      "image": "assets/images/2.jpeg",
      "stock": 9,
      "price": 13000,
      "quantity": 0,
    },
    {
      "name": "Baju Mantaps",
      "image": "assets/images/3.png",
      "stock": 15,
      "price": 100000,
      "quantity": 0,
    },
  ];

  int totalItem = 0;
  int totalHarga = 0;

  //tambah item keranjang
  Future <void> TambahItemKeranjang (int index) async {
    setState(() {
      products[index]['stock']--;
      products[index]['quantity'] ++;
      totalItem++;
      totalHarga += products[index]['price'] as int;
    });
  }

  Future <void> KurangItemKeranjang (int index) async {
    setState(() {
      products[index]['stock']++;
      products[index]['quantity'] --;
      totalItem--;
      totalHarga -= products[index]['price'] as int;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cashier App",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                ),
                Text(
                  "Semoga harimu menyenangkan :",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Cari produk...",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[400],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1.5, color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 15);
                      },
                      //mengatur berapa kali widget item di tampilkan
                      itemCount: products.length,
                      //item yang di tampilkan
                      itemBuilder: (context, index) {
                        return Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "${products[index]['image']}",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${products[index]['name']}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "Stock: ${products[index]['stock']}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    Text(
                                      "Rp. ${products[index]['price']}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Visibility(
                                    visible: products[index]['quantity'] > 0,
                                    child: IconButton(
                                      onPressed: () {
                                        if (products[index]['quantity'] > 0) {
                                          KurangItemKeranjang(index);
                                        }
                                      },
                                      icon: Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                    child: Center(
                                      child: Visibility(
                                        visible: products[index]['quantity'] > 0,
                                        child: Text(
                                          "${products[index]['quantity']}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if (products [index]['stock'] > 0) {
                                        TambahItemKeranjang(index);
                                      } else{
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(content: Text("Stock Habis!"),
                                          backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    },
                                    icon: Icon(
                                      Icons.add_circle_outline_sharp,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 30
                  ),
                ),
                onPressed: () {}, 
                child: Row(
                  children: [
                    Text(
                      "Total ($totalItem item) = Rp. $totalHarga",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Icon(Icons.shopify_outlined, color: Colors.white, size: 30),
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}