import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import http

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _login() async {
    String username = usernameController.text;
    String password = passwordController.text;

    var url = Uri.parse('http://localhost:5000/api/endpoint'); // Ganti sesuai dengan URL API Anda

    try {
      var response = await http.post(url, body: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        // Berhasil menerima respons dari server
        print('Berhasil: ${response.body}');
      } else {
        // Gagal menerima respons dari server
        print('Gagal: ${response.reasonPhrase}');
      }
    } catch (error) {
      // Ada kesalahan koneksi atau lainnya
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController, // Tambahkan controller
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: passwordController, // Tambahkan controller
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true, // Untuk menyembunyikan teks pada password
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _login, // Panggil fungsi _login saat tombol ditekan
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
