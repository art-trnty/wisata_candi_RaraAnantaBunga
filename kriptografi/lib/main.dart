// Import paket-paket yang dibutuhkan
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
// Fungsi main yang menjalankan aplikasi
void main() {
  runApp(const MyApp());
}
// Kelas MyApp, merupakan tampilan awal aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInScreen(), // Halaman pertama yang ditampilkan adalah
        //SignInPage
    );
  }
}
// Kelas SignUpScreen, tampilan untuk proses pendaftaran
class SignUpScreen extends StatelessWidget {
  // Controllers untuk input username dan password
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Logger _logger = Logger(); // Untuk logging
  SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'), // Judul halaman
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Input field untuk username
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Input field untuk password
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _performSignUp(context); // Tombol Sign Up
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
  // Fungsi untuk melakukan proses sign up
  void _performSignUp(BuildContext context) {
    try {
      final prefs = SharedPreferences.getInstance();
      _logger.d('Sign up attempt');
      final String username = _usernameController.text;
      final String password = _passwordController.text;
      // Memeriksa apakah username atau password kosong sebelum melanjutkan sign-up
      if (username.isNotEmpty && password.isNotEmpty) {
        final encrypt.Key key = encrypt.Key.fromLength(32);
        final iv = encrypt.IV.fromLength(16);
        final encrypter = encrypt.Encrypter(encrypt.AES(key));
        final encryptedUsername = encrypter.encrypt(username, iv: iv);
        final encryptedPassword = encrypter.encrypt(password, iv: iv);
        _saveEncryptedDataToPrefs(
          prefs,
          encryptedUsername.base64,
          encryptedPassword.base64,
          key.base64,
          iv.base64,
        ).then((_) {
          Navigator.pop(context);
          _logger.d('Sign up succeeded');
        });
      } else {
        _logger.e('Username or password cannot be empty');
      }
    } catch (e) {
      _logger.e('An error occurred: $e');
    }
  }
  // Fungsi untuk menyimpan data terenkripsi ke SharedPreferences
  Future<void> _saveEncryptedDataToPrefs(
      Future<SharedPreferences> prefs,
      String encryptedUsername,
      String encryptedPassword,
      String keyString,
      String ivString,
      ) async {
    final sharedPreferences = await prefs;
    // Logging: menyimpan data pengguna ke SharedPreferences
    _logger.d('Saving user data to SharedPreferences');
    await sharedPreferences.setString('username', encryptedUsername);
    await sharedPreferences.setString('password', encryptedPassword);
    await sharedPreferences.setString('key', keyString);
    await sharedPreferences.setString('iv', ivString);
  }
}
// Kelas SignInScreen, tampilan untuk proses sign in
class SignInScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Logger _logger = Logger(); // Untuk logging
  SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'), // Judul halaman
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Input field untuk username
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Input field untuk password
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            // Tombol Sign In
            ElevatedButton(
              onPressed: () {
                _performSignIn(context);
              },
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 20),
            // Tombol untuk pindah ke halaman pendaftaran
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
  // Fungsi untuk melakukan proses sign in
  void _performSignIn(BuildContext context) {
    try {
      final prefs = SharedPreferences.getInstance();
      final String username = _usernameController.text;
      final String password = _passwordController.text;
      _logger.d('Sign in attempt');
      if (username.isNotEmpty && password.isNotEmpty) {
        _retrieveAndDecryptDataFromPrefs(prefs).then((data) {
          if (data.isNotEmpty) {
            final decryptedUsername = data['username'];
            final decryptedPassword = data['password'];
            if (username == decryptedUsername && password == decryptedPassword) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
              _logger.d('Sign in succeeded');
            } else {
              _logger.e('Username or password is incorrect');
            }
          } else {
            _logger.e('No stored credentials found');
          }
        });
      } else {
        _logger.e('Username and password cannot be empty');
        // Tambahkan pesan untuk kasus ketika username atau password kosong
      }
    } catch (e) {
      _logger.e('An error occurred: $e');
    }
  }
  // Fungsi untuk mengambil dan mendekripsi data dari SharedPreferences
  Future<Map<String, String>> _retrieveAndDecryptDataFromPrefs(
      Future<SharedPreferences> prefs,
      ) async {
    final sharedPreferences = await prefs;
    final encryptedUsername = sharedPreferences.getString('username') ?? '';
    final encryptedPassword = sharedPreferences.getString('password') ?? '';
    final keyString = sharedPreferences.getString('key') ?? '';
    final ivString = sharedPreferences.getString('iv') ?? '';
    final encrypt.Key key = encrypt.Key.fromBase64(keyString);
    final iv = encrypt.IV.fromBase64(ivString);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decryptedUsername =
    encrypter.decrypt64(encryptedUsername, iv: iv);
    final decryptedPassword =
    encrypter.decrypt64(encryptedPassword, iv: iv);
    // Mengembalikan data terdekripsi
    return {'username': decryptedUsername, 'password': decryptedPassword};
  }
}
// Kelas HomeScreen, halaman utama setelah berhasil sign in
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'), // Judul halaman
      ),
      body: const Center(
        child: Text('Welcome!'), // Pesan selamat datang
      ),
    );
  }
}