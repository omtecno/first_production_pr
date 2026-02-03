import 'package:flutter/material.dart';

// Screens
import 'package:firstproduction_pro/pages/welcome_screen.dart';
import 'package:firstproduction_pro/pages/signup_screen.dart';
import 'package:firstproduction_pro/pages/set_password_screen.dart';
import 'package:firstproduction_pro/pages/log_in_screen.dart';
import 'package:firstproduction_pro/pages/reset_password_screen.dart';
import 'package:firstproduction_pro/pages/company_verification_screen.dart';
import 'package:firstproduction_pro/pages/university_verification_screen.dart';
import 'package:firstproduction_pro/pages/uni_create_account_screen.dart';
import 'package:firstproduction_pro/pages/create_company_account_screen.dart';
import 'package:firstproduction_pro/pages/Primary_goals.dart'; // Ensure TopBar is here
import 'package:firstproduction_pro/pages/home_page_screen.dart';    // Added for the landing page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Growth App',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.black,
      ),
      // The first screen that loads
      initialRoute: '/',

      routes: {
        '/': (context) => const WelcomeScreen(),
        '/personal': (context) => const SignUpScreen(),
        '/setPassword': (context) => const SetPasswordScreen(),
        '/login': (context) => const LoginScreen(),
        '/resetPassword': (context) => const ResetPasswordScreen(),
        '/organization': (context) => const CompanyVerification(),
        '/university': (context) => const UniversityVerification(),
        '/uniSignUp': (context) => const UniCreateAccountScreen(),
        '/companySignUp': (context) => const CompanyCreateAccountScreen(),
        '/primary': (context) => const TopBar(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}