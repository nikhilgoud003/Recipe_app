import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final Map<String, dynamic> recipe;
  final Function(String) toggleFavorite;

  DetailsScreen({required this.recipe, required this.toggleFavorite});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.recipe["isFavorite"];
  }

  void toggleFavoriteStatus() {
    setState(() {
      isFavorite = !isFavorite;
    });
    widget.toggleFavorite(widget.recipe["name"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe["name"])),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ingredients:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(widget.recipe["ingredients"], style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text("Instructions:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(widget.recipe["instructions"], style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white),
                label: Text(
                    isFavorite ? "Remove from Favorites" : "Add to Favorites"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .red, // ✅ FIXED: Use backgroundColor instead of primary
                ),
                onPressed: toggleFavoriteStatus,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
