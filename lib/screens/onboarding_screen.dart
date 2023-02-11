import 'dart:async';

import 'package:eat_easy/screens/admin/admin_screen.dart';
import 'package:eat_easy/screens/login_screen.dart';
import 'package:eat_easy/screens/provider_verification.dart';
import 'package:eat_easy/screens/signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Theme/app_colors.dart';
import 'Customer/customer_home.dart';
import 'dashboard_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String id = '/onboarding';

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  double currentPage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: [
                Center(child: Image.asset('assets/Onboarding1.png')),
                Center(child: Image.asset('assets/Onboarding2.png')),
                Center(child: Image.asset('assets/Onboarding3.png')),
              ],
            ),
            Positioned(
              // alignment: Alignment.center,
              bottom: 60,
              left: MediaQuery.of(context).size.width * 0.5 - 32,
              child: SmoothPageIndicator(
                count: 3,
                controller: _pageController,
                effect: const WormEffect(
                  dotWidth: 16,
                  dotHeight: 4,
                  activeDotColor: AppColors.primary,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                height: 42,
                minWidth: MediaQuery.of(context).size.width * 0.9,
                color: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {
                  setState(() {
                    currentPage != 2
                        ? _pageController.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          )
                        : Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => CustomerHome(),
                              //pageBuilder: (_, __, ___) => LoginScreen(),
                              transitionDuration:
                                  const Duration(milliseconds: 300),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(opacity: a, child: c),
                            ),
                          );
                  });
                },
                child: currentPage != 2
                    ? const Text('Next',
                        style: TextStyle(color: AppColors.white))
                    : const Text('Get Started',
                        style: TextStyle(color: AppColors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
