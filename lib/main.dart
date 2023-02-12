import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_easy/screens/Admin/admin_screen.dart';
import 'package:eat_easy/screens/Customer/customer_home.dart';
import 'package:eat_easy/screens/Customer/explore_map.dart';
import 'package:eat_easy/screens/Customer/user_profile_screen.dart';
import 'package:eat_easy/screens/Provider/provider_screen.dart';
import 'package:eat_easy/screens/onboarding/login_screen.dart';
import 'package:eat_easy/screens/Provider/provider_verification.dart';
import 'package:eat_easy/screens/user_home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Theme/dark_theme.dart';
import 'Theme/light_theme.dart';

import 'firebase_options.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/onboarding/splash_screen.dart';
import 'stores/user_store.dart';
import 'screens/onboarding/user_signin.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserStore>(
          create: (_) => UserStore(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        theme: light_theme(),
        darkTheme: dark_theme(),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        // initialRoute: SplashScreen.id,
        initialRoute: ProviderDashBoard.id,
        // initialRoute: ExploreMap.id,
        // initialRoute: ProfileScreen.id,
        // initialRoute: AdminDashBoard.id,
        // initialRoute: CustomerHome.id,
        routes: {
          SplashScreen.id: (context) => const SplashScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignUpPage.id: (context) => SignUpPage(),
          OnboardingScreen.id: (context) => OnboardingScreen(),
          CustomerHome.id: (context) => CustomerHome(),
          ProviderVerification.id: (context) => ProviderVerification(),
          AdminDashBoard.id: (context) => AdminDashBoard(),
          HomeScreen.id: (context) => HomeScreen(),
          ProviderDashBoard.id: (context) => ProviderDashBoard(),
          ProfileScreen.id: (context) => ProfileScreen(),
          ExploreMap.id: (context) => ExploreMap(),
        },
      ),
    );
  }
}
