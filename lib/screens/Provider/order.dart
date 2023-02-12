import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import '../../Theme/app_colors.dart';

class OrderFood extends StatefulWidget {
  const OrderFood({Key? key}) : super(key: key);

  @override
  State<OrderFood> createState() => _OrderFoodState();
}

class _OrderFoodState extends State<OrderFood> {
  var rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryAccent,
        body: Column(
        children: [
          Expanded(child: GridView.count(
            //padding: EdgeInsets.only(),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Image.network('https://static.vecteezy.com/system/resources/previews/008/507/708/original/classic-cheeseburger-with-beef-patty-pickles-cheese-tomato-onion-lettuce-and-ketchup-mustard-free-png.png'),
                      Text("Burger" ,style: TextStyle(color: Colors.black, fontSize: 20,),),
                      Text("0/1" ,style: TextStyle(color: Colors.black, fontSize: 20,),),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Image.network('https://static.vecteezy.com/system/resources/previews/008/507/708/original/classic-cheeseburger-with-beef-patty-pickles-cheese-tomato-onion-lettuce-and-ketchup-mustard-free-png.png'),
                      Text("Burger" ,style: TextStyle(color: Colors.black, fontSize: 20,),),
                      Text("0/1" ,style: TextStyle(color: Colors.black, fontSize: 20,),),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Image.network('https://static.vecteezy.com/system/resources/previews/008/507/708/original/classic-cheeseburger-with-beef-patty-pickles-cheese-tomato-onion-lettuce-and-ketchup-mustard-free-png.png'),
                      Text("Burger" ,style: TextStyle(color: Colors.black, fontSize: 20,),),
                      Text("0/1" ,style: TextStyle(color: Colors.black, fontSize: 20,),),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Image.network('https://static.vecteezy.com/system/resources/previews/008/507/708/original/classic-cheeseburger-with-beef-patty-pickles-cheese-tomato-onion-lettuce-and-ketchup-mustard-free-png.png'),
                      Text("Burger" ,style: TextStyle(color: Colors.black, fontSize: 20,),),
                      Text("0/1" ,style: TextStyle(color: Colors.black, fontSize: 20,),),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ),
        SmoothStarRating(
          rating: rating,
          size: 40,
          filledIconData: Icons.star,
          halfFilledIconData: Icons.star_half,
          defaultIconData: Icons.star_border,
          starCount: 5,
          allowHalfRating: false,
          spacing: 1.0,
          onRatingChanged: (value) {
            setState(() {
              rating = value;
            });
          },
          ),
          SizedBox(height: 20,),
          TextFormField(
            maxLines: 10,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.black),
              hintText: "Enter your review",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20)
              ),
            ),
          ),
          SizedBox(height: 20,),
          MaterialButton(
            color: AppColors.primary,
            minWidth: 200,
            padding: const EdgeInsets.all(16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            onPressed: ()  {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderFood()));
            },
            child: const Text(
              'Confirm Go To Payment',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20,),
        ],
      )
    );
  }
}
