import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:kisaankahaak/constants/constants.dart';
// import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../repositories/query_repo.dart';
import '../Admin/admin_screen.dart';

class SellCrops extends StatefulWidget {
  const SellCrops({super.key});

  @override
  State<SellCrops> createState() => _SellCropsState();
}

class _SellCropsState extends State<SellCrops> {
  TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection('users');
  late TimeOfDay time;
  late TimeOfDay picked;
  File? demo;
  var title;
  final user = FirebaseAuth.instance.currentUser;
  late String data;
  bool showSpinner = false;
  late String name;
  final _titleController = TextEditingController();
  final _infoController = TextEditingController();
  final _stockcontroller = TextEditingController();
  final _weightcontroller = TextEditingController();
  final _pricecontroller = TextEditingController();
  DateTime selectedDate = DateTime.now();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  // DatabaseReference db = FirebaseDatabase.instance.ref('Crops');

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

  void _updatetitle(val) {
    setState(() {
      title = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    time = TimeOfDay.now();
  }

  // Future<Null> selectTime(BuildContext context) async {
  //   picked = (await showTimePicker(context: context, initialTime: time))!;

  //   if (picked != null) {
  //     setState(() {
  //       time = picked;
  //     });
  //   }
  // }

  void _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
        data =
            "${selectedDate.toString().split(" ")[0]} ${_timeOfDay.format(context).toString()}:00";
      });
    });
  }

  void _farmername() async {
    final docUser = profileList.doc(user!.uid);
    final snapshot = await docUser.get();
    var data = snapshot.data() as Map;
    // var _list = data.values.toList();
    setState(() {
      name = data["name"];
    });
  }

  // Future<void> createApplication(
  //   String title,
  //   String info,
  // ) async {
  //   // var prefs = await SharedPreferences.getInstance();
  //   // var apiKey = prefs.getString('APIKey');
  //   // var id = prefs.getString('id');
  //   // var campusId = prefs.getString('userCampusList');
  //   // print("creating application......");
  //   // Set s = Provider.of<StatusStore>(context, listen: false).persons;
  //   setState(() {
  //     showSpinner = true;
  //   });

  //   // print("creating application");

  //   var data = jsonEncode({
  //     // "creator": {
  //     //   "id": id,
  //     //   "APIKey": apiKey,
  //     //   "creatorId": "433",
  //     //   "applicationId": "4",
  //     //   "createDate": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())
  //     // },
  //     // "info": info,
  //     // "title": title,
  //     // "postCampusId": campusId,
  //     // "category": {"categoryId": "14008"}
  //   });

  //   String url = '$baseUrl/post/create';

  //   if (demo != null) {
  //     var bytes = await demo.readAsBytes();
  //     var request = http.MultipartRequest('POST', Uri.parse(url));
  //     request.files.add(http.MultipartFile.fromBytes(
  //       'media',
  //       bytes,
  //     ));
  //     request.fields["post"] = data;
  //     var response = await request.send();
  //     await http.Response.fromStream(response).then((value) {
  //       var body = jsonDecode(value.body);
  //       if (body["statusCode"] == "200") {
  //         setState(() {
  //           showSpinner = false;
  //         });
  //         ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(content: Text("Notice Created Successfully!")));
  //       }
  //     });
  //   } else {
  //     var request = http.MultipartRequest('POST', Uri.parse(url));

  //     // request.files.add(file);

  //     request.fields["post"] = data;
  //     var response = await request.send();
  //     await http.Response.fromStream(response).then((value) {
  //       var body = jsonDecode(value.body);
  //       if (body["statusCode"] == "200") {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(content: Text("Notice Created Successfully!")));
  //       }
  //     });
  //   }

  //   // final file = await http.MultipartFile.fromBytes('media', ,
  //   //     contentType: MediaType('applications', 'json'), filename: "images");

  //   // request.files.add(file);
  //   // request.files.add(file);
  // }

  @override
  Widget build(BuildContext context) {
    _farmername();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "Upload Food",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color.fromARGB(255, 175, 255, 155),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              (demo != null)
                  ? Align(
                      alignment: Alignment.center,
                      child: DottedBorder(
                        child: Image.file(
                          demo!.absolute,
                          height: 250,
                          width: 400,
                          scale: 2,
                          fit: BoxFit.scaleDown,
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
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: "Food Name"),
                      onChanged: (value) {
                        _updatetitle(value);
                      },
                    ),
                    TextFormField(
                      controller: _infoController,
                      decoration:
                          const InputDecoration(labelText: "Description"),
                      onChanged: (value) {
                        _updatetitle(value);
                      },
                    ),
                    TextFormField(
                      controller: _stockcontroller,
                      decoration: const InputDecoration(labelText: "Stock"),
                      onChanged: (value) {
                        _updatetitle(value);
                      },
                    ),
                    // TextFormField(
                    //   controller: _weightcontroller,
                    //   decoration: const InputDecoration(labelText: "Weight"),
                    //   onChanged: (value) {
                    //     _updatetitle(value);
                    //   },
                    // ),
                    // TextFormField(
                    //   controller: _pricecontroller,
                    //   keyboardType: TextInputType.number,
                    //   decoration:
                    //       const InputDecoration(labelText: "Base Price"),
                    //   onChanged: (value) {
                    //     _updatetitle(value);
                    //   },
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // selectTime(context);
                            _showTimePicker();
                            // print(DateTime.now());
                            // setState(() {
                            //   print(data);
                            // });
                            DateTime dt1 = DateTime.now();
                            DateTime dt2 = DateTime.parse(data);

                            Duration diff = dt2.difference(dt1);

                            //output (in days): 1198

                            // print(diff.inMinutes);
                            // print(diff.inHours);
                          },
                          icon: const Icon(Icons.alarm),
                          iconSize: 40,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * .7, 50),
                              maximumSize: Size(
                                  MediaQuery.of(context).size.width * .8, 50),
                              backgroundColor: Colors.white),
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime(2015, 8),
                                lastDate: DateTime(2101));
                            if (picked != null && picked != selectedDate) {
                              // setModalState(() {
                              //   selectedDate = picked;
                              // });
                              setState(() {
                                selectedDate = picked;
                                // optionsmap["date"] =
                                //     selectedDate.toString().split(" ")[0];
                              });
                            }
                          },
                          child: Text(
                            " Expiry Date ${_timeOfDay.format(context).toString()}",
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 110,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 162, 243, 165),
                        ),
                        onPressed: () async {
                          if (_titleController.text.trim() != "" &&
                              _infoController.text.trim() != "") {
                            // createApplication(
                            //   _titleController.text.trim(),
                            //   _infoController.text.trim(),
                            // );
                            firebase_storage.Reference ref = firebase_storage
                                .FirebaseStorage.instance
                                .ref('/orders/' +
                                    '${DateTime.now().millisecondsSinceEpoch.toString()}');
                            firebase_storage.UploadTask uploadTask =
                                ref.putFile(demo!.absolute);
                            await Future.value(uploadTask);
                            var newUrl = await ref.getDownloadURL();
                            String id = DateTime.now()
                                .microsecondsSinceEpoch
                                .toString();
                            if (await QueryRepo().uploadFood(
                              _titleController.text,
                              _stockcontroller.text,
                              _infoController.text,
                              newUrl.toString(),
                            )) {
                              // Navigator.pushNamed(context, AdminDashBoard.id);
                            }

                            // db.child(id).set({
                            //   'id': id,
                            //   'title': newUrl.toString(),
                            //   'price': _pricecontroller.text.trim(),
                            //   'desc': _infoController.text.trim(),
                            //   'date': data,
                            //   'max_bid': _pricecontroller.text.trim(),
                            //   'farmer_id': user!.uid.toString(),
                            //   'farmer_name': name.toString()
                            // });

                            _titleController.text = "";
                            _infoController.text = "";
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Title and Info cannot be blank")));
                          }
                        },
                        child: const Text(
                          "Upload",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
