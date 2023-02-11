import 'package:eat_easy/screens/Customer/customer_home.dart';
import 'package:eat_easy/screens/Provider/provider_screen.dart';
import 'package:eat_easy/screens/Provider/provider_verification.dart';
import 'package:eat_easy/screens/admin/admin_screen.dart';
import 'package:eat_easy/screens/onboarding/user_signin.dart';
import 'package:eat_easy/screens/user_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Theme/app_colors.dart';
import '../../repositories/auth_repo.dart';
import '../../widgets/LabeledTextFormField.dart';

import 'package:flutter/gestures.dart';
import 'package:eat_easy/stores/user_store.dart';
import 'package:eat_easy/repositories/query_repo.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    height: 500,
                    width: 500,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.primaryAccent,
                    ),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LabeledTextFormField(
                            controller: _emailController,
                            title: 'Email',
                            hintTitle: 'Enter your email'),
                        const SizedBox(height: 30),
                        LabeledTextFormField(
                            controller: _passwordController,
                            title: 'Password',
                            hintTitle: 'Enter your password'),
                        const SizedBox(height: 30),
                        MaterialButton(
                          color: AppColors.primary,
                          minWidth: 200,
                          padding: const EdgeInsets.all(16),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          onPressed: () async {
                            // if (await AuthRepo().login(_emailController.text,
                            //     _passwordController.text)) {
                            Navigator.popAndPushNamed(
                                context, ProviderDashBoard.id);
                            // } else {
                            //   print('error');
                            // }
                          },
                          child: const Text(
                            'Login!',
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 50),
                        RichText(
                          text: TextSpan(
                            text: 'New here?',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Sign Up!',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff06e357),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.popAndPushNamed(
                                        context, SignUpPage.id)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
