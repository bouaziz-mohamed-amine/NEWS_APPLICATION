import 'package:flutter/material.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/utilities/data_utilities.dart';
import 'package:timeago/timeago.dart' as timeago;

class popular extends StatefulWidget {
  @override
  _popularState createState() => _popularState();
}

class _popularState extends State<popular> {

  PostApi postApi=PostApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postApi.fetChPostsByCategoryId("1"),
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
            return connectionError();
            break;
          case ConnectionState.waiting:
            return loading();
            break;
          case ConnectionState.active:
            return loading();
            break;
          case ConnectionState.done:
            if(snapshot.hasError){
              return error(snapshot.error);
            }else{
              if(snapshot.hasData){
                List<Post>posts=snapshot.data;
                if(posts.length >=3){
                    return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context,position){
                        return Card(
                          child: _drawerTop( posts[position]),
                        );
                      },
                    );
                }else{
                  return noData();
                }
              }else{
                return noData();
              }
            }
            break;
        }
      },
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
            child: Image(
              image: NetworkImage(post.featuredImage),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              children: [
                Text( post.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(post.userId.toString()),
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

  String _parseHumanDateTime(String dateTime){
    Duration timeAgo =  DateTime.now().difference(DateTime.parse(dateTime));
    DateTime theDifference= DateTime.now().subtract(timeAgo);
    return timeago.format(theDifference);
  }
}
