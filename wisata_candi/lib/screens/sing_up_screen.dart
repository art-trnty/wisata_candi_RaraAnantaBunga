import 'package:flutter/material.dart';

class SingUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<_SignUpScreenState> {
  // TODO: 1. PDeklarasikan variabel
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passswordController = TextEditingController();

  String _errorText = '';

  bool _isSignedIn = false;

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Pasang AppBar
      appBar: AppBar(title: Text('Sign In'),),
      // TODO: 3. Pasang Body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding : const EdgeInsets.all(16),
            child: Form(
              child: Column(
                // TODO: 4. Atur mainAxisAligment dan crossAxisAligment
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TODO: 5. Pasang TextFormField Nama Pengguna
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Nama Pengguna",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // TODO: 6. Pasang TextFormField Kata Sandi
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passswordController,
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
                          _obscurePassword ? Icons.visibility_off
                              : Icons.visibility,
                        ),),
                    ),
                    obscureText: _obscurePassword,
                  ),
                  // TODO: 7. Pasang TextFormButton Sign In
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: (){},
                      child: Text('Sign In')),
                  // TODO: 8. Pasang TextButton Sign In
                  SizedBox(height: 10),
                  // Alternatif
                  // TextButton(
                  //     onPressed: (){},
                  //     child: Text('Belum punya akun? Daftar disini.')),
                  RichText(
                    text: TextSpan(
                      text: 'Belum punya akun? ',
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      children: <TextSpan> [
                        TextSpan(
                          text: 'Daftar disini.',
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              fontSize: 16
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

