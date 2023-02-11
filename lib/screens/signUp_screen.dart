import 'package:flutter/material.dart';

import '../Theme/app_colors.dart';
import '../widgets/LabeledTextFormField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
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
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 24),
                Container(
                  height: 400,
                  width: 300,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LabeledTextFormField(
                          controller: _nameController,
                          title: 'Name',
                          hintTitle: 'Enter your name'),
                      SizedBox(height: 16),
                      LabeledTextFormField(
                          controller: _emailController,
                          title: 'Email',
                          hintTitle: 'Enter your email'),
                      SizedBox(height: 16),
                      LabeledTextFormField(
                          controller: _passwordController,
                          title: 'Password',
                          hintTitle: 'Enter your password'),
                      SizedBox(height: 24),
                      MaterialButton(
                        color: AppColors.primaryAccent,
                        minWidth: 200,
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        onPressed: () async {},
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )
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
