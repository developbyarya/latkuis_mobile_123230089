import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/screen/login_page.dart';
import 'package:latihan_kuis_a/screen/moviel_list_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',

      routes: {
        '/login': (context) => const LoginPage(),
        '/': (context) => const MovieListPage(),
      },
    );
  }
}
