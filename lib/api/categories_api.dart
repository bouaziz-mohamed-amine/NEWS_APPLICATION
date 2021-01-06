import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/category.dart';
import 'package:news_app/utilities/api_utilities.dart';
class CategoriesApi{



  Future<List<Category>>fetchAllCategories() async {

    List<Category>categories=List<Category>();
    String allCategories=base_api+all_categories_api;
    var response = await http.get(allCategories);
    if(response.statusCode==200){
                  var jsonData=jsonDecode(response.body);
                  var data=jsonData["data"];
                  for (var item in data){
                    Category category = Category(item["id"].toString(),item["title"].toString());
                    categories.add(category);
                  }
    }
     /*for(Category cat in categories){
       print(cat.title);
     }*/
     return categories;
  }
}