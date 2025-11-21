import 'package:flutter/material.dart';

class SlicingAsesmen extends StatelessWidget {
  const SlicingAsesmen({super.key});

  // --- Definisi Warna Gradien ---
  final LinearGradient orangeGradient = const LinearGradient(
    colors: [Color(0xFFFF9F43), Color(0xFFFF6B6B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  final LinearGradient blueGradient = const LinearGradient(
    colors: [Color(0xFF4FACFE), Color(0xFF00F2FE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // --- HEADER ---
                _buildHeader(),
                const SizedBox(height: 20),

                // --- SEARCH ---
                _buildSearchBar(),
                const SizedBox(height: 20),

                // --- BANNER PROMO ---
                _buildPromoBanner(),
                const SizedBox(height: 25),

                // --- JUDUL SEKSI 1 ---
                _buildSectionTitle("Most Booked Services"),
                const SizedBox(height: 20),

                // --- BAGIAN 1: 8 ICON BUTTONS (Kategori) ---
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildGradientIconBtn(Icons.plumbing, "Plumber"),
                        _buildGradientIconBtn(Icons.electrical_services, "Electrician"),
                        _buildGradientIconBtn(Icons.carpenter, "Carpenter"),
                        _buildGradientIconBtn(Icons.format_paint, "Painting"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Mason (Tukang Batu/Bangunan) -> foundation / holiday_village
                        _buildGradientIconBtn(Icons.foundation, "Mason"), 
                        // Welder (Tukang Las) -> construction / whatshot (api/las)
                        _buildGradientIconBtn(Icons.construction, "Welder"), 
                        // Roofer (Tukang Atap) -> roofing
                        _buildGradientIconBtn(Icons.roofing, "Roofer"), 
                        _buildGradientIconBtn(Icons.more_horiz, "More"),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // --- JUDUL SEKSI 2 ---
                _buildSectionTitle("Popular Near You"),
                const SizedBox(height: 15),

                // --- BAGIAN 2: 4 KARTU LAYANAN ---
                Column(
                  children: [
                    _buildComplexServiceCard(
                      companyName: "Expert Plumbing",
                      price: "\$45",
                      rating: "4.8",
                      tag: "Plumber",
                    ),
                    const SizedBox(height: 15),
                    _buildComplexServiceCard(
                      companyName: "Electricial Services",
                      price: "\$50",
                      rating: "4.9",
                      tag: "Electrician",
                    ),
                    const SizedBox(height: 15),
                    _buildComplexServiceCard(
                      companyName: "Deep Home Cleaning",
                      price: "\$60",
                      rating: "4.7",
                      tag: "Roofer",
                    ),
                  ],
                ),
                 const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ================= WIDGET BUILDER HELPERS =================

  // Helper untuk membuat kartu layanan yang DYNAMIC (bisa menerima data)
  Widget _buildComplexServiceCard({
    required String companyName,
    required String price,
    required String rating,
    required String tag,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      // Menggunakan Stack untuk menaruh label di pojok kanan atas
      child: Stack(
        children: [
          // Konten Utama Kartu
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Baris Atas (Profil, Nama, Rating, Harga)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/1.jpg", 
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            companyName,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          
                          // Rating dan Harga
                          Text(
                            "$price",
                            style: const TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                           const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 18),
                              const SizedBox(width: 4),
                              Text(
                                rating,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text(" (1.2k reviews)", style: TextStyle(color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                // Baris Bawah (Dua Tombol Bergradien)
                Row(
                  children: [
                    Expanded(
                      // Tombol View Profile (Gradien Biru)
                      child: _buildGradientButton(
                        text: "View Profile",
                        gradient: blueGradient,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      // Tombol Book Now (Gradien Oranye)
                      child: _buildGradientButton(
                        text: "Book Now",
                        gradient: orangeGradient,
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          // Label Pojok Kanan Atas
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: const BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Text(
                tag,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  // Helper untuk membuat Icon Button dengan background gradient
  Widget _buildGradientIconBtn(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: orangeGradient, 
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ]
          ),
          child: Icon(icon, color: Colors.white, size: 26),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  // Helper untuk membuat tombol biasa dengan background gradient
  Widget _buildGradientButton({
    required String text,
    required Gradient gradient,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12),
         boxShadow: [
          BoxShadow(
            color: gradient.colors.first.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ]
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
           onPressed: (){},
           style: TextButton.styleFrom(padding: EdgeInsets.zero),
           child: Text(
            "View All",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400],
            ),
          ),
        ),
      ],
    );
  }

  // --- Widget Header & Search & Promo (Tetap Sama) ---

  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage("assets/images/1.jpg"),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Hello", style: TextStyle(fontSize: 12)),
              Text("Alex Carter",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
          style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              iconSize: 26,
              side: BorderSide(color: Colors.grey.shade200, width: 1.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Search for any services...",
              hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey[400]),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_list_alt),
          style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              iconSize: 26,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
        ),
      ],
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/1.jpg",
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.2),
                colorBlendMode: BlendMode.darken,
              ),
            ),
            Positioned(
              top: 20, left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Save 25% Today!", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w200, fontSize: 12)),
                  Text("Exclusive discounts", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                  Text("on home service", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
            ),
            Positioned(
              bottom: 16, left: 16,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text("Book Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}