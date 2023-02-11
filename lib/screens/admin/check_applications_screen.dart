import 'dart:io';

import 'package:eat_easy/Theme/app_colors.dart';
import 'package:eat_easy/Theme/typography.dart';
import 'package:eat_easy/repositories/query_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../stores/user_store.dart';

class CheckApplications extends StatefulWidget {
  const CheckApplications({super.key});

  static const String id = 'retailer-screen';

  @override
  State<CheckApplications> createState() => _CheckApplicationsState();
}

class _CheckApplicationsState extends State<CheckApplications> {
  String status = 'Pending';

  Widget aadharDialog(setmodalstate) {
    return AlertDialog(
        title: (const Center(child: Text("Documents"))),
        content: SizedBox(
            height: MediaQuery.of(context).size.height * .5,
            width: MediaQuery.of(context).size.width * .8,
            child: Container(
              width: 100,
              height: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://adarshc.com/data/user/index/ent/document/aadhar/banner.jpg"))),
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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://adarshc.com/data/user/index/ent/document/pan/banner.jpg"))),
            )));
  }

  void openModalSheet() async {
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
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "https://content.jdmagicbox.com/comp/mumbai/46/022p5463446/catalogue/new-shahi-family-restaurant-mira-road-thane-tandoori-restaurants-c7lj66kagt.jpg?clr="),
                                fit: BoxFit.fill)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            text: TextSpan(
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                const TextSpan(
                                    text: 'Status: ',
                                    style: TextStyle(color: AppColors.black)),
                                TextSpan(
                                    text: '${status}',
                                    style: TextStyle(
                                        color: status.trim() == "Approved"
                                            ? Colors.green
                                            : Colors.red))
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
                                    style: TextStyle(color: AppColors.black)),
                                TextSpan(
                                    text: 'Prerak Gada',
                                    style: TextStyle(color: Colors.green))
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Supporting Documents",
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () => showDialog(
                            context: context,
                            builder: (context) => aadharDialog(setModalState)),
                        child: Container(
                          alignment: Alignment.center,
                          width: 90,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                top: 5, bottom: 5, left: 5, right: 5),
                            child: Text("Aadhar Card"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () => showDialog(
                            context: context,
                            builder: (context) => pancardDialog(setModalState)),
                        child: Container(
                          alignment: Alignment.center,
                          width: 90,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Padding(
                            padding:
                                EdgeInsets.only(top: 5, bottom: 5, left: 5),
                            child: Text("Pancard"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 50,
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
                                "Reject",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () async {
                                if (await QueryRepo().fetchPendingApprovals()) {
                                  Navigator.of(context).pop();
                                }
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
                                "Approve",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () async {
                                if (await QueryRepo().approveProvider()) {
                                  setState(() {
                                    status = "Approved";
                                  });
                                  Navigator.of(context).pop();
                                }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("Applications")),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
        child: Consumer<UserStore>(builder: (_, userStore, __) {
          return ListView.builder(
              itemCount: userStore.pendingProviders.length,
              itemBuilder: (context, index) {
                final currApplication = userStore.pendingProviders[index];
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: InkWell(
                    onTap: () => openModalSheet(),
                    child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 245, 245, 245),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            offset: const Offset(5.0, 5.0),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
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
                                      color:
                                          AppColors.black.withOpacity(0.4),
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      const TextSpan(
                                          text: 'Status: ',
                                          style: TextStyle(
                                              color: AppColors.black)),
                                      TextSpan(
                                          text: '${status}',
                                          style: TextStyle(
                                              color: status.trim() ==
                                                      "Approved"
                                                  ? Colors.green
                                                  : Colors.red))
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
                                          style: TextStyle(
                                              color: Colors.green))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}
