import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Theme/app_colors.dart';
import '../onboarding/splash_screen.dart';

class InformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: const Text('Information'),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16.0),
            Text(
              "Request Refund",
              style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              "You have not taken any plans yet.",
              style: TextStyle(
                  color: AppColors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "About Us",
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Know who we are and our vision.",
                style: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Contact Us",
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "We are always here for you.",
                style: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "App Policy",
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Learn why and what data we collect from you.",
                style: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.popAndPushNamed(context, SplashScreen.id);
              },
              child: Text(
                "Logout",
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
