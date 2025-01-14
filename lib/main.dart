import 'package:flutter/material.dart';
import 'package:weatherapp/pages/home.dart';
import 'package:weatherapp/pages/loading.dart';
import 'package:weatherapp/pages/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Loading(),
      routes: {
        "/home" : (context) => const Home(),
        "/location" : (context) => const Location(),
        "/loading"  : (context) => const Loading(),
      },
    );
  }
}
