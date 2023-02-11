import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String id = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchtextcontroller = TextEditingController();
  var _searchKey = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(color: Colors.green),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://instagram.fbom16-1.fna.fbcdn.net/v/t51.2885-19/297723103_131991389535733_3394524039300739566_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fbom16-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=J-GGDJKn0G8AX8UcjQq&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfCX_lR8Le54wErL8jKKwuqcVm-TpusQRZpxAlNHdYx1kg&oe=63ED9B39&_nc_sid=8fd12b'),
                        radius: 25,
                      ),
                      Spacer(),
                      Icon(
                        Icons.chat_bubble,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.notifications,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "Find The\nPerfect Food",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "There are people in the world so hungry, that God\n cannot appear to them except in the form of bread.",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 10, right: 10),
                //   child: SearchBar(
                //       height: 40,
                //       width: double.infinity,
                //       controller: _searchtextcontroller,
                //       title: "Search for a location",
                //       onChanged: () {
                //         if (_searchKey != _searchtextcontroller.text) {
                //           setState(() {
                //             _searchKey = _searchtextcontroller.text;
                //           });

                //           // WidgetsBinding.instance.addPostFrameCallback((_) {});
                //         }
                //       },
                //       onTap: () {
                //         print("Hello");
                //         print(_searchtextcontroller.text);
                //         Navigator.push(
                //           context,
                //           PageTransition(
                //             child: FromAddressScreen(),
                //             type: PageTransitionType.fade,
                //           ),
                //         );
                //       }),
                // ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            "Expiring Soon",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 180,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Container(
                                  width: 130,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://someindiangirl.com/wp-content/uploads/2022/06/Instant-Pot-Paneer-2-of-4-scaled.jpg"),
                                          fit: BoxFit.fill)),
                                ),
                              );
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            "Nearest Food Banks",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 180,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Container(
                                  width: 130,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJrCbpnfVfKl9o43TwqQmxrGm4-r2IPGdEQQ&usqp=CAU"),
                                          fit: BoxFit.fill)),
                                ),
                              );
                            },
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       left: 15, right: 15, top: 10),
                        //   child: Container(
                        //     width: double.infinity,
                        //     height: 55,
                        //     decoration: BoxDecoration(
                        //         color: Colors.green.withOpacity(0.3),
                        //         borderRadius: BorderRadius.circular(15)),
                        //     child: Padding(
                        //       padding: const EdgeInsets.only(
                        //           left: 10, right: 10),
                        //       child: Row(
                        //         children: [
                        //           Text("Get our premier services",
                        //               style:
                        //                   TextStyle(color: Colors.black)),
                        //           Spacer(),
                        //           Icon(Icons.arrow_right_alt)
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
