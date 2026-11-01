import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan 3',
      theme: ThemeData(colorSchemeSeed: Colors.deepPurple, useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const HalamanSatu(),
        '/dua': (context) => const HalamanDua(),
        '/tiga': (context) => const HalamanTiga(),
      },
    );
  }
}

class HalamanSatu extends StatelessWidget {
  const HalamanSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman 1'),
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          // Kirim argumen lewat parameter arguments
          onPressed: () =>
              Navigator.pushNamed(context, '/dua', arguments: 'Halo dari Halaman 1'),
          child: const Text('Ke Halaman 2 (kirim pesan)'),
        ),
      ),
    );
  }
}

class HalamanDua extends StatelessWidget {
  const HalamanDua({super.key});

  @override
  Widget build(BuildContext context) {
    // Terima argumen
    final pesan = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text('Halaman 2'),
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(pesan, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/tiga'),
              child: const Text('Ke Halaman 3'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

class HalamanTiga extends StatelessWidget {
  const HalamanTiga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman 3'),
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () =>
              Navigator.popUntil(context, ModalRoute.withName('/')),
          child: const Text('Kembali ke Halaman 1'),
        ),
      ),
    );
  }
}