import 'package:flutter/material.dart';
import 'detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorCaptureScreen(),
    );
  }
}

class ColorCaptureScreen extends StatelessWidget {
  const ColorCaptureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCE4EC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title Text
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Capture The Colors\nAround You.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.2,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/illustration.png',
                    height: 260,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            'Add assets/illustration.png',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8BBD0).withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildColorBox(const Color(0xFF880E4F)), // Burgundy
                    _buildColorBox(const Color(0xFF90A4AE)), // Gray
                    _buildColorBox(const Color(0xFF263238)), // Dark Charcoal
                    _buildColorBox(const Color(0xFFFFCCBC)), // Soft Peach
                  ],
                ),
              ),

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF4081), // Bright pink button
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const detailscreen()),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Start Capturing',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorBox(Color color) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }
}
