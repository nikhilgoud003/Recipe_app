// main.dart
import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favourites_screen.dart';

void main() {
  runApp(RecipeBookApp());
}

class RecipeBookApp extends StatefulWidget {
  @override
  _RecipeBookAppState createState() => _RecipeBookAppState();
}

class _RecipeBookAppState extends State<RecipeBookApp> {
  List<String> recipes = ['Pasta', 'Pizza', 'Salad'];
  List<String> favoriteRecipes = [];

  void toggleFavorite(String recipe) {
    setState(() {
      if (favoriteRecipes.contains(recipe)) {
        favoriteRecipes.remove(recipe);
      } else {
        favoriteRecipes.add(recipe);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: HomeScreen(
        recipes: recipes,
        favoriteRecipes: favoriteRecipes,
        toggleFavorite: toggleFavorite,
      ),
    );
  }
}

// home_screen.dart
class HomeScreen extends StatelessWidget {
  final List<String> recipes;
  final List<String> favoriteRecipes;
  final Function(String) toggleFavorite;

  HomeScreen({
    required this.recipes,
    required this.favoriteRecipes,
    required this.toggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe Book')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index]),
            trailing: Icon(
              favoriteRecipes.contains(recipes[index])
                  ? Icons.favorite
                  : Icons.favorite_border,
              color:
                  favoriteRecipes.contains(recipes[index]) ? Colors.red : null,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    recipeName: recipes[index],
                    isFavorite: favoriteRecipes.contains(recipes[index]),
                    toggleFavorite: toggleFavorite,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritesScreen(
                favoriteRecipes: favoriteRecipes,
              ),
            ),
          );
        },
      ),
    );
  }
}
