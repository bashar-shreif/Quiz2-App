import 'package:flutter/material.dart';
import '../widgets/recipe_item.dart';
import '../data/recipes.dart';

class RecipesScreen extends StatelessWidget {
  final void Function(int, String) onSelectRating;
  final Function() onSubmit;

  const RecipesScreen({
    super.key,
    required this.onSelectRating,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...recipes.asMap().entries.map((entry) {
                  int index = entry.key;
                  var recipe = entry.value;

                  return RecipeItem(
                    recipe: recipe,
                    index: index,
                    onSelectRating: onSelectRating,
                  );
                }),

                const SizedBox(height: 20),
                ElevatedButton(onPressed: onSubmit, child: Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
