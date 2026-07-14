import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mi2a_project_pertama/helper/session_manager.dart';
import 'package:mi2a_project_pertama/pages/page_list_berita.dart';
import 'package:mi2a_project_pertama/pages/page_register.dart';
import 'package:mi2a_project_pertama/services/api_service.dart';


class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void login() async {
    if (_usernameController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      _showSnackBar("Semua field harus diisi");
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(ApiService.urlLogin),
        body: {
          'username': _usernameController.text,
          'password': _passwordController.text,
        },
      );

      print(response.statusCode);
      print(response.body);

      final data = jsonDecode(response.body);
      print(data);
      if (data['status'] == true || data['is_success'] == true) {
        _showSnackBar(data['message']);

        //simpan data session
        await SessionManager.saveUserSession(data['data']);

        //arahkan ke page list berita
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const PageListBerita(),
          ),
        );
      } else {
        String pesanGagal = data['message'] ?? "Login gagal";
        _showSnackBar(pesanGagal);
      }
    } catch (e) {
      _showSnackBar(
        'Terjadi kesalahan saat melakukan login',
      );

      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                ),
                onPressed: login,
                child: const Text("Login"),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  //ke page register
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PageRegister(),
                    ),
                  );
                },
                child: Text(
                  "Belum punya akun? Silahkan Register",
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}