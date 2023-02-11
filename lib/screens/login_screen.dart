import 'package:eat_easy/screens/dashboard_screen.dart';
import 'package:eat_easy/screens/signUp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Theme/app_colors.dart';
import '../widgets/LabeledTextFormField.dart';

import 'package:flutter/gestures.dart';

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Container(
                  height: 300,
                  width: 300,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.grey,
                  ),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LabeledTextFormField(
                          controller: _emailController,
                          title: 'Email',
                          hintTitle: 'Enter your email'),
                      const SizedBox(height: 16),
                      LabeledTextFormField(
                          controller: _passwordController,
                          title: 'Password',
                          hintTitle: 'Enter your password'),
                      const SizedBox(height: 24),
                      MaterialButton(
                        color: AppColors.primaryAccent,
                        minWidth: 200,
                        padding: const EdgeInsets.all(16),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        onPressed: () async {

                          try {
                            print('clicked');
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            print('login successful');
                            Navigator.popAndPushNamed(context, Dashboard.id);
                          } on FirebaseAuthException catch (e) {

                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
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
                                  ..onTap = () => Navigator.popAndPushNamed(context, SignUpScreen.id)),
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
    );
  }
}
