import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eat_easy/screens/Provider/provider_screen.dart';
import 'package:flutter/material.dart';

import '../../Theme/app_colors.dart';
import '../Customer/user_profile_screen.dart';

class ProviderHomeScreen extends StatelessWidget {
  static const String id = '/providerHome';
  final PageController _pageController = PageController();

   ProviderHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          ProviderDashBoard(),
          // ExploreMap(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        color: AppColors.primaryAccent,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 100),
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
        items: [
          Icon(Icons.home_filled, color: AppColors.black),
          Icon(Icons.explore, color: AppColors.black),
          Icon(Icons.account_circle, color: AppColors.black),
        ],
      ),
    );
  }
}
