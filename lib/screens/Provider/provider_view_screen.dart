import 'package:eat_easy/Theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_loading.dart';
import '../../widgets/image_placeHolder.dart';

class KitchenView extends StatefulWidget {
  const KitchenView({super.key, required this.kitchendetails});
  final Map kitchendetails;

  @override
  State<KitchenView> createState() => _KitchenViewState();
}

class _KitchenViewState extends State<KitchenView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List products = widget.kitchendetails["products"];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.kitchendetails["name"]),
          backgroundColor: AppColors.primaryAccent,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 20),
            child: Text(
              "Available Products:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),

              // style: theme.textTheme.bodyLarge!.copyWith(
              //     fontSize: 17,
              //     fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final imageWidget = FittedBox(
                  fit: BoxFit.cover,
                  // child: Image.network(
                  //     "https://someindiangirl.com/wp-content/uploads/2022/06/Instant-Pot-Paneer-2-of-4-scaled.jpg"),
                  child: FadeInImagePlaceholder(
                    image: NetworkImage(
                      products[index]["imageUrl"],
                    ),
                    placeholder: SizedBox(
                      width: 20,
                      height: 20,
                      child: customloading(),
                    ),
                    excludeFromSemantics: true,
                  ));
              return Container(
                width: width * 0.9,
                height: height * 0.20,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Semantics(
                  container: true,

                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 5, bottom: 5),
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: 150,
                                // padding: EdgeInsets.only(left: 10),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    child: imageWidget)),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(products[index]["name"],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      // style: theme.textTheme.bodyLarge!.copyWith(
                                      //     fontSize: 17,
                                      //     fontWeight: FontWeight.bold),
                                      softWrap: true,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                // if (product.subTitle != null)
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(products[index]["desc"],
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      // overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                // SizedBox(
                                //   width:
                                //       MediaQuery.of(context).size.width * 0.4,
                                //   child: Text(
                                //     products[index]["price"],
                                //     softWrap: true,
                                //     overflow: TextOverflow.ellipsis,
                                //     maxLines: 2,
                                //     // overflow: TextOverflow.ellipsis,
                                //     style: TextStyle(),
                                //   ),
                                // ),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      const TextSpan(
                                          text: 'Price: ',
                                          style: TextStyle(
                                              color: AppColors.black)),
                                      TextSpan(
                                          text: products[index]["price"],
                                          style: TextStyle())
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: height * 0.015,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Positioned(
                      //   bottom: 10,
                      //   left: 54,
                      //   child: Container(
                      //     height: 27,
                      //     width: 67,
                      //     alignment: Alignment.center,
                      //     decoration: const BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(7))),
                      //   ),
                      // ),
                    ],
                  ),

                  //   ],
                  // ),
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
