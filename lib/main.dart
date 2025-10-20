import 'package:flutter/material.dart';

void main() {
  runApp(const WarungNasiGorengApp());
}

class WarungNasiGorengApp extends StatelessWidget {
  const WarungNasiGorengApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Pelanggan Kantin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const UserProfilePage(),
    );
  }
}

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        title: const Text('Profil Pelanggan'),
        centerTitle: true,
        backgroundColor: Colors.orange.shade100,
        elevation: 0,
        leading: const Icon(Icons.person),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🔸 Foto profil pengguna
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.orange.shade300,
                backgroundImage: const AssetImage('assets/images/user.jpg'),
              ),

              const SizedBox(height: 16),

              const Text(
                "Ramadhan Maulana",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Pelanggan Kantin Kampus 2 UMSIDA",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),

              const SizedBox(height: 25),

              // 🔸 Informasi singkat
              Card(
                color: Colors.orange.shade50,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    children: const [
                      ListTile(
                        leading:
                        Icon(Icons.location_on, color: Colors.deepOrange),
                        title: Text("Alamatnya"),
                        subtitle:
                        Text("Pokoknya di Sidoarjo"),
                      ),
                      Divider(),
                      ListTile(
                        leading:
                        Icon(Icons.phone_android, color: Colors.deepOrange),
                        title: Text("Nomor Telepon"),
                        subtitle: Text("+62 812 9999 9999"),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.star, color: Colors.amber),
                        title: Text("Tingkat Kepuasan"),
                        subtitle: Text("⭐⭐⭐⭐☆ (4.8 dari 5)"),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 🔸 Galeri makanan favorit
              Row(
                children: const [
                  Icon(Icons.fastfood, color: Colors.deepOrange),
                  SizedBox(width: 8),
                  Text(
                    "Makanan Favorit",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  FoodCard(
                    imagePath: 'assets/images/download.jpg',
                    title: 'Nasi Goreng Enak Banget',
                  ),
                  FoodCard(
                    imagePath: 'assets/images/download2.jpg',
                    title: 'Nasi Goreng Enak Biasa',
                  ),
                ],
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                icon: const Icon(Icons.menu_book),
                label: const Text("Lihat Menu Lengkap"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28, vertical: 14),
                  elevation: 3,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Halaman menu lengkap masih belum jadi bos")),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const FoodCard({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // 🔸 Foto makanan asli
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black54,
            padding: const EdgeInsets.all(6),
            width: double.infinity,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

