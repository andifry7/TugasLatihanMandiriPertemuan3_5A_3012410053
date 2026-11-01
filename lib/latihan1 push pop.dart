import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan 1',
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: const BerandaPage(),
    );
  }
}

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beranda'),
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TentangPage()),
            );
          },
          child: const Text('Ke Halaman Tentang'),
        ),
      ),
    );
  }
}

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang'),
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Kembali ke Beranda'),
        ),
      ),
    );
  }
}