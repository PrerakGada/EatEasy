import 'package:flutter/material.dart';
import '../../Theme/app_colors.dart';

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
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //color: Theme.of(context).accentColor,
                  transform: Matrix4.translationValues(-7.5, 0.0, 0.0),
                  child: Image.network('https://cdn.vox-cdn.com/thumbor/ovQdcnuMVAYVQ-gSfOHDzCCs-vU=/0x0:6192x4128/1200x800/filters:focal(2601x1569:3591x2559)/cdn.vox-cdn.com/uploads/chorus_image/image/70073834/GettyImages_1331161454.0.jpg'),
                ),
                SizedBox(height: 20,),
                Text('McDonald\'s', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
                Row(
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
                SizedBox(height: 30,),
                Text('McDonald\'s Corporation is an American multinational fast food chain, founded in 1940 as a restaurant operated by Richard and Maurice McDonald, in San Bernardino, California, United States', style: TextStyle(color: Colors.black, fontSize: 15),),
                SizedBox(height: 20,),
                Text('Location', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                //TODO: Add Maps location here
                SizedBox(height: 20,),
                Text('Reviews', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text('Must visit', style: TextStyle(color: Colors.black, fontSize: 18),),
                Text('User #1', style: TextStyle(color: Colors.black, fontSize: 15),),
                Row(
                  children: <Widget>[
                    Icon(Icons.star, color: Colors.yellow, size: 14.0),
                    Icon(Icons.star, color: Colors.yellow, size: 14.0),
                    Icon(Icons.star, color: Colors.yellow, size: 14.0),
                    Icon(Icons.star, color: Colors.yellow, size: 14.0),
                    Icon(Icons.star_border, color: Colors.grey, size: 14.0),
                  ],
                ),
                SizedBox(height: 8,),
                Text('Good quick service. Need to keep a check on the hygiene. Tables need to be cleaned a little faster considering the table turnovers. ', style: TextStyle(color: Colors.black, fontSize: 15),),
                SizedBox(height: 8,),
                MaterialButton(
                  color: AppColors.primaryAccent,
                  minWidth: 200,
                  padding: const EdgeInsets.all(16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  onPressed: ()  {},
                  child: const Text(
                    'Collect Food!',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
