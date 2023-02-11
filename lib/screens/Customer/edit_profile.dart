import 'package:eat_easy/Theme/app_colors.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailIdController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  String? _emailID;
  String? _address;
  String? _location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height:  150,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email ID',
                ),
                onSaved: (value) => _emailID = value,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
                onSaved: (value) => _address = value,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Location',
                ),
                onSaved: (value) => _location = value,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Save'),
                onPressed: () {

                },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryAccent,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(
                    color: AppColors.primaryAccent,
                    fontSize: 20,
                  )),


              ),
            ],
          ),
        ),
      ),
    );
  }
}
