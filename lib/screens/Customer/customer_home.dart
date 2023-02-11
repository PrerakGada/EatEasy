import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eat_easy/screens/Admin/admin_screen.dart';
import 'package:eat_easy/screens/Provider/provider_verification.dart';
import 'package:eat_easy/stores/user_store.dart';
import 'package:eat_easy/screens/Customer/side_bar.dart';
import 'package:eat_easy/screens/Provider/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../Theme/app_colors.dart';

import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:popup_card/popup_card.dart';

class CustomerHome extends StatelessWidget {
  static const String id = '/customerhome';

  CustomerHome({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print(UserStore().currUser);
    // if (UserStore().currUser == 'provider') {
    //   SchedulerBinding.instance.addPostFrameCallback((_) {
    //     Navigator.of(context).popAndPushNamed(ProviderVerification.id);
    //   });
    //
    // }
    // if (UserStore().currUser == 'admin') {
    //   SchedulerBinding.instance.addPostFrameCallback((_) {
    //     Navigator.of(context).popAndPushNamed(AdminDashBoard.id);
    //   });
    // }
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
                    padding: const EdgeInsets.only(top: 20),
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
                              viewportFraction: 0.9,
                              enlargeCenterPage: true,
                              showIndicator: false,
                              floatingIndicator: true,
                            ),
                            items: [1, 2, 3, 4, 5].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return PopupItemLauncher(
                                    tag: 'Hotels',
                                    popUp: PopUpItem(
                                      padding: const EdgeInsets.all(8),
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32)),
                                      elevation: 2,
                                      tag: 'Hotel',
                                      child: Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'New Shahi Restraunt',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "4.5/5",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                'It is fast food chain, founded in 1940 as a restaurant operated by Richard and Maurice McDonald, in San Bernardino, California, United States',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Text(
                                                'Food Available',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              /*Text('1x Salad                      Expires on: 12/02/23', style: TextStyle(color: Colors.black, fontSize: 15,),),
                                                Text('3x Burgers                  Expires on: 22/02/23', style: TextStyle(color: Colors.black, fontSize: 15,),),*/
                                              SizedBox(
                                                height: 70,
                                                child: GridView.count(
                                                  crossAxisCount: 2,
                                                  childAspectRatio: 6,
                                                  crossAxisSpacing: 1,
                                                  mainAxisSpacing: 1,
                                                  children: const [
                                                    Text(
                                                      '1x Salad',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Expires on: 12/02/23',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    Text(
                                                      '2x Salad',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Expires on: 13/02/23',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Text(
                                                'Reviews',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Text(
                                                'Must visit',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                              const Text(
                                                'User #1',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Icon(Icons.star,
                                                      color: Colors.yellow,
                                                      size: 14.0),
                                                  Icon(Icons.star,
                                                      color: Colors.yellow,
                                                      size: 14.0),
                                                  Icon(Icons.star,
                                                      color: Colors.yellow,
                                                      size: 14.0),
                                                  Icon(Icons.star,
                                                      color: Colors.yellow,
                                                      size: 14.0),
                                                  Icon(Icons.star_border,
                                                      color: Colors.grey,
                                                      size: 14.0),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              const Text(
                                                'Good quick service. Need to keep a check on the hygiene. Tables need to be cleaned a little faster considering the table turnovers. ',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Center(
                                                child: MaterialButton(
                                                  color:
                                                      AppColors.primaryAccent,
                                                  minWidth: 200,
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(16),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const OrderFood()));
                                                  },
                                                  child: const Text(
                                                    'Collect Food!',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color(0xffaaaaaa),
                                        image: const DecorationImage(
                                            image: NetworkImage(
                                                "https://content.jdmagicbox.com/comp/mumbai/46/022p5463446/catalogue/new-shahi-family-restaurant-mira-road-thane-tandoori-restaurants-c7lj66kagt.jpg?clr="),
                                            fit: BoxFit.fill),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
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
                                                  Text(
                                                    "3.1km away",
                                                    style: TextStyle(
                                                        color: AppColors.black
                                                            .withOpacity(0.5),
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
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
