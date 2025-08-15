import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart'; // The next page to go to

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after a 3-second delay
    Timer(const Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Main Title - "SPEAK UP"
          Center(
            child: Text(
              'SPEAK UP',
              style: GoogleFonts.dancingScript(
                // Using the special font
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 90, 78, 255), // A bright blue color
              ),
            ),
          ),

          // Credits Text at the Bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Make column wrap its content
                children: [
                  Text(
                    'BY',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600], // A nice shade of grey
                      letterSpacing: 1.5, // Spacing between letters
                    ),
                  ),
                  const SizedBox(height: 4), // A little space between the lines
                  Text(
                    'TEAM FOXIN',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
