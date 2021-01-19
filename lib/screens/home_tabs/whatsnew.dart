
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/api/posts_api.dart';
import 'dart:async';
import 'package:news_app/models/post.dart';
import 'package:news_app/screens/home_tabs/popular.dart';
import 'package:news_app/screens/single_post.dart';
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
    TextStyle _headerDescription = TextStyle(fontSize: 18,fontWeight: FontWeight.w400);

    String _textContent(String content){
      String new_content= content.substring(0 , 50)+ " ...";
      return new_content;
    }
    return FutureBuilder(
      future: postsApi.fetChPostsByCategoryId("1"),
      // ignore: missing_return
      builder: ( BuildContext context , AsyncSnapshot snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
            return _connectionError();
            break;
          case ConnectionState.waiting:
            return _loading();
            break;
          case ConnectionState.active:
            return _loading();
            break;
          case ConnectionState.done:
            if(snapshot.hasError){
                  return _error(snapshot.error);
            }else{
              if(snapshot.hasData){
                List<Post>posts=snapshot.data;

                Random random =Random();
                int random_number= random.nextInt(posts.length);
                Post post =posts[random_number];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return SinglePost(post);
                        }
                        )
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(post.featuredImage),
                          fit: BoxFit.cover,
                        )
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 55,left:40 ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(post.title,style:_headerTitle,textAlign: TextAlign.center,),
                            SizedBox(height: 8,),
                            Text(
                              _textContent(post.content),
                              textAlign: TextAlign.center,style: _headerDescription,),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }else{
                  return _noData();
              }
            }
            break;
        }
      },
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
            child: _drawSectionTitle("Top Stories"),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child:Container(
               color: Colors.white,
              child: FutureBuilder(
                future: postsApi.fetchAllPosts(),
                // ignore: missing_return
                builder: (BuildContext context,  AsyncSnapshot snapshot){
                  switch(snapshot.connectionState){

                    case ConnectionState.none:
                      return _connectionError();
                      break;
                    case ConnectionState.waiting:
                      return _loading();
                      break;
                    case ConnectionState.active:
                      return _loading();
                      break;
                    case ConnectionState.done:
                      if (snapshot.error != null) {
                        return  _error(snapshot.error) ;
                      } else{
                        if(snapshot.hasData){
                          List<Post>posts=snapshot.data;
                          if(posts.length>=3){
                            Post post1 = snapshot.data[0];
                            Post post2 = snapshot.data[1];
                            Post post3 = snapshot.data[2];
                            return Column(
                              children: [
                                _drawerTop(post1),
                                _drawDivider(),
                                _drawerTop(post2),
                                _drawDivider(),
                                _drawerTop(post3),
                              ],
                            );
                          }else{return _noData();}
                        }else{return _noData();}
                      }
                      break;
                  }
                },
              ),
                          ),
                          ),
        ],
      ),
    );
  }
       Widget _drawerTop(Post post){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return SinglePost(post) ;
        }));
      },
      child: Padding(
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
      child: FutureBuilder(
        future: postsApi.fetChPostsByCategoryId("6"),
        // ignore: missing_return
        builder: (context,snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return _connectionError() ;
              break;
            case ConnectionState.waiting:
              return _loading();
              break;
            case ConnectionState.active:
              return _loading();
              break;
            case ConnectionState.done:
               if(snapshot.error != null){
                 return _error( snapshot.error);
               }else{
                 if(snapshot.hasData){
                         List<Post>posts = snapshot.data ;
                         if(posts.length >=2){
                               Post post1= snapshot.data[0];
                               Post post2= snapshot.data[1];
                               return Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left: 10,bottom: 8, ),
                                     child: _drawSectionTitle("Recent Updates" ),
                                   ),
                                   _drawRecentCard(Colors.deepOrange,post1),
                                   _drawRecentCard(Colors.teal,post2),
                                   SizedBox(height: 48,)

                                 ],
                               );
                         }else{return _noData();}
                 }else{
                   return _noData();
                 }
               }
              break;
          }
        },
      ),
    );
  }
  Widget _drawRecentCard( Color color1, Post post) {
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context){
            return SinglePost(post);
          }
        )
        );
      },
      child: Card(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:  NetworkImage(post.featuredImage) ,
                  fit: BoxFit.cover,
                ),
              ) ,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16,  left: 5 ),
              child: Container(
                padding: EdgeInsets.only(left: 16,right: 16,top: 4,bottom: 4),
                decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text("SPORT",style: TextStyle(color: Colors.white),),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  post.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.timer,color: Colors.grey,size: 18,),
                    SizedBox(width: 4,),
                    Text(_parseHumanDateTime(post.dateWritten),style: TextStyle(color:Colors.grey,fontSize: 15 ),),
                  ],
                ),
              ),
            ],),
          ],
        ) ,
      ),
    );
  }
  
  Widget _drawSectionTitle(String title){
 return Text(
   title,
   style: TextStyle(
       color: Colors.grey.shade900,
       fontWeight: FontWeight.w500,
       fontSize: 16,
   ),);
}
  
String _parseHumanDateTime(String dateTime){
        Duration timeAgo =  DateTime.now().difference(DateTime.parse(dateTime));
        DateTime theDifference= DateTime.now().subtract(timeAgo);
    return timeago.format(theDifference);
  }

  Widget _loading() {
    return Container(
      padding: EdgeInsets.only(top: 16,bottom: 16),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
  Widget _connectionError() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text('Connection Error!!!!'),
    );
  }
  Widget _noData() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text('No Data Available!'),
    );
  }
  Widget _error(var error) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(error.toString()),
    );
  }
}
