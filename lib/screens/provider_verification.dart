import 'package:eat_easy/repositories/query_repo.dart';
import 'package:eat_easy/screens/Admin/admin_screen.dart';
import 'package:eat_easy/widgets/LabeledTextFormField.dart';
import 'package:flutter/material.dart';
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
              LabeledTextFormField(
                  controller: _usernameController,
                  title: 'Username',
                  hintTitle: 'Enter your name'),
              Spacer(),
              LabeledTextFormField(
                  controller: _emailController,
                  title: 'Email',
                  hintTitle: 'Enter your Email'),
              Spacer(),
              LabeledTextFormField(
                  controller: _mobileController,
                  title: 'Mobile',
                  hintTitle: 'Enter your Mobile Number'),
              Spacer(),
              LabeledTextFormField(
                  controller: _descriptionController,
                  title: 'Description',
                  hintTitle: 'Enter your Description'),
              Spacer(),
              LabeledTextFormField(
                  controller: _fssai_noController,
                  title: 'FSSAI No.',
                  hintTitle: 'Enter your FSSAI no.'),
              Spacer(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
