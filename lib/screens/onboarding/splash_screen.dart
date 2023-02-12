import 'dart:async';

import 'package:eat_easy/screens/Admin/admin_screen.dart';
import 'package:eat_easy/screens/Customer/customer_home.dart';
import 'package:eat_easy/screens/Customer/user_home_screen.dart';
import 'package:eat_easy/screens/Provider/provider_screen.dart';
import 'package:eat_easy/screens/Provider/provider_verification.dart';
import 'package:eat_easy/stores/user_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Provider/provider_home_page.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splashscreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late bool isLoggedIn = false;
  late bool isAdmin = false;
  late bool isProvider = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await handleNavigation();
      await UserStore().getCurrUser();
      await UserStore().fetchPendingProviders();
      await UserStore().fetchPendingOrders("");
      await UserStore().fetchNearestRestros("");
    });
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceIn);
    _animationController.forward();
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => isLoggedIn
              ? isAdmin
                  ? const AdminDashBoard()
                  : isProvider
                      ? ProviderHomeScreen()
                      : CustomerHome()
              : const OnboardingScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
    );
  }

  handleNavigation() async {
    if (FirebaseAuth.instance.currentUser != null) {
      print(UserStore().currUser);
      print(await UserStore().getCurrUser());
      isLoggedIn = true;
      if (UserStore().currUser['role'] == 'admin') isAdmin = true;
      print(isAdmin);
      if (UserStore().currUser['role'] == 'provider') isProvider = true;
      print(isProvider);
      print("-------------------------------------------->" +
          UserStore().currUser['role'].toString());
    } else {
      print('NO LOGINS');
      isLoggedIn = false;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFE81667),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image(
            image: const AssetImage(
              'assets/logo_nobg.png',
            ),
            // height: 480,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
