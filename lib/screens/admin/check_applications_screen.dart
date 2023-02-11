import 'package:eat_easy/Theme/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CheckApplications extends StatefulWidget {
  const CheckApplications({super.key});
  static const String id = 'retailer-screen';

  @override
  State<CheckApplications> createState() => _CheckApplicationsState();
}

class _CheckApplicationsState extends State<CheckApplications> {
  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Applications")),
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(150),
      //   child: Container(
      //     padding: const EdgeInsets.only(top: 70, left: 20, right: 30),
      //     child: Column(
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Column(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: const [
      //                 Text(
      //                   'SATURDAY, 11 FEB',
      //                   style: TextStyle(fontSize: 11, color: AppColors.black),
      //                 ),
      //                 Text(
      //                   'Good Morning, Siddesh',
      //                   style: TextStyle(fontSize: 22, color: AppColors.black),
      //                 )
      //               ],
      //             ),
      //             const Spacer(),
      //             const CircleAvatar(
      //               backgroundImage: AssetImage('assets/admin.png'),
      //               maxRadius: 15,
      //             )
      //           ],
      //         ),
      //         const SizedBox(
      //           height: 20,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 245, 245),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: const DecorationImage(
                                        image: NetworkImage(
                                            "https://content.jdmagicbox.com/comp/mumbai/46/022p5463446/catalogue/new-shahi-family-restaurant-mira-road-thane-tandoori-restaurants-c7lj66kagt.jpg?clr="),
                                        fit: BoxFit.fill)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "New Shahi Restaurant",
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Opp old petrol pump Thane-401107",
                                    style: TextStyle(
                                        color: AppColors.black.withOpacity(0.4),
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Status: ',
                                            style: TextStyle(
                                                color: AppColors.black)),
                                        TextSpan(
                                            text: 'Pending',
                                            style: TextStyle(color: Colors.red))
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Raised By: ',
                                            style: TextStyle(
                                                color: AppColors.black)),
                                        TextSpan(
                                            text: 'Prerak Gada',
                                            style:
                                                TextStyle(color: Colors.green))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ]),
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
