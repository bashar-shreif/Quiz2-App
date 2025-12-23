import 'package:flutter/material.dart';
import 'data/recipes.dart';
import 'models/recipe.dart';
import 'screens/recipes_screen.dart';
import 'screens/result_screen.dart';
import 'data/values.dart';

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  String currentScreen = "recipes-screen";
  late Widget screenWidget;

  // selectedRatings is initially filled with empty strings because the rating is not yet given.
  List<String> selectedRatings = List.filled(recipes.length, "");
  @override
  void initState() {
    super.initState();
    _updateScreen();
  }

  String topRecipeName() {
    int bestValue = -1;
    String bestName = "";

    for (int i = 0; i < recipes.length; i++) {
      if (selectedRatings[i].isNotEmpty) {
        int value = emojiToValue[selectedRatings[i]]!;
        if (value > bestValue) {
          bestValue = value;
          bestName = recipes[i].recipeName;
        }
      }
    }
    return bestName;
  }

  void _updateScreen() {
    if (currentScreen == "result-screen") {
      screenWidget = ResultScreen(
        topRecipeName: topRecipeName(),
        averageRating: getAverageRating(),
        onRestart: _restart,
      );
    } else {
      screenWidget = RecipesScreen(
        onSelectRating: _selectRating,
        onSubmit: _submit,
      );
    }
  }

  void _restart() {
    setState(() {
      selectedRatings = List.filled(recipes.length, "");
      currentScreen = "recipes-screen";
      _updateScreen();
    });
  }

  double getAverageRating() {
    List<int> validRatings = [];

    for (String rating in selectedRatings) {
      if (rating.isNotEmpty && emojiToValue.containsKey(rating)) {
        validRatings.add(emojiToValue[rating]!);
      }
    }

    if (validRatings.isEmpty) {
      return 0.0;
    }

    int sum = validRatings.reduce((a, b) => a + b);
    return sum / validRatings.length;
  }

  void _submit() {
    bool hasAnyRating = selectedRatings.any((rating) => rating.isNotEmpty);

    if (!hasAnyRating) {
      return;
    }

    setState(() {
      currentScreen = "result-screen";
      _updateScreen();
    });
  }

  void _selectRating(int index, String selectedRating) {
    if (index < 0 || index >= selectedRatings.length) {
      return;
    }

    if (!emojiToValue.containsKey(selectedRating)) {
      return;
    }

    setState(() {
      selectedRatings[index] = selectedRating;
      _updateScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenWidget,
      backgroundColor: const Color.fromARGB(255, 73, 168, 122),
    );
  }
}
