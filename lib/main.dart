import 'package:bashar_shreif_101220904/recipe_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RecipeApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
