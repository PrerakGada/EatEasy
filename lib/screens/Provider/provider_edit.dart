import 'package:eat_easy/screens/Provider/provider_verification.dart';
import 'package:eat_easy/screens/onboarding/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eat_easy/widgets/LabeledTextFormField.dart';
import 'package:flutter/material.dart';

class ProviderEdit extends StatefulWidget {
  const ProviderEdit({Key? key}) : super(key: key);

  @override
  State<ProviderEdit> createState() => _ProviderEditState();
}

class _ProviderEditState extends State<ProviderEdit> {
  static const primary = Color(0xffc0e0b2);
  static const primaryAccent = Color(0xff2e6836);
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController imgController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryAccent,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LabeledTextFormField(
                      controller: nameController,
                      title: "Name",
                      hintTitle: "Old name"),
                  SizedBox(height: 18.0),
                  LabeledTextFormField(
                      controller: emailController,
                      title: "Email",
                      hintTitle: "Old Email ID"),
                  SizedBox(height: 18.0),
                  LabeledTextFormField(
                      controller: addressController,
                      title: "Address",
                      hintTitle: "Old address"),
                  SizedBox(height: 18.0),
                  LabeledTextFormField(
                      controller: descController,
                      title: "Description",
                      hintTitle: "Old desc"),
                  SizedBox(height: 18.0),
                  LabeledTextFormField(
                      controller: imgController,
                      title: "Image URL",
                      hintTitle: "Old URL"),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      child: Text('Update',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            color: primaryAccent,
                            fontSize: 20,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
