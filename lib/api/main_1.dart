import 'package:news_app/api/auth_api.dart';
import 'package:news_app/api/authors_api.dart';
import 'package:news_app/api/categories_api.dart';
import 'package:news_app/api/posts_api.dart';

main(){

  CategoriesApi category=CategoriesApi();
  AuthorsAPI author =AuthorsAPI();
  PostApi post=PostApi();
  print("amine");
 // author.fetchAllAuthors();
//post.fetchAllPosts();
//AuthenticationAPI auth=AuthenticationAPI();
//auth.login();
}
