import 'package:eat_easy/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
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
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Colors.white),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://instagram.fbom16-1.fna.fbcdn.net/v/t51.2885-19/297723103_131991389535733_3394524039300739566_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fbom16-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=J-GGDJKn0G8AX8UcjQq&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfCcsUikoXEmijklTduHePyrI9Ky7MtRYkVT9kNyY2Uo-A&oe=63EBA0F9&_nc_sid=8fd12b'),
                          radius: 25,
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: InkWell(
                              onTap: () {
                                // final provider =
                                //     Provider.of<GoogleSignInProvider>(context,
                                //         listen: false);
                                // provider.logOut().then((value) {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //         builder: (context) =>
                                //             LoginSignupChoiceScreen(),
                                //       ));
                                // });
                              },
                              child: Icon(Icons.logout)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Siddesh Shetty",
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Male",
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "More Controls",
                      style: TextStyle(color: AppColors.black),
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
                                style: TextStyle(color: AppColors.black),
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
                  const Divider(
                    color: Colors.black,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Request Refund",
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "You have not taken any plans yet.",
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "About Us",
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Know who we are and what are aim is.",
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Contact Us",
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "We are always here for you.",
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "App Policy",
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Learn why and what data we collect from you.",
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
