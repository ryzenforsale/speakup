import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Make sure to import your new file



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speak Up',
      theme: ThemeData(
        // This defines the default colors and styles for your app
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Set our new SplashScreen as the starting point of the app
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false, // This removes the "Debug" banner
    );
  }
}
