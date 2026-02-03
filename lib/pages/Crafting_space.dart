import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page_screen.dart'; // Ensure this import matches your file name

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  int _currentStage = 0;
  Timer? _timer;

  final List<Map<String, String>> _loadingStages = [
    {
      'title': 'Crafting your space...',
      'subtitle': 'Personalizing your experience...',
    },
    {
      'title': 'Crafting your space...',
      'subtitle': 'Setting up your wellbeing journey...',
    },
    {
      'title': 'Crafting your space...',
      'subtitle': 'Preparing insights based on your goals...',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startLoadingSequence();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Always cancel timers to prevent memory leaks
    super.dispose();
  }

  void _startLoadingSequence() {
    // Changes stage every 2 seconds
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentStage < _loadingStages.length - 1) {
        setState(() {
          _currentStage++;
        });
      } else {
        _timer?.cancel();
        _navigateToHome();
      }
    });
  }

  void _navigateToHome() {
    // Using a Fade Transition for a "Zen" feel
    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Using AnimatedSwitcher to smoothly swap text
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Text(
                _loadingStages[_currentStage]['title']!,
                key: ValueKey(_currentStage),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Progress Indicators (Dots)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: index == _currentStage ? 14 : 10, // Subtle size change
                  height: index == _currentStage ? 14 : 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index <= _currentStage
                        ? Colors.black
                        : Colors.grey.shade300,
                  ),
                );
              }),
            ),

            const SizedBox(height: 24),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Text(
                _loadingStages[_currentStage]['subtitle']!,
                key: ValueKey(_currentStage + 10), // Unique key for switcher
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}