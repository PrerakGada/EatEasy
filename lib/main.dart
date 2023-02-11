import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Theme/dark_theme.dart';
import 'Theme/light_theme.dart';

import 'firebase_options.dart';
import 'screens/dashboard_screen.dart';
import 'screens/onboarding_screen.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light_theme(),
      darkTheme: dark_theme(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        Dashboard.id: (context) => Dashboard(),
      },
    );
  }
}
