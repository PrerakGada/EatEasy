import 'package:eat_easy/screens/Provider/provider_verification.dart';
import 'package:eat_easy/screens/onboarding/login_screen.dart';
import 'package:eat_easy/widgets/LabeledTextFormField.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  static const String id = '/SignUpPage';

  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  // Text Editing Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LabeledTextFormField(
                        controller: nameController,
                        title: "Name",
                        hintTitle: "Enter your name"),
                    SizedBox(height: 18.0),
                    LabeledTextFormField(
                        controller: emailController,
                        title: "Email",
                        hintTitle: "Enter your Email ID"),
                    SizedBox(height: 18.0),
                    LabeledTextFormField(
                        controller: passwordController,
                        title: "Password",
                        hintTitle: "Enter your Password"),
                    SizedBox(height: 18.0),
                    LabeledTextFormField(
                        controller: confirmPasswordController,
                        title: "Confirm Password",
                        hintTitle: "Confirm your password"),
                    SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                          child: Text("Aldready a user"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, ProviderVerification.id);
                          },
                          child: Text("Register as a Provider"),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform action}
                        },
                        child: Text("Sign Up"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
