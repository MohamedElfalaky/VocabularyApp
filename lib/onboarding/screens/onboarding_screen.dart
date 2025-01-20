import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:vocabulary_app/core/my_application.dart';
import 'package:vocabulary_app/home/screens/home_screen.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final List<Map<String, dynamic>> onboardingData = [
    {
      'text': 'Welcome to Vocabulary App',
      'icon': Icons.book,
    },
    {
      'text': 'Learn new words daily',
      'icon': Icons.access_alarm,
    },
    {
      'text': 'Track your progress',
      'icon': Icons.track_changes,
    },
    {
      'text': 'Get started with us!',
      'icon': Icons.check_circle,
    },
  ];

  int currentIndex = 0;

  // Controller for PageView
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Lottie.asset(
            'assets/onboarding.json',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          onboardingData[index]['icon'],
                          size: 100,
                          color: const Color.fromARGB(255, 120, 160, 230),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            onboardingData[index]['text'],
                            style: GoogleFonts.lato(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              // Page Indicator
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardingData.length, (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: currentIndex == index ? 20 : 10,
                      height: 10,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? Colors.blueAccent
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  }),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    MyApplication.navigateToRemove(context, HomeScreen());
                  },
                  child: Text(
                    "Get Started",
                    style: GoogleFonts.lato(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
