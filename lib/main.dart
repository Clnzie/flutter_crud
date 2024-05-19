import 'package:flutter/material.dart';
import 'package:flutter_crud/example/asd.dart';
import 'package:flutter_crud/pages/homepage.dart';
import 'package:flutter_crud/pages/view_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
