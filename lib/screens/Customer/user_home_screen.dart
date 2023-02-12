import 'package:eat_easy/Theme/typography.dart';
import 'package:eat_easy/screens/Provider/provider_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../Theme/app_colors.dart';
import '../../stores/user_store.dart';
import '../../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String id = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  var rating = 0.0;
  String status = "Approved";
  final TextEditingController _searchtextcontroller = TextEditingController();
  var _searchKey = '';
  String convertToAgo(DateTime input) {
    print(DateTime.now());
    print(input);
    Duration diff = DateTime.now().difference(input);

    if (diff.inDays >= 1) {
      return '${diff.inDays} day(s) ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour(s) ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute(s) ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} second(s) ago';
    } else {
      return 'just now';
    }
  }

  String checkExpiryDate(DateTime input) {
    print(DateTime.now());
    print(input);
    Duration diff = input.difference(DateTime.now());

    if (diff.inDays >= 1) {
      return '${diff.inDays} day(s)';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour(s)';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute(s)';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} second(s)';
    } else {
      return 'just now';
    }
  }

  void openModalSheet(var currorder) async {
    return showModalBottomSheet(
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
        isScrollControlled: true,
        context: context,
        builder: (context) => StatefulBuilder(builder: (BuildContext context,
                StateSetter setModalState /*You can rename this!*/) {
              return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: NetworkImage(currorder["imageUrl"]),
                                fit: BoxFit.fill)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            currorder["name"],
                            style: const TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            currorder["description"],
                            style: TextStyle(
                                color: AppColors.black.withOpacity(0.4),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            // ignore: prefer_interpolation_to_compose_strings
                            "Expires In: " +
                                checkExpiryDate(
                                    DateTime.parse(currorder["date"])),
                            style: const TextStyle(
                                color: AppColors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          //  Text(
                          //   // ignore: prefer_interpolation_to_compose_strings
                          //   "Expires In: " +
                          //       checkExpiryDate(
                          //           DateTime.parse(currorder["date"])),
                          //   style: const TextStyle(
                          //       color: AppColors.black,
                          //       fontSize: 15,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                const TextSpan(
                                    text: 'Posted By: ',
                                    style: TextStyle(color: AppColors.black)),
                                TextSpan(
                                    text: currorder["postedBy"],
                                    style: TextStyle(
                                        color: status.trim() == "Approved"
                                            ? Colors.green
                                            : Colors.red))
                              ],
                            ),
                          ),
                          // const SizedBox(
                          //   height: 5,
                          // ),
                          // RichText(
                          //   text: const TextSpan(
                          //     style: TextStyle(
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.bold),
                          //     children: <TextSpan>[
                          //       TextSpan(
                          //           text: 'Raised By: ',
                          //           style: TextStyle(color: AppColors.black)),
                          //       TextSpan(
                          //           text: 'Prerak Gada',
                          //           style: TextStyle(color: Colors.green))
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // const Text(
                      //   "Supporting Documents",
                      //   style: TextStyle(
                      //       color: AppColors.black,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // InkWell(
                      //   onTap: () => showDialog(
                      //       context: context,
                      //       builder: (context) => aadharDialog(
                      //             setModalState,
                      //           )),
                      //   child: Container(
                      //     alignment: Alignment.center,
                      //     width: 90,
                      //     height: 35,
                      //     decoration: BoxDecoration(
                      //         color: Colors.grey,
                      //         borderRadius: BorderRadius.circular(15)),
                      //     child: const Padding(
                      //       padding: EdgeInsets.only(
                      //           top: 5, bottom: 5, left: 5, right: 5),
                      //       child: Text("Aadhar Card"),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      // InkWell(
                      //   onTap: () => showDialog(
                      //       context: context,
                      //       builder: (context) => pancardDialog(setModalState)),
                      //   child: Container(
                      //     alignment: Alignment.center,
                      //     width: 90,
                      //     height: 35,
                      //     decoration: BoxDecoration(
                      //         color: Colors.grey,
                      //         borderRadius: BorderRadius.circular(15)),
                      //     child: const Padding(
                      //       padding:
                      //           EdgeInsets.only(top: 5, bottom: 5, left: 5),
                      //       child: Text("Pancard"),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * .4,
                                      50),
                                  maximumSize: Size(
                                      MediaQuery.of(context).size.width * .5,
                                      50),
                                  backgroundColor: Colors.red),
                              child: const Text(
                                "Close",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () async {
                                // if (await QueryRepo().fetchPendingApprovals()) {
                                //   Navigator.of(context).pop();
                                // }
                              },
                            ),
                            const Spacer(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * .4,
                                      50),
                                  maximumSize: Size(
                                      MediaQuery.of(context).size.width * .5,
                                      50),
                                  backgroundColor: Colors.green),
                              child: const Text(
                                "Order",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () async {
                                // if (await QueryRepo().approveProvider(
                                //     '${currApplication['name']}:${currApplication['email']}')) {
                                //   UserStore().fetchPendingProviders();
                                //   Navigator.of(context).pop();
                                // }
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(padding: MediaQuery.of(context).viewInsets)
                    ],
                  ));
            }));
  }

  Widget aadharDialog(
    setmodalstate,
  ) {
    return AlertDialog(
        title: (const Center(child: Text("Documents"))),
        content: SizedBox(
            height: MediaQuery.of(context).size.height * .5,
            width: MediaQuery.of(context).size.width * .8,
            child: Container(
              width: 100,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(""))),
            )));
  }

  Widget pancardDialog(setmodalstate) {
    return AlertDialog(
        title: (const Center(child: Text("Documents"))),
        content: SizedBox(
            height: MediaQuery.of(context).size.height * .5,
            width: MediaQuery.of(context).size.width * .8,
            child: Container(
              width: 100,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(""))),
            )));
  }

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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SearchBar(
                    height: 40,
                    width: double.infinity,
                    controller: _searchtextcontroller,
                    title: "Search for a location",
                    onChanged: () {
                      if (_searchKey != _searchtextcontroller.text) {
                        _searchKey = _searchtextcontroller.text;
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          UserStore().fetchPendingOrders(_searchKey);
                          UserStore().fetchNearestRestros(_searchKey);
                          // UserStore().fetchCompletedProviders(_searchKey);
                        });
                      }
                    },
                    // onTap: () {
                    //   print("Hello");
                    //   print(_searchtextcontroller.text);
                    //   Navigator.push(
                    //     context,
                    //     PageTransition(
                    //       child: FromAddressScreen(),
                    //       type: PageTransitionType.fade,
                    //     ),
                    //   );
                    // }
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                            height: 190,
                            width: double.infinity,
                            child: Consumer<UserStore>(
                              builder: (_, userStore, __) {
                                return ListView.builder(
                                  itemCount: userStore.orders.length,
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final currorder = userStore.orders[index];
                                    // DateTime dt1 =
                                    //     DateTime.parse(currorder["timeStamp"]);
                                    // Duration diff =
                                    //     DateTime.now().difference(dt1);
                                    return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, bottom: 10, right: 5),
                                        child: Stack(
                                          children: [
                                            InkWell(
                                              onTap: () =>
                                                  openModalSheet(currorder),
                                              child: Container(
                                                width: 130,
                                                // height: 120,
                                                // child: Text(currorder["name"]),
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 243, 243, 243),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.4),
                                                        offset: const Offset(
                                                            5.0, 5.0),
                                                        blurRadius: 5,
                                                        spreadRadius: 2.0,
                                                      ), //BoxShadow
                                                    ],
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            currorder[
                                                                "imageUrl"]),
                                                        fit: BoxFit.cover)),
                                              ),
                                            ),
                                            Positioned(
                                                bottom: 0,
                                                child: Container(
                                                    width: 130,
                                                    height: 75,
                                                    decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        15))),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            currorder["name"],
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                "assets/placeholder.png",
                                                                width: 12,
                                                                height: 12,
                                                              ),
                                                              const SizedBox(
                                                                width: 2,
                                                              ),
                                                              Text(
                                                                currorder[
                                                                    "postedBy"],
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .green),
                                                              ),
                                                            ],
                                                          ),
                                                          // SizedBox(
                                                          //   height: 5,
                                                          // ),
                                                          Text(
                                                            "${convertToAgo(DateTime.parse(currorder["timeStamp"]))}",
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                      ),
                                                    )))
                                          ],
                                        ));
                                  },
                                );
                              },
                            )),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 15),
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
                            child: Consumer<UserStore>(
                              builder: (_, userStore, __) {
                                return ListView.builder(
                                  itemCount: userStore.restros.length,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final currrestro = userStore.restros[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, bottom: 10, right: 5),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              PageTransition(
                                                child: KitchenView(
                                                    kitchendetails: currrestro),
                                                type: PageTransitionType.fade,
                                              ),
                                            );
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 130,
                                                // height: 120,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            currrestro[
                                                                "imageUrl"]),
                                                        fit: BoxFit.fill)),
                                              ),
                                              Positioned(
                                                  bottom: 0,
                                                  child: Container(
                                                      width: 130,
                                                      height: 75,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.3),
                                                              offset:
                                                                  const Offset(
                                                                      5.0, 5.0),
                                                              blurRadius: 5,
                                                              spreadRadius: 2.0,
                                                            ), //BoxShadow
                                                          ],
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          15),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          15))),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // Text(
                                                            //   currrestro[
                                                            //       "name"],
                                                            //   style: const TextStyle(
                                                            //       fontWeight:
                                                            //           FontWeight
                                                            //               .bold,
                                                            //       fontSize: 16),
                                                            // ),
                                                            Row(
                                                              children: [
                                                                currrestro["status"] ==
                                                                        "veg"
                                                                    ? Image
                                                                        .network(
                                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM9yQPIlvAwNgYiGp4wMXXdKekDVDZklBd8ycURB2v&s",
                                                                        width:
                                                                            12,
                                                                        height:
                                                                            12,
                                                                      )
                                                                    : Image
                                                                        .network(
                                                                        "https://ih1.redbubble.net/image.756552536.4596/st,small,507x507-pad,600x600,f8f8f8.u2.jpg",
                                                                        width:
                                                                            12,
                                                                        height:
                                                                            12,
                                                                      ),
                                                                const SizedBox(
                                                                  width: 2,
                                                                ),
                                                                Text(
                                                                  currrestro[
                                                                      "name"],
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .green),
                                                                ),
                                                              ],
                                                            ),
                                                            // SizedBox(
                                                            //   height: 5,
                                                            // ),
                                                            Text(
                                                              "${currrestro["distance"].toString()} ${currrestro["unit"].toString()}",
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          12),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Image.asset(
                                                                  "assets/star.png",
                                                                  width: 12,
                                                                  height: 12,
                                                                ),
                                                                const SizedBox(
                                                                  width: 2,
                                                                ),
                                                                const Text(
                                                                  "4.5",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .green),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      )))
                                            ],
                                          )),
                                    );
                                  },
                                );
                              },
                            )),
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
