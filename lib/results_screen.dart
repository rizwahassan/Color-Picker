import 'package:flutter/material.dart';
import 'saved_screen.dart';

class ResultsScreen extends StatelessWidget {
  final Color selectedColor;

  const ResultsScreen({
    super.key,
    this.selectedColor = const Color(0xFFFF4081),
  });

  String get hexCode =>
      '#${selectedColor.value.toRadixString(16).substring(2).toUpperCase()}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCE4EC),
      appBar: AppBar(
        title: const Text('Color Results'),
        backgroundColor: const Color(0xFFFF4081),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              'Your Selected Color',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: selectedColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'HEX: $hexCode',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SavedScreen(),
                    ),
                  );
                },
                child: const Text('View Saved Colors'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}