import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:lottie/lottie.dart';
import 'package:vocabulary_app/home/screens/word_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> words = [
    'Serendipity',
    'Ephemeral',
    'Petrichor',
    'Ethereal',
    'Solitude'
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Lottie.asset(
            'assets/home.json',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              SizedBox(
                height: 40,
              ),
              _wordNumber(),
              SizedBox(
                height: 12,
              ),
              _currentWordIndicator(context),
              _wordPageView(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Current Word: ${words[currentIndex]}',
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Expanded _wordPageView() {
    return Expanded(
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          Haptics.vibrate(HapticsType.success);
          setState(() {
            currentIndex = index % words.length; // Ensure it loops correctly
          });
        },
        itemBuilder: (context, index) {
          final word = words[index % words.length]; // Loop through words
          return Center(
            child: GestureDetector(
              onTap: () {
                Haptics.vibrate(HapticsType.selection);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WordDetailScreen(word: word),
                  ),
                );
              },
              child: Hero(
                tag: word,
                child: Card(
                  margin: EdgeInsets.all(20),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      word,
                      style: GoogleFonts.merriweather(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox _currentWordIndicator(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
        tween: Tween<double>(
          begin: (currentIndex) / words.length, // Start from current progress
          end: (currentIndex + 1) / words.length, // End at the next progress
        ),
        builder: (context, value, _) => LinearProgressIndicator(
          value: value,
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
          color: Theme.of(context).primaryColor,
          minHeight: 6.0,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  AnimatedSwitcher _wordNumber() {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: Text(
        '${currentIndex + 1} / ${words.length}',
        key: ValueKey<int>(currentIndex),
        style: GoogleFonts.lato(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
