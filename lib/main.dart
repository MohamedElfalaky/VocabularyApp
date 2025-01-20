import 'package:flutter/material.dart';
import 'package:vocabulary_app/onboarding/screens/onboarding_screen.dart';

void main() {
  runApp(VocabularyApp());
}

class VocabularyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vocabulary App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardingPage(),
    );
  }
}
