import 'package:flutter/material.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';

  bool _obscurePassword = true;

  // TODO: 1. Membuat fungsi _signUp
  void _signUp() {
    String name = _namaController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (password.length < 8 ||
        !password.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[a-z]')) ||
        !password.contains(RegExp(r'[0-9]')) ||
        !password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')))
      print('*** Sign up berhasil!');
    print('Nama : $name');
    print('Nama Pengguna : $username');
    print('Password : $password');
  }

  // TODO: 2. Membuat fungsi dispose
  @override
  void dispose() {
    // TODO: Implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _namaController,
                    decoration: InputDecoration(
                      labelText: "Nama",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Nama Pengguna",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Kata Sandi",
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    obscureText: _obscurePassword,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: _signUp, child: Text('Sign Up')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
