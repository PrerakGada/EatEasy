import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network('https://cdn.vox-cdn.com/thumbor/ovQdcnuMVAYVQ-gSfOHDzCCs-vU=/0x0:6192x4128/1200x800/filters:focal(2601x1569:3591x2559)/cdn.vox-cdn.com/uploads/chorus_image/image/70073834/GettyImages_1331161454.0.jpg'),
          SizedBox(height: 20,),
          Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text('McDonald\'s', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  "4.5/5",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      ),
                ),
                Icon(Icons.star, color: Colors.yellow,),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('McDonald\'s Corporation is an American multinational fast food chain, founded in 1940 as a restaurant operated by Richard and Maurice McDonald, in San Bernardino, California, United States', style: TextStyle(color: Colors.black, fontSize: 15),),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('Location', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          //TODO: Add Maps location here
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('Reviews', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('Must visit', style: TextStyle(color: Colors.black, fontSize: 18),),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('Good quick service. Need to keep a check on the hygiene. Tables need to be cleaned a little faster considering the table turnovers. The tray underlines need to be changed and not reused again. The food was alright. Fries a little under seasoned. The burger bun was crumbly. Coke was no ice but water was added a little extra to it.', style: TextStyle(color: Colors.black, fontSize: 15),),
          ),
        ],
      ),
    );
  }
}
