import 'package:eat_easy/Theme/app_colors.dart';
import 'package:eat_easy/screens/admin/check_applications_screen.dart';
import 'package:eat_easy/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:eat_easy/screens/onboarding/login_screen.dart';

import '../Customer/user_profile_screen.dart';

class ProviderDashBoard extends StatefulWidget {
  const ProviderDashBoard({super.key});

  static const String id = '/provider-screen';

  @override
  State<ProviderDashBoard> createState() => _ProviderDashBoardState();
}

class _ProviderDashBoardState extends State<ProviderDashBoard> {
  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: Container(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 30),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SATURDAY, 11 FEB',
                        style: TextStyle(fontSize: 11, color: AppColors.black),
                      ),
                      Text(
                        'Hello, Dominos Mumbai!',
                        style: TextStyle(fontSize: 22, color: AppColors.black),
                      )
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://www.nicepng.com/png/detail/841-8415635_851-x-706-4-free-shop-vector.png'),
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
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          )
                      );
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
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () async {
                        UserStore().fetchPendingProviders();
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
                            color: const Color.fromARGB(255, 235, 235, 235),
                            borderRadius: BorderRadius.circular(20)),
                        width: 150,
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                "https://as1.ftcdn.net/v2/jpg/03/93/16/02/1000_F_393160279_YiExhcGrtAeiFSBqacVuEDRVUT00wFmK.jpg",
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Food",
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: ProfileScreen(),
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
                                "assets/order.png",
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Orders",
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
    );
  }
}
