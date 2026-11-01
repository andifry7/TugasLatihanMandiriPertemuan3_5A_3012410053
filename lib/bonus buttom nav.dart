import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bonus',
      theme: ThemeData(colorSchemeSeed: Colors.orange, useMaterial3: true),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _indexAktif = 0;

  final List<Widget> _halaman = const [
    Center(child: Text('Halaman Beranda', style: TextStyle(fontSize: 22))),
    Center(child: Text('Halaman Cari', style: TextStyle(fontSize: 22))),
    Center(child: Text('Halaman Profil', style: TextStyle(fontSize: 22))),
  ];

  final List<String> _judul = const ['Beranda', 'Cari', 'Profil'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_judul[_indexAktif]),
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
      ),
      // IndexedStack menjaga state tiap tab saat berpindah
      body: IndexedStack(index: _indexAktif, children: _halaman),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexAktif,
        onTap: (index) => setState(() => _indexAktif = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}