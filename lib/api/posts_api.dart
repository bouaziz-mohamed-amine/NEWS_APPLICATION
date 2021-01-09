import 'dart:convert';
import 'package:news_app/utilities/api_utilities.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/utilities/api_utilities.dart';
import 'package:http/http.dart' as http;

class PostApi{

  Future<List<Post>>fetchAllPosts() async {
      List<Post>posts=[];
     String allpostsipi=base_api+all_posts_api;
     //String allpostsipi="https://jsonplaceholder.typicode.com/posts";
      var response = await http.get(allpostsipi);

      if(response.statusCode==200){
        //print(response.body);
        var jsonData=jsonDecode(response.body);
        var data=jsonData["data"];
       // print(jsonData);
        /*for( var item in jsonData){
            Post post=Post(item["userId"].toString(),item["id"].toString(),item["title"].toString(),item["body"].toString());
            posts.add(post);
          }*/
        for(var item in data){
          //print(item);
            Post post=Post(
              id:item["id"].toString() ,
              title: item["title"].toString(),
              content: item["content"].toString(),
              dateWritten: item["date_written"],
              featuredImage: item["featured_image"].toString(),
              votesUp: item["votes_up"],
              votesDown: item["votes_down"],
              votersUp: (item["voters_up"]==null) ? List<int>() : jsonDecode(item["voters_up"]),
              votersDown: ( item["voters_down"]==null) ? List<int>() : jsonDecode(item["voters_down"]),
              userId: item["user_id"],
              categoryId: item["category_id"],
            );
            posts.add(post);

        }
      }
      //print(posts[0].title);
     // print(posts);
      return posts;
  }
}

