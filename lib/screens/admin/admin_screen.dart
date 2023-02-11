import 'package:eat_easy/Theme/app_colors.dart';
import 'package:eat_easy/screens/admin/check_applications_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({super.key});
  static const String id = 'retailer-screen';

  @override
  State<AdminDashBoard> createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Container(
          padding: EdgeInsets.only(top: 70, left: 20, right: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'SATURDAY, 11 FEB',
                        style: TextStyle(fontSize: 11, color: AppColors.black),
                      ),
                      Text(
                        'Good Morning, Siddesh',
                        style: TextStyle(fontSize: 22, color: AppColors.black),
                      )
                    ],
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/admin.png'),
                    maxRadius: 15,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 275,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Search',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      // AuthController.instance.signOut();
                      // auth.error = '';

                      // FirebaseAuth.instance.signOut().then((value) {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => WelcomeScreen(),
                      //       ));
                      // });
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.logout),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 30, right: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   // color: Colors.red,

                //   height: 150,
                //   child: Stack(
                //     children: [
                //       Image.asset('assets/logo.png'),
                //       Padding(
                //         padding: EdgeInsets.only(top: 18, left: 10),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: const [
                //             Text(
                //               'Freshfood from farm',
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 18,
                //               ),
                //             ),
                //             Text(
                //               'Easy to pick your food!',
                //               style: TextStyle(
                //                 color: Color(0xffE2E2E2),
                //                 fontSize: 13,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const CheckApplications(),
                            type: PageTransitionType.fade,
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 235, 235, 235),
                            borderRadius: BorderRadius.circular(20)),
                        width: 150,
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/mobile.png",
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Applications",
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),

      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.white,
      //   child: Container(
      //     height: 50,
      //     child: Row(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Container(
      //           child: Column(
      //             children: [
      //               Image.asset('assets/Layer 2.png'),
      //               Text(
      //                 'Home',
      //                 style: TextStyle(
      //                   color: Color(0xff3dab85),
      //                   fontSize: 12,
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //         Container(
      //           child: Column(
      //             children: [
      //               Image.asset('assets/trash 1.png'),
      //               Text(
      //                 'Cooking Food',
      //                 style: TextStyle(
      //                   color: Colors.grey,
      //                   fontSize: 12,
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //         CircleAvatar(
      //           child: Icon(Icons.search),
      //           backgroundColor: Color(0xff3dab85),
      //         ),
      //         Container(
      //           child: Column(
      //             children: [
      //               Image.asset('assets/heart.png'),
      //               Text(
      //                 'Favourites',
      //                 style: TextStyle(
      //                   color: Colors.grey,
      //                   fontSize: 12,
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //         Container(
      //           child: Column(
      //             children: [
      //               Image.asset('assets/cart.png'),
      //               Text(
      //                 'Cart',
      //                 style: TextStyle(
      //                   color: Colors.grey,
      //                   fontSize: 12,
      //                 ),
      //               )
      //             ],
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
