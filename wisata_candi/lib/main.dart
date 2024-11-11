import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/screens/home_screen.dart';
import 'package:wisata_candi/screens/profile_screen.dart';
import 'package:wisata_candi/screens/detail_screen.dart';
import 'package:wisata_candi/screens/search_screen.dart';
import 'package:wisata_candi/screens/sign_in_screen.dart';
import 'package:wisata_candi/screens/sing_up_screen.dart';
import 'package:wisata_candi/screens/favorite_screen.dart';

//Import paket-paket yang dibutuhkan
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

// Fungsi main yang mejalankan Aplikasi
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.deepPurple),
          titleTextStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          primary: Colors.deepPurple,
          surface: Colors.deepPurple[50],
        ),
        useMaterial3: true,
      ),
      home: MainScreen(),
      initialRoute: '/',
      routes: {
        '/homescreen': (context) => const HomeScreen(),
        '/signin': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
      },

      // Pertemuan 10-20
      // home: const ProfileScreen(),
      // home: const DetailScreen(candi: candiList[0]),
      // home: const SignInScreen(),
      // home: const SearchScreen(),
      // home: const HomeScreen(),
      // home: const SignUpScreen(),
    );
  }
}


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // TODO: 1. Deklarasikan variabel
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Buat properti body berupa widget yang ditampilkan
      body: _children[_currentIndex],
      // TODO: 3. Buat properti bottomNavigationBar dengan nilai Theme
      bottomNavigationBar: Theme(
        // TODO: 4. Buat data dan Child dari Theme
        data: Theme.of(context).copyWith(canvasColor: Colors.deepPurple[50]),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.deepPurple,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.deepPurple,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.deepPurple,
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
              label: 'Person',
            ),
          ],
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.deepPurple[100],
          showSelectedLabels: true,
        ),
      ),
    );
  }
}
