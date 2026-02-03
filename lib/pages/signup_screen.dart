import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // Simple validation logic before moving to Set Password
  void _onSignUpPressed() {
    if (_nameController.text.isNotEmpty && 
        _emailController.text.isNotEmpty && 
        _phoneController.text.isNotEmpty) {
      
      // Navigate to the SetPasswordScreen
      Navigator.pushNamed(context, '/setPassword');
      
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in all fields to continue"),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create Your Account',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Onboard to a More Balanced Life....',
              style: TextStyle(fontSize: 16, color: Colors.grey, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 32),
            
            _buildInputField("Full Name", "John Smith", _nameController),
            _buildInputField("Email Address", "email@example.com", _emailController, inputType: TextInputType.emailAddress),
            _buildInputField("Number", "+91", _phoneController, inputType: TextInputType.phone),
            
            const SizedBox(height: 20),
            
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _onSignUpPressed, // Triggering the navigation/validation
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 0,
                ),
                child: const Text('Create Account', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
            
            const SizedBox(height: 30),
            _buildDivider(),
            const SizedBox(height: 30),
            
            _buildSocialButton(
              "Continue with Google", 
              Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png', width: 24,),
              onTap: () => print("Google Sign Up Logic"),
            ),
            const SizedBox(height: 16),
            _buildSocialButton(
              "Continue with iOS", 
              const Icon(Icons.apple, color: Colors.black, size: 28),
              onTap: () => print("Apple Sign Up Logic"),
            ),
            
            const SizedBox(height: 32),
            
            Center(
              child: GestureDetector(
                onTap: () {
                  // If you have a login route defined:
                  // Navigator.pushNamed(context, '/login');
                  print("Navigate to Login");
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                    children: [
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Reusable helper for input fields
  Widget _buildInputField(String label, String hint, TextEditingController controller, {TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            keyboardType: inputType,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.shade400),
              filled: true,
              fillColor: Colors.grey.shade50,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.black, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("OR SIGN UP WITH", style: TextStyle(color: Colors.grey.shade500, fontSize: 12, fontWeight: FontWeight.w600)),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildSocialButton(String text, Widget iconWidget, {required VoidCallback onTap}) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconWidget,
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}