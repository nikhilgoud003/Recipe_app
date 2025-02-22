import 'package:flutter/material.dart';
import 'main.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteRecipes;

  FavoritesScreen({required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Recipes")),
      body: favoriteRecipes.isEmpty
          ? Center(
              child: Text("No favorite recipes yet.",
                  style: TextStyle(fontSize: 18)))
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoriteRecipes[index]['name']),
                  subtitle: Text(favoriteRecipes[index]['ingredients']),
                );
              },
            ),
    );
  }
}
