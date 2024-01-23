import 'package:flutter/material.dart';
import 'package:movie_app/presentation/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Api Movie App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHome(),
    );
  }
}
