import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/screens/profile_screen.dart';
import 'package:wisata_candi/screens/detail_screen.dart';
import 'package:wisata_candi/screens/sign_in_screen.dart';
import 'package:wisata_candi/screens/sing_up_screen.dart';

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
      // home: ProfileScreen(),
      // home: DetailScreen(candi: candiList[0]),
      // home: SignInScreen(),
      home: SignUpScreen(),
    );
  }
}
