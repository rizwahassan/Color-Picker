import 'package:flutter/material.dart';
import 'results_screen.dart';
import 'saved_screen.dart';

class detailscreen extends StatefulWidget {
  const detailscreen({super.key});

  @override
  State<detailscreen> createState() => _detailscreenState();
}

class _detailscreenState extends State<detailscreen> {
  Color selectedColor = const Color(0xFFFF4081);

  final List<Color> colors = [
    const Color(0xFFFF4081),
    const Color(0xFFD4E157),
    const Color(0xFF2979FF),
    const Color(0xFF3E0000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCDCDC),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(
                    child: Text(
                      'Camera',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: colors.map((color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedColor == color
                              ? Colors.white
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResultsScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.image,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF4081),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      iconSize: 35,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultsScreen(
                              selectedColor: selectedColor,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SavedScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}