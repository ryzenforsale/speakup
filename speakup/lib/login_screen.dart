import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart'; // ADDED: Import for Firebase Auth
import 'dashboard_screen.dart'; // Import your dashboard screen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _codeController = TextEditingController();

  

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  // ADDED: New function to handle the entire login process
  Future<void> _login() async {
    // Show a loading circle
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // Try to sign in the user with Firebase
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // If sign-in is successful, pop the loading circle
      if (mounted) Navigator.of(context).pop();

      // Navigate to the dashboard and clear all previous screens
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
        (route) => false,
      );

    } on FirebaseAuthException catch (e) {
      // If there's an error, pop the loading circle
      if (mounted) Navigator.of(context).pop();

      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Failed to log in")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),

              Text(
                'SPEAK UP',
                style: GoogleFonts.dancingScript(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0096FF),
                ),
              ),

              const SizedBox(height: 30),

              const CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xFFE0F7FA),
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Color(0xFF0096FF),
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Log in here!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 24),

              // Email Text Field
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'email@domain.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Password Text Field
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'NAME',
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
      
                ),
                
                    
              ),
              const SizedBox(height: 16),
              TextField(
              controller: _ageController,
                decoration: InputDecoration(
                  labelText: 'AGE',
                  hintText: 'Enter your AGE',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
      
                ),
              ),
              const SizedBox(height: 16),


              TextField(
              controller: _codeController,
                decoration: InputDecoration(
                  labelText: 'CODE',
                  hintText: 'Enter your CODE',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
      
                ),
              ),                

              const SizedBox(height: 16),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login, // MODIFIED: Call the new _login function
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0096FF),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),

              

              
              const SizedBox(height: 24),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'By clicking continue, you agree to our Terms of Service and Privacy Policy',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }