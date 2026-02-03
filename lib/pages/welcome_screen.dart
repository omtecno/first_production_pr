import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.maybePop(context), // Safely go back
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              "What Brings You Here ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "This is your journey, choose how you want to grow.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 24),

            // Option 1: Personal Growth
            _buildActionCard(
              context,
              image: 'assets/images/personal_growth.png',
              routeName: '/personal',
            ),

            const SizedBox(height: 10),

            // Option 2: Organization
            _buildActionCard(
              context,
              image: 'assets/images/organization.png',
              routeName: '/organization',
            ),

            const SizedBox(height: 20),
            _buildFooterText(),
          ],
        ),
      ),
    );
  }

  // Refactored UI helper for cleaner code
  Widget _buildActionCard(BuildContext context, {required String image, required String routeName}) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, routeName),
      borderRadius: BorderRadius.circular(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildFooterText() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        style: TextStyle(fontSize: 14, color: Colors.black54),
        children: [
          TextSpan(text: 'By selecting a path you agree to our\n'),
          TextSpan(
            text: 'Terms of services',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          TextSpan(text: ' and '),
          TextSpan(
            text: 'privacy Policy.',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}