import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WordDetailScreen extends StatelessWidget {
  final String word;

  const WordDetailScreen({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Lottie.asset(
              'assets/home.json',
              fit: BoxFit.cover,
            ),
            Center(
              child: Hero(
                tag: word,
                child: Card(
                  margin: EdgeInsets.all(20),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          word,
                          style: GoogleFonts.merriweather(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Meaning: Placeholder for the meaning of "$word".',
                          style: GoogleFonts.openSans(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
