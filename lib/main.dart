import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_easy/screens/login_screen.dart';
import 'package:eat_easy/screens/provider_verification.dart';
import 'package:eat_easy/screens/signUp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Theme/dark_theme.dart';
import 'Theme/light_theme.dart';

import 'firebase_options.dart';
import 'screens/dashboard_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final db = FirebaseFirestore.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light_theme(),
      darkTheme: dark_theme(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        Dashboard.id: (context) => Dashboard(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        OnboardingScreen.id: (context) => OnboardingScreen(),
        ProviderVerification.id: (context) => ProviderVerification(),
      },
    );
  }
}
