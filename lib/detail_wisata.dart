import 'package:flutter/material.dart';

class WisataDetailScreen extends StatelessWidget {
  final Map<String, dynamic> wisata;

  const WisataDetailScreen({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wisata['nama'] ?? 'Nama Tidak Tersedia'), // Cek null
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Pastikan gambar ada dan tidak null
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  wisata['gambar'] ??
                      'assets/images/default_image.jpg', // Gambar default
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                wisata['nama'] ?? 'Nama Tidak Tersedia', // Cek null
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                wisata['lokasi'] ?? 'Lokasi Tidak Tersedia', // Cek null
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                wisata['deskripsi'] ?? 'Deskripsi Tidak Tersedia', // Cek null
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
