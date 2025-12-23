import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../data/values.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  final int index;
  final void Function(int, String) onSelectRating;

  const RecipeItem({
    super.key,
    required this.recipe,
    required this.index,
    required this.onSelectRating,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${index + 1}. ${recipe.recipeName}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                ...emojiToValue.entries.map((entry) {
                  return Row(
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            onSelectRating(index, entry.key), // Fixed this line
                        child: Text(entry.key),
                      ),
                      SizedBox(width: 10),
                    ],
                  );
                }),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
