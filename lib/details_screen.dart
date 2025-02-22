import 'package:flutter/material.dart';
import 'favourites_screen.dart';
import 'main.dart';

// details_screen.dart
class DetailsScreen extends StatelessWidget {
  final String recipeName;
  final bool isFavorite;
  final Function(String) toggleFavorite;

  DetailsScreen({
    required this.recipeName,
    required this.isFavorite,
    required this.toggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipeName)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingredients:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('- Sample Ingredient 1\n- Sample Ingredient 2'),
            SizedBox(height: 10),
            Text('Instructions:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('1. Step one\n2. Step two'),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                toggleFavorite(recipeName);
              },
              child: Text(isFavorite ? 'Unfavorite' : 'Favorite'),
            ),
          ],
        ),
      ),
    );
  }
}
