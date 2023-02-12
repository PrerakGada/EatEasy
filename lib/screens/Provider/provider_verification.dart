import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:eat_easy/Theme/app_colors.dart';
import 'package:eat_easy/repositories/query_repo.dart';
import 'package:eat_easy/screens/Admin/admin_screen.dart';
import 'package:eat_easy/screens/onboarding/login_screen.dart';
import 'package:eat_easy/screens/onboarding/splash_screen.dart';
import 'package:eat_easy/stores/user_store.dart';
import 'package:eat_easy/widgets/LabeledTextFormField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:provider/provider.dart';

import '../../Theme/app_colors.dart';
import '../../widgets/location_screen.dart';

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
  final TextEditingController _addressController = TextEditingController();
  File? demo;
  File? aadhar;
  File? pan;

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

  void onPickAadharButtonClicked() async {
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
      aadhar = File(tempImage.path);
    });
  }

  void onPickPanButtonClicked() async {
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
      pan = File(tempImage.path);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _addressController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    _locationController.dispose();
    _fssai_noController.dispose();
    _gst_noController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryAccent,
      appBar: AppBar(
        title: const Text("Provider Verification"),
        elevation: 0,
        backgroundColor: AppColors.primaryAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: 24),
                LabeledTextFormField(
                    controller: _usernameController,
                    title: 'Name',
                    hintTitle: 'Enter your name'),
                SizedBox(height: 24),
                LabeledTextFormField(
                    controller: _emailController,
                    title: 'Email',
                    hintTitle: 'Enter your Email'),
                SizedBox(height: 24),
                LabeledTextFormField(
                    controller: _passwordController,
                    title: 'Password',
                    hintTitle: 'Enter your Password'),
                SizedBox(height: 24),
                LabeledTextFormField(
                    controller: _mobileController,
                    title: 'Mobile',
                    hintTitle: 'Enter your Mobile Number'),
                SizedBox(height: 24),
                LabeledTextFormField(
                    controller: _descriptionController,
                    title: 'Description',
                    hintTitle: 'Enter your Description',
                    maxLines: 5),
                // SizedBox(height: 24),
                // LabeledTextFormField(
                //     controller: _addressController,
                //     title: 'Address',
                //     hintTitle: 'Enter your Address'),
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: LocationScreen(),
                ),
                SizedBox(height: 24),
                LabeledTextFormField(
                    controller: _fssai_noController,
                    title: 'FSSAI No.',
                    hintTitle: 'Enter your FSSAI no.'),
                SizedBox(height: 24),
                LabeledTextFormField(
                    controller: _gst_noController,
                    title: 'GST No.',
                    hintTitle: 'Enter your GST no.'),
                SizedBox(height: 14),
                Text(
                  "Supporting Documents :",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    (aadhar != null)
                        ? IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.done),
                            color: Colors.white,
                          )
                        : MaterialButton(
                            color: AppColors.primary,
                            onPressed: () async {
                              // if (kIsWeb) {
                              //   startweb();
                              // } else {
                              onPickAadharButtonClicked();
                            },
                            child: const Text("Aadhar")),
                    const SizedBox(
                      width: 10,
                    ),
                    (pan != null)
                        ? IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.done),
                            color: Colors.white,
                          )
                        : MaterialButton(
                            color: AppColors.primary,
                            onPressed: () async {
                              // if (kIsWeb) {
                              //   startweb();
                              // } else {
                              onPickPanButtonClicked();
                            },
                            child: const Text("Pancard")),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async {
                      firebase_storage.Reference ref = firebase_storage
                          .FirebaseStorage.instance
                          .ref('/restroimages/' +
                              '${DateTime.now().millisecondsSinceEpoch.toString()}');
                      firebase_storage.UploadTask uploadTask =
                          ref.putFile(demo!.absolute);
                      await Future.value(uploadTask);
                      var newUrl = await ref.getDownloadURL();
                      firebase_storage.Reference ref1 = firebase_storage
                          .FirebaseStorage.instance
                          .ref('/documents/' +
                              '${DateTime.now().millisecondsSinceEpoch.toString()}');
                      firebase_storage.UploadTask uploadTaskAadhar =
                          ref1.putFile(aadhar!.absolute);
                      await Future.value(uploadTaskAadhar);
                      var newUrlAadhar = await ref1.getDownloadURL();
                      firebase_storage.Reference ref2 = firebase_storage
                          .FirebaseStorage.instance
                          .ref('/documents/' +
                              '${DateTime.now().millisecondsSinceEpoch.toString()}');
                      firebase_storage.UploadTask uploadTaskPan =
                          ref2.putFile(pan!.absolute);
                      await Future.value(uploadTaskPan);
                      var newUrlPan = await ref2.getDownloadURL();

                      if (await QueryRepo().submitProviderVerification(
                        name: _usernameController.text,
                        email: _emailController.text,
                        mobile: _mobileController.text,
                        description: _descriptionController.text,
                        FSSAI: _fssai_noController.text,
                        GST: _gst_noController.text,
                        imageUrl: newUrl.toString(),
                        aadhar: newUrlAadhar.toString(),
                        pan: newUrlPan.toString(),
                        lat: UserStore().lat,
                        long: UserStore().lang,
                        address: UserStore().address,
                        password: _passwordController.text,
                      )) {
                        await FirebaseAuth.instance.signOut();
                        Navigator.popAndPushNamed(context, SplashScreen.id);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        textStyle: TextStyle(
                          fontSize: 15,
                        )),
                    /**/ child: const Text("Submit",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        textStyle: TextStyle(
                          fontSize: 15,
                        )),
                    child: const Text("Already registered?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
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
