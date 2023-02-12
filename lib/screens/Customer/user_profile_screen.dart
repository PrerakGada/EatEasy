import 'package:eat_easy/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:eat_easy/stores/user_store.dart';

import 'edit_profile.dart';
import 'information.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = '/profile';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentindex = -1;
  List itemList = [
    'Edit Requirements',
    'Set Preferences',
    'Get Rent Agreement',
    'Remove Post'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColors.primaryAccent,
        elevation: 0,
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
            // decoration: BoxDecoration(color: Colors.white),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://instagram.fbom16-1.fna.fbcdn.net/v/t51.2885-19/297723103_131991389535733_3394524039300739566_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fbom16-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=J-GGDJKn0G8AX8UcjQq&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfCcsUikoXEmijklTduHePyrI9Ky7MtRYkVT9kNyY2Uo-A&oe=63EBA0F9&_nc_sid=8fd12b'),
                          radius: 50,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("USERNAME",
                              // UserStore().currUser['name'],
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Mobile Number",
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InformationPage()),
                                );
                              },
                              child: const Icon(Icons.settings)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // ElevatedButton(
                  //   child: const Text("Edit profile"),
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => EditProfilePage()),
                  //     );
                  //   },
                  //
                  // ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      shadowColor: Colors.greenAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(40, 40), //////// HERE
                    ),
                    onPressed: () {
                    Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EditProfilePage()),
                                        );
                    },
                    child: Text("Edit Profile"),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "More Controls",
                      style: TextStyle(
                          color: AppColors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.28,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 10),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // setState(() {
                              //   currentindex = index;
                              // });
                              // currentindex == 1
                              //     ? Navigator.push(
                              //         context,
                              //         PageTransition(
                              //           child: const PreferencesScreen(),
                              //           type: PageTransitionType.fade,
                              //         ),
                              //       )
                              //     : null;
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "${itemList[index]}  >",
                                style: const TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                        itemCount: 4,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
