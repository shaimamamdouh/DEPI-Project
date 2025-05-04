import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF6E3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEF6E3),
        elevation: 0,
        title: const Text(
          'Favorites',
          style: TextStyle(
            color: Color(0xFF392626),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: const Text(
          'This is the Favorites Page',
          style: TextStyle(fontSize: 24, color: Color(0xFF392626)),
        ),
      ),
    );
  }
}
