import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:eat_easy/repositories/query_repo.dart';
import 'package:eat_easy/screens/Admin/admin_screen.dart';
import 'package:eat_easy/widgets/LabeledTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProviderVerification extends StatefulWidget {
  static const String id = '/ProviderVerification';

  const ProviderVerification({super.key});

  @override
  _ProviderVerificationState createState() => _ProviderVerificationState();
}

class _ProviderVerificationState extends State<ProviderVerification> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _fssai_noController = TextEditingController();
  final TextEditingController _gst_noController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? demo;

  void onPickImageButtonClicked() async {
    final tempImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (tempImage == null) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('An error occurred. Failed to pick image!'),
      ));
      return;
    }

    setState(() {
      demo = File(tempImage.path);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    _locationController.dispose();
    _fssai_noController.dispose();
    _gst_noController.dispose();
    _descriptionController.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Verification"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              (demo != null)
                  ? Align(
                      alignment: Alignment.center,
                      child: DottedBorder(
                        child: Image.file(
                          demo!.absolute,
                          height: 200,
                          width: 280,
                          scale: 2,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  : Align(
                      alignment: Alignment.center,
                      child: DottedBorder(
                        child: MaterialButton(
                          onPressed: () async {
                            // if (kIsWeb) {
                            //   startweb();
                            // } else {
                            onPickImageButtonClicked();
                          },
                          child: const Icon(Icons.image),
                        ),
                      ),
                    ),
              // SizedBox(
              //   height: 10,
              // ),
              LabeledTextFormField(
                  controller: _usernameController,
                  title: 'Username',
                  hintTitle: 'Enter your name'),
              
              LabeledTextFormField(
                  controller: _emailController,
                  title: 'Email',
                  hintTitle: 'Enter your Email'),
              
              LabeledTextFormField(
                  controller: _mobileController,
                  title: 'Mobile',
                  hintTitle: 'Enter your Mobile Number'),
              
              LabeledTextFormField(
                  controller: _descriptionController,
                  title: 'Description',
                  hintTitle: 'Enter your Description'),
              
              LabeledTextFormField(
                  controller: _fssai_noController,
                  title: 'FSSAI No.',
                  hintTitle: 'Enter your FSSAI no.'),
              
              LabeledTextFormField(
                  controller: _gst_noController,
                  title: 'GST No.',
                  hintTitle: 'Enter your GST no.'),
              Spacer(flex: 3),
              ElevatedButton(
                onPressed: () async {
                  if (await QueryRepo().submitProviderVerification(
                    _usernameController.text,
                    _emailController.text,
                    _mobileController.text,
                    _descriptionController.text,
                    _fssai_noController.text,
                    _gst_noController.text,
                  )) {
                    Navigator.pushNamed(context, AdminDashBoard.id);
                  }
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}