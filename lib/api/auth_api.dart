import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/utilities/api_utilities.dart';


class AuthenticationAPI {

  Future<bool> login( ) async {
    String authApi = base_api + auth_api;
    /*Map<String,String> headers = {
      "Accept" : "application/json",
      "Content-Type" : "application/x-www-form-urlencoded"
    };
  */
    Map<String,String> body = {
      "email" :"amine.m.a1998@gmail.com" ,
      "password" :"bouaziz0000" ,
    };
    var response = await http.post( authApi  , body: body );

    if( response.statusCode == 200 ){

        var jsonData = jsonDecode( response.body);
        var data = jsonData['data'];
        var token = data['token'];

        print(token);
        return true;
      }else{
      print("amine");
      return false;
    }

  }

}