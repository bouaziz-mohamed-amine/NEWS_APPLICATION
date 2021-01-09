
import 'package:flutter/material.dart';
import 'package:news_app/api/posts_api.dart';
import 'dart:async';
import 'package:news_app/models/post.dart';
import 'dart:ui';
import 'package:timeago/timeago.dart' as timeago;
class Whats_New extends StatefulWidget {
  @override
  _Whats_NewState createState() => _Whats_NewState();
}

class _Whats_NewState extends State<Whats_New> {
  PostApi postsApi=PostApi();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _drawHeader(),
          _drawerTops(),
          _drawRecentUpdate(),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _headerTitle = TextStyle(fontSize: 25,fontWeight: FontWeight.w600);
    TextStyle _headerDescription = TextStyle(fontSize: 18);
    return Container(

      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/gmail.png'),
            fit: BoxFit.cover,
          )
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 55,left:40 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("How Terriers & Royals Gatecrashed Final",style:_headerTitle,textAlign: TextAlign.center,),
              SizedBox(height: 8,),
              Text(
                "Lorem ipsum dolor sit amet, consecteur adipiscing elit , sed do eiusmod .",
                textAlign: TextAlign.center,style: _headerDescription,),
            ],
          ),
        ),
      ),
    );
  }
  Widget _drawerTops(){
    return Container(
       color: Colors.grey.shade100,
      child: Column( 
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16,top: 16 ),
            child: _drawSectiontitle("Top Stories"),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child:Container(
               color: Colors.white,
              child: FutureBuilder(
                future: postsApi.fetchAllPosts(),
                builder: (BuildContext context,  AsyncSnapshot snapshot){
                    Post post1=snapshot.data[0];
                    Post post2=snapshot.data[1];
                    Post post3=snapshot.data[2];
                  return  Column(
                        children: [
                          _drawerTop(post1),
                          _drawDivider(),
                          _drawerTop(post2),
                          _drawDivider(),
                          _drawerTop(post3),
                          _drawDivider(),
                        ],
                      );
                },
              ),
                          ),
                          ),
        ],
      ),
    );
  }
 Widget _drawerTop(Post post){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width:100,
            height:100,
            child: Image.network(post.featuredImage,fit: BoxFit.cover,)
            /*Image.asset(
              "assets/images/email.png",
              fit: BoxFit.cover,
            ),*/
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Michael Adams '),
                    Row(
                      children: [
                        Icon(Icons.timer),
                        Text(_parseHumanDateTime(post.dateWritten)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
}
Widget _drawDivider(){
    return Container(
      color: Colors.grey.shade100,
      height: 1,
      width: double.infinity,
    );
}
Widget _drawRecentUpdate(){
    return Padding(
      padding: EdgeInsets.all( 8) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,bottom: 8, ),
            child: _drawSectiontitle("Recent Updates" ),
          ),
          _drawRecentCard(Colors.deepOrange),
          _drawRecentCard(Colors.teal),
          SizedBox(height: 48,)

        ],
      ),
    );
  }

  Widget _drawSectiontitle(String title){
 return Text(

   title,
   style: TextStyle(
       color: Colors.grey.shade900,
       fontWeight: FontWeight.w500,
       fontSize: 16,
   ),);
}

  Widget _drawRecentCard( Color color1) {
    return  Card(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/email.png'),
                fit: BoxFit.cover,
              ) ,
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16,  right: 16 ),
            child: Container(
              padding: EdgeInsets.only(left: 16,right: 16,top: 4,bottom: 4),
              decoration: BoxDecoration(
                color: color1,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text("SPORT",style: TextStyle(color: Colors.white),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
                'vettel is ferrari number one - hamilton',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              children: [
                Icon(Icons.timer,color: Colors.grey,size: 18,),
                SizedBox(width: 4,),
                Text('15 MiN',style: TextStyle(color:Colors.grey,fontSize: 12 ),),
              ],
            ),
          ),
        ],
      ) ,
    );
  }

  String _parseHumanDateTime(String dateTime){
        Duration timeAgo =  DateTime.now().difference(DateTime.parse(dateTime));
        DateTime theDifference= DateTime.now().subtract(timeAgo);
    return timeago.format(theDifference);
  }
}

