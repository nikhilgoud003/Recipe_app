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
  List<Map<String, dynamic>> recipes = [
    {
      "name": "Fried rice",
      "ingredients": "rice,oil , Eggs",
      "instructions": "Mix ingredients.Make rice fried under oil",
      "isFavorite": false
    },
    {
      "name": "Biryani",
      "ingredients": "Briyani rice , spices , oil",
      "instructions": "Mix ingredients. make biryani and boil it .",
      "isFavorite": false
    },
    {
      "name": "Pancakes",
      "ingredients": "Flour, Milk, Eggs, Sugar, Baking Powder",
      "instructions": "Mix ingredients. Cook on a hot pan until golden brown.",
      "isFavorite": false
    },
    {
      "name": "Omelette",
      "ingredients": "Eggs, Salt, Pepper, Onion, Tomato",
      "instructions":
          "Beat eggs. Fry with chopped onion and tomato until cooked.",
      "isFavorite": false
    },
    {
      "name": "Garlic Butter Shrimp",
      "ingredients": "Shrimp, Garlic, Butter, Lemon, Parsley",
      "instructions":
          "Sauté garlic in butter. Add shrimp and cook. Finish with lemon and parsley.",
      "isFavorite": false
    },
    {
      "name": "Mango Smoothie",
      "ingredients": "Mango, Milk, Yogurt, Honey",
      "instructions": "Blend all ingredients until smooth.",
      "isFavorite": false
    },
    {
      "name": "Grilled Cheese Sandwich",
      "ingredients": "Bread, Butter, Cheese",
      "instructions":
          "Butter bread. Place cheese in between and grill until golden brown.",
      "isFavorite": false
    },
    {
      "name": "Tomato Soup",
      "ingredients": "Tomatoes, Garlic, Onion, Salt, Pepper",
      "instructions":
          "Blend cooked tomatoes, garlic, and onion. Simmer and season to taste.",
      "isFavorite": false
    },
    {
      "name": "Spaghetti Carbonara",
      "ingredients": "Spaghetti, Eggs, Bacon, Parmesan, Black Pepper",
      "instructions":
          "Cook spaghetti. Mix with beaten eggs, bacon, and cheese.",
      "isFavorite": false
    },
    {
      "name": "Vegetable Stir-Fry",
      "ingredients": "Broccoli, Carrots, Bell Peppers, Soy Sauce, Garlic",
      "instructions":
          "Stir-fry vegetables in soy sauce and garlic until tender.",
      "isFavorite": false
    },
    {
      "name": "Chocolate Brownies",
      "ingredients": "Cocoa Powder, Sugar, Butter, Flour, Eggs",
      "instructions": "Mix ingredients. Bake at 350°F for 25 minutes.",
      "isFavorite": false
    },
    {
      "name": "Chicken Wrap",
      "ingredients": "Tortilla, Chicken, Lettuce, Tomato, Cheese",
      "instructions": "Grill chicken. Wrap in tortilla with other ingredients.",
      "isFavorite": false
    },
  ];

  List<Map<String, dynamic>> get favoriteRecipes =>
      recipes.where((recipe) => recipe['isFavorite']).toList();

  void toggleFavorite(String recipeName) {
    setState(() {
      for (var recipe in recipes) {
        if (recipe["name"] == recipeName) {
          recipe["isFavorite"] = !recipe["isFavorite"];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(
          recipes: recipes,
          toggleFavorite: toggleFavorite,
          favoriteRecipes: favoriteRecipes),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> recipes;
  final List<Map<String, dynamic>> favoriteRecipes;
  final Function(String) toggleFavorite;

  HomeScreen(
      {required this.recipes,
      required this.toggleFavorite,
      required this.favoriteRecipes});

  // Define a list of colors
  final List<Color> cardColors = [
    Colors.orange.shade200,
    Colors.green.shade200,
    Colors.blue.shade200,
    Colors.red.shade200,
    Colors.purple.shade200,
    Colors.yellow.shade200,
    Colors.pink.shade200,
    Colors.teal.shade200,
    Colors.brown.shade200,
    Colors.cyan.shade200,
    Colors.indigo.shade200,
    Colors.lime.shade200,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Recipes Store")),
      body: Container(
        color: Colors.blueGrey.shade50, // Light background color
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Card(
              color: cardColors[index %
                  cardColors.length], // Assign different colors cyclically
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  recipes[index]['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  recipes[index]['isFavorite']
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: recipes[index]['isFavorite'] ? Colors.red : null,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        recipe: recipes[index],
                        toggleFavorite: toggleFavorite,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  FavoritesScreen(favoriteRecipes: favoriteRecipes),
            ),
          );
        },
      ),
    );
  }
}
