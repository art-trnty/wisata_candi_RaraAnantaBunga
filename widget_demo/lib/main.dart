import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Galeri Foto'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children:[

          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Image.asset(
              "assets/gambar.jpg",
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Text('Jalan di Barcelona', style: TextStyle(fontWeight: FontWeight.bold,))
            ],
          ),
          
          const Row(
            children: [
              Icon (
                Icons.place,
                color: Colors.red,
              ),
              Text('Lokasi : Barcelona, Spanyol'),
            ],
          ),
          const Row(
            children: [
              Icon (
                Icons.calendar_month,
                color: Colors.blue,
              ),
              Text(' Publikasi : 13 Agustus 2013'),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text("Deskripsi",style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: const Text("Sebuah persimpangan jalan di Barcelona, Spanyol. Foto ini menampilkan berbagai kendaraan yang bergerak dalam arah yang berbeda, menciptakan pemandangan yang sibuk dan energik")
                )
              ],
            )
          )
      ]
      ),
    );// This trailing comma makes auto-formatting nicer for build methods.
  }
}
