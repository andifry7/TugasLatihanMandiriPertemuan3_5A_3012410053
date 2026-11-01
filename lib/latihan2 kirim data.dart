import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Produk {
  final String nama;
  final int harga;
  const Produk(this.nama, this.harga);
}

const daftarProduk = [
  Produk('Kemeja Batik', 150000),
  Produk('Sepatu Sneakers', 350000),
  Produk('Tas Ransel', 225000),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan 2',
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: const DaftarProdukPage(),
    );
  }
}

class DaftarProdukPage extends StatelessWidget {
  const DaftarProdukPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk'),
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,),
      body: ListView.builder(
        itemCount: daftarProduk.length,
        itemBuilder: (context, index) {
          final produk = daftarProduk[index];
          return ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text(produk.nama),
            subtitle: Text('Rp ${produk.harga}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProdukPage(produk: produk),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailProdukPage extends StatelessWidget {
  final Produk produk;
  const DetailProdukPage({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk'),
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(produk.nama,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text('Rp ${produk.harga}',
                style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}