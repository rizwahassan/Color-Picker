import 'package:flutter/material.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final List<Color> savedColors = [
    const Color(0xFFFF4081),
    const Color(0xFFD4E157),
    const Color(0xFF2979FF),
    const Color(0xFF3E0000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCE4EC),
      appBar: AppBar(
        title: const Text('Saved Colors'),
        backgroundColor: const Color(0xFFFF4081),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: savedColors.length,
        itemBuilder: (context, index) {
          final color = savedColors[index];

          final hex = '#${color.value.toRadixString(16)
              .substring(2).toUpperCase()}';

          return Card(
            child: ListTile(
              leading: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              title: Text(hex),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    savedColors.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}