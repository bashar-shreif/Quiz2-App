import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double averageRating;
  final String topRecipeName;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.averageRating,
    required this.topRecipeName,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Average Rating: ${averageRating.toStringAsFixed(1)} ⭐",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Top Recipe: $topRecipeName",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: onRestart,
              child: const Text("Restart"),
            ),
          ],
        ),
      ),
    );
  }
}
