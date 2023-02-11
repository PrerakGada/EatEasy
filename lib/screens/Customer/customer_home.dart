import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eat_easy/screens/Customer/SideBar.dart';
import 'package:eat_easy/screens/Provider/InfoPage.dart';
import 'package:flutter/material.dart';

import '../../Theme/app_colors.dart';

import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class CustomerHome extends StatelessWidget {
  static const String id = '/customerhome';

  CustomerHome({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: const SideBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              elevation: 10,
                              child: const CircleAvatar(
                                radius: 22,
                                backgroundImage: NetworkImage(
                                  'https://source.unsplash.com/50x50/?portrait',
                                ),
                              ),
                            ),
                            onTap: () {
                              _scaffoldState.currentState?.openDrawer();
                            },
                          ),
                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    offset: const Offset(5.0, 5.0),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0), //BoxShadow
                              ],
                            ),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search',
                                  hintStyle: TextStyle(color: Colors.black),
                                  contentPadding: EdgeInsets.only(left: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),
                  const Spacer(flex: 5),
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 15.0,
                            spreadRadius: 7.0), //BoxShadow
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          const Spacer(),
                          const Text(
                            "Suggested Restraunts",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    fixedSize: const Size(80, 40),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25))),
                                child: const Text('Veg'),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    fixedSize: const Size(90, 40),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25))),
                                child: const Text('Non Veg'),
                              ),
                            ],
                          ),
                          const Spacer(),
                          ExpandableCarousel(
                            options: CarouselOptions(
                              viewportFraction: 0.8,
                              enlargeCenterPage: true,
                              showIndicator: false,
                              floatingIndicator: true,
                            ),
                            items: [1, 2, 3, 4, 5].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => InfoPage()));
                                      },
                                    child: Container(
                                      height: 200,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color(0xffaaaaaa),
                                        image: const DecorationImage(
                                            image: NetworkImage(
                                                "https://content.jdmagicbox.com/comp/mumbai/46/022p5463446/catalogue/new-shahi-family-restaurant-mira-road-thane-tandoori-restaurants-c7lj66kagt.jpg?clr="),
                                            fit: BoxFit.fill),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 100,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(15),
                                              color: const Color(0xFFFFFF)
                                                  .withOpacity(0.7),
                                            ),
                                            child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    "New Shahi Restaurant",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: AppColors.black,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                  Text(
                                                    "Opp old petrol pump Thane-401107",
                                                    style: TextStyle(
                                                        color: AppColors.black
                                                            .withOpacity(0.5),
                                                        fontSize: 11,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                  const Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "4.5/5",
                                                        style: TextStyle(
                                                            color:
                                                            AppColors.black,
                                                            fontSize: 11,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                      ),
                                                    ],
                                                  )
                                                ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                          //Spacer(),

                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                  //Spacer(flex: 1,),
                ],
              )),
        ),
      ),
    );
  }
}
