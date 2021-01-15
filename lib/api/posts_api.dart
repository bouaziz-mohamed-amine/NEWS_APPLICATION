import 'dart:convert';
import 'package:news_app/utilities/api_utilities.dart';
import 'package:news_app/models/post.dart';
import 'package:http/http.dart' as http;

class PostApi{

  Future<List<Post>>fetchAllPosts() async {
      List<Post>posts=[];
     String allPostsApi=base_api+whatsnew;
      var response = await http.get(allPostsApi);
      if(response.statusCode==200){
        var jsonData=jsonDecode(response.body);
        var data=jsonData["data"];
        for(var item in data){
            Post post=Post(
              id:item["id"].toString() ,
              title: item["title"].toString(),
              content: item["content"].toString(),
              dateWritten: item["date_written"],
              featuredImage: item["featured_image"].toString(),
              votesUp: item["votes_up"],
              votesDown: item["votes_down"],
              votersUp: (item["voters_up"]==null) ? List<int>() : jsonDecode(item["voters_up"]),
              votersDown: ( item["voters_down"]==null) ? List<int>()  : jsonDecode(item["voters_down"]),
              userId: item["user_id"],
              categoryId: item["category_id"],
            );
            posts.add(post);
        }
      }
      return posts;
  }

  Future<List<Post>> fetChPostsByCategoryId( String id ) async {
    String whatsNewApi = base_api + categories_api + id;
    var response = await http.get( whatsNewApi );
    List<Post> posts = List<Post>();
    if( response.statusCode == 200 ){
      var jsonData = jsonDecode(  response.body);
      var data = jsonData["data"];

      for( var item in data ){
        Post post = Post(
            id: item["id"].toString(),
            title: item["title"].toString(),
            content: item["content"].toString(),
            dateWritten: item["date_written"].toString(),
            featuredImage: item["featured_image"].toString(),
            votesUp: item["votes_up"],
            votesDown: item["votes_down"],
            votersUp: (item["voters_up"] == null) ? List<int>() : jsonDecode( item["voters_up"] ),
            votersDown: (item["voters_down"] == null) ? List<int>() : jsonDecode( item["voters_down"] ),
            userId: item["user_id"],
            categoryId: item["category_id"]
        );
        posts.add(post);
      }
    }

    return posts;

  }

}

