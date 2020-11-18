import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class favorites extends StatefulWidget {
  @override
  _favoritesState createState() => _favoritesState();
}

class _favoritesState extends State<favorites> {

 List<Color>  colorslist=[
   Colors.red,
   Colors.teal,
   Colors.deepOrange,
   Colors.brown,
   Colors.blue,
   Colors.purple,
 ];
Random random = Random();

Color _getRandomcolor(){
  return colorslist[random.nextInt(colorslist.length)];
}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context,position){
          return Card(
            child: Container (
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  _autherrow(),
                  SizedBox(height: 16,),
                  _newsitemrows(),
                ],
              ),
            ),
          );
        },
        itemCount: 20,
    );

  }
  Widget _autherrow (){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 16),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/gmail.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Text('Micheal Adams',style: TextStyle(color: Colors.grey),),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text('15 MIN .',style: TextStyle(color: Colors.grey),),
                    Text('Life Style',style:TextStyle(color: _getRandomcolor())),
                  ],
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          onPressed: (){},
          color: Colors.red,
    ),
      ],
    );
  }
  Widget _newsitemrows(){
      return Container(
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/email.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text('Tech Tent: Old phones and safe social',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Text('We also talk about the future of Work as the robots advance , and we whether a retro phone',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      height: 1.25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}

