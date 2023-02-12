import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eat_easy/screens/Admin/admin_screen.dart';
import 'package:eat_easy/screens/Customer/explore_map.dart';
import 'package:eat_easy/screens/Customer/user_home_screen.dart';
import 'package:eat_easy/screens/Customer/user_profile_screen.dart';
import 'package:eat_easy/screens/Provider/provider_screen.dart';
import 'package:eat_easy/screens/Customer/side_bar.dart';
import 'package:eat_easy/screens/Provider/info_page.dart';
import 'package:eat_easy/screens/Provider/provider_verification.dart';
import 'package:eat_easy/stores/user_store.dart';
import 'package:eat_easy/screens/Customer/side_bar.dart';
import 'package:eat_easy/screens/Provider/info_page.dart';
import 'package:eat_easy/screens/Provider/order.dart';
import 'package:flutter/material.dart';
import 'package:eat_easy/repositories/query_repo.dart';
import 'package:flutter/scheduler.dart';

import '../../Theme/app_colors.dart';

import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:popup_card/popup_card.dart';

import '../Provider/provider_home_page.dart';

import '../../widgets/search_bar.dart';

class CustomerHome extends StatefulWidget {
  static const String id = '/customerhome';

  CustomerHome({Key? key}) : super(key: key);

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();
  var _searchtextcontroller = TextEditingController();
  String _searchKey = "";

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      print(UserStore().currUser['role']);
      if (UserStore().currUser['role'] == 'provider')
        Navigator.of(context).popAndPushNamed(ProviderHomeScreen.id);
      if (UserStore().currUser['role'] == 'admin')
        Navigator.of(context).popAndPushNamed(AdminDashBoard.id);
    });
    return Scaffold(
      key: _scaffoldState,
      drawer: SideBar(),
      // appBar: AppBar(
      //   leading: GestureDetector(
      //     onTap: () {
      //       Navigator.of(context).pop();
      //     },
      //     child: const Icon(
      //       Icons.arrow_back,
      //       size: 30,
      //     ),
      //   ),
      //   title: SearchBar(
      //     title: "Search for addresss",
      //     height: 40,
      //     width: MediaQuery.of(context).size.width * .9,
      //     controller: _searchtextcontroller,
      //     onChanged: () {
      //       if (_searchKey != _searchtextcontroller.text) {
      //         _searchKey = _searchtextcontroller.text;
      //         WidgetsBinding.instance.addPostFrameCallback((_) {});
      //       }
      //     },
      //   ),
      // ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          HomeScreen(),
          ExploreMap(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        color: AppColors.primaryAccent,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 100),
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
        items: [
          Icon(Icons.home_filled, color: AppColors.black),
          Icon(Icons.explore, color: AppColors.black),
          Icon(Icons.account_circle, color: AppColors.black),
        ],
      ),
    );
  }
}

class PFP extends StatelessWidget {
  const PFP({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldState,
  }) : _scaffoldState = scaffoldState;

  final GlobalKey<ScaffoldState> _scaffoldState;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  ],
                ),
              ),
              const Spacer(flex: 5),
              //Spacer(flex: 1,),
            ],
          )),
    );
  }
}

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableCarousel(
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
                    borderRadius: BorderRadius.circular(32)),
                elevation: 2,
                tag: 'Hotel',
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'New Shahi Restraunt',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: const [
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
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Food Available',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
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
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Must visit',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        const Text(
                          'User #1',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.star, color: Colors.yellow, size: 14.0),
                            Icon(Icons.star, color: Colors.yellow, size: 14.0),
                            Icon(Icons.star, color: Colors.yellow, size: 14.0),
                            Icon(Icons.star, color: Colors.yellow, size: 14.0),
                            Icon(Icons.star_border,
                                color: Colors.grey, size: 14.0),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Good quick service. Need to keep a check on the hygiene. Tables need to be cleaned a little faster considering the table turnovers. ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: MaterialButton(
                            color: AppColors.primaryAccent,
                            minWidth: 200,
                            padding: const EdgeInsets.all(16),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const OrderFood()));
                            },
                            child: const Text(
                              'Collect Food!',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xFFFFFF).withOpacity(0.7),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "New Shahi Restaurant",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Opp old petrol pump Thane-401107",
                              style: TextStyle(
                                  color: AppColors.black.withOpacity(0.5),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "3.1km away",
                              style: TextStyle(
                                  color: AppColors.black.withOpacity(0.5),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
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
    );
  }
}
