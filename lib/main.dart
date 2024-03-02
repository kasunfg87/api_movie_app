import 'package:flutter/material.dart';
import 'package:movie_app/presentation/navigation/provider/movie_provider.dart';
import 'package:movie_app/presentation/screens/home/home.dart';
import 'package:movie_app/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MovieProvider()),
  ], child: const MyApp()));
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
      routes: routes,
      initialRoute: MyHome.routeName,
    );
  }
}
