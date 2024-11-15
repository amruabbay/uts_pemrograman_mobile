import 'package:flutter/material.dart';
import 'package:utspemmob/detail_wisata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Indonesia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const TabelWisataScreen(),
    );
  }
}

class TabelWisataScreen extends StatefulWidget {
  const TabelWisataScreen({super.key});

  @override
  _TabelWisataScreenState createState() => _TabelWisataScreenState();
}

class _TabelWisataScreenState extends State<TabelWisataScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> wisataData = [
    {
      "nama": "Pantai Kuta",
      "lokasi": "Denpasar, Bali",
      "gambar": "assets/images/Kuta.jpg",
      "deskripsi":
          "Bayangkan melangkahkan kaki Anda ke hamparan pasir putih yang lembut, ditemani suara ombak yang menenangkan. Pantai Kuta di Bali bukan hanya terkenal dengan keindahannya, tetapi juga suasana yang penuh energi. Nikmati pemandangan matahari terbenam yang memukau, pengalaman surfing yang seru untuk pemula maupun profesional, serta suasana malam yang hidup di sepanjang garis pantai.",
      "isFavorite": false,
    },
    {
      "nama": "Candi Prambanan",
      "lokasi": "Yogyakarta, Jawa Tengah",
      "gambar": "assets/images/Prambanan.jpg",
      "deskripsi":
          "Temukan keindahan dan kemegahan Candi Prambanan, kompleks candi Hindu terbesar di Indonesia yang merupakan situs warisan dunia UNESCO. Dengan ukiran batu yang rumit dan kisah epik Ramayana yang terukir di dindingnya, Prambanan memukau setiap pengunjung dengan perpaduan seni, sejarah, dan spiritualitas.",
      "isFavorite": false,
    },
    {
      "nama": "Gunung Bromo",
      "lokasi": "Probolinggo, Jawa Timur",
      "gambar": "assets/images/Bromo.jpg",
      "deskripsi":
          "Rasakan pengalaman luar biasa di Gunung Bromo, destinasi yang memukau dengan keindahan alam yang tiada duanya. Nikmati momen magis saat matahari terbit, ketika langit berubah warna dan siluet Gunung Bromo muncul di tengah lautan pasir yang luas.",
      "isFavorite": false,
    },
    {
      "nama": "Danau Toba",
      "lokasi": "Medan, Sumatera Utara",
      "gambar": "assets/images/DanauToba.jpg",
      "deskripsi":
          "Nikmati keajaiban alam yang menenangkan di Danau Toba, danau vulkanik terbesar di Indonesia yang dikelilingi oleh pemandangan gunung yang memukau. Dengan udara yang sejuk dan suasana yang damai, Danau Toba adalah tempat yang sempurna untuk melepas penat dari kesibukan.",
      "isFavorite": false,
    },
    {
      "nama": "Nusa Penida",
      "lokasi": "Denpasar, Bali",
      "gambar": "assets/images/NusaPenida.jpg",
      "deskripsi":
          "NRasakan sensasi petualangan di Nusa Penida, surga tersembunyi di Bali yang menawarkan keindahan alam yang luar biasa. Dengan pantai berpasir putih, tebing dramatis, dan air laut yang jernih, Nusa Penida adalah tempat yang sempurna untuk menikmati snorkeling, diving, atau hanya bersantai menikmati pemandangan.",
      "isFavorite": false,
    },
  ];

  List<Map<String, dynamic>> favoriteList = [];

  void _toggleFavorite(int index) {
    setState(() {
      bool currentFavoriteStatus = wisataData[index]['isFavorite'] ?? false;
      wisataData[index]['isFavorite'] = !currentFavoriteStatus;

      if (wisataData[index]['isFavorite']) {
        favoriteList.add(wisataData[index]);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('${wisataData[index]['nama']} ditambahkan ke favorit'),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        favoriteList
            .removeWhere((item) => item['nama'] == wisataData[index]['nama']);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openWisataDetail(Map<String, dynamic> wisata) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WisataDetailScreen(wisata: wisata),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(_selectedIndex == 0 ? 'Wisata Indonesia' : 'Wisata Favorit'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _selectedIndex == 0
          ? ListView.builder(
              itemCount: wisataData.length,
              itemBuilder: (context, index) {
                final wisata = wisataData[index];
                return InkWell(
                  onTap: () => _openWisataDetail(wisata),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              wisata['gambar'],
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        wisata['nama']!,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        wisata['isFavorite'] == true
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: wisata['isFavorite'] == true
                                            ? Colors.yellow
                                            : Colors.grey,
                                      ),
                                      onPressed: () => _toggleFavorite(index),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  wisata['lokasi']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : ListView.builder(
              itemCount: favoriteList.length,
              itemBuilder: (context, index) {
                final wisata = favoriteList[index];
                return InkWell(
                  onTap: () => _openWisataDetail(wisata),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Tampilkan gambar dengan ukuran lebih kecil di bagian favorit
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              wisata['gambar'],
                              height:
                                  120, // Ukuran gambar lebih kecil di favorit
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  wisata['nama']!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  wisata['lokasi']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorit',
          ),
        ],
      ),
    );
  }
}
