import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderVerification extends StatefulWidget {
  static const String id = '/ProviderVerification';
  @override
  _ProviderVerificationState createState() => _ProviderVerificationState();
}

class _ProviderVerificationState extends State<ProviderVerification> {
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
    _emailController.dispose();
    _passwordController.dispose();
  }
  final _formKey = GlobalKey<FormState>();

  String? _username;
  String? _emailID;
  String? _mobile;
  String? _description;
  String? _fssai_no;
  String? _location;
  String? _gst_no;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Verification"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
          TextFormField(

          decoration: InputDecoration(
          labelText: "Username",
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter a username";
            }
            return null;
          },
          onSaved: (value) => _username = value,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Email ID",
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter an email ID";
            }
            return null;
          },
          onSaved: (value) => _emailID = value,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Mobile",
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter a mobile number";
            }
            return null;
          },
          onSaved: (value) => _mobile = value,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Description",
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter a description";
            }
            return null;
          },
          onSaved: (value) => _description = value,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "FSSAI No.",
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter an FSSAI number";
            }
            return null;
          },
          onSaved: (value) => _fssai_no = value,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Location",
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter a location";
            }
            return null;
          },
          onSaved: (value) => _location = value,
        ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "GST No.",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter a GST number";
              }
              return null;
            },
            onSaved: (value) => _gst_no = value,
          ),
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Perform the necessary actions with the collected data
              }
            },
            child: Text("Submit"),
          ),
          ],
        ),
      ),
    ),
    );
  }

  RaisedButton({required Null Function() onPressed, required Text child}) {}
}




