import 'package:flutter/material.dart';
import 'package:news_app/models/nav_manu.dart';
import 'package:news_app/screens/facebouk_feeds.dart';
import 'package:news_app/screens/headline_news.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/instagram_feed.dart';
import 'package:news_app/screens/pages/login.dart';
import 'package:news_app/screens/twitter_feed.dart';
import 'package:shared_preferences/shared_preferences.dart';
class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  static bool isLoggedIn=false;
  String token;
 List<NavMenuItem> navigationMenu=[
    NavMenuItem("Explore",() => HomeScreen()),
    NavMenuItem("HeadLineNews",() => HeadLineNews()),
    NavMenuItem("Twitter Feed", ()=>TwitterFeed()),
   NavMenuItem("Instagram Feed",()=>instagramfeed()),
   NavMenuItem("Facebook Feeds",()=>facebouk_feeds()),
   NavMenuItem("LOGIN", ()=>Login())
 ];
 /*
_checkToken() async{
  SharedPreferences sharedLogin = await SharedPreferences.getInstance();
  token = sharedLogin.get("token");
  setState(() {
    if(token == null){
      isLoggedIn=false;
    }else{
      isLoggedIn= true;
    }
  });
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(isLoggedIn){
      navigationMenu.add(NavMenuItem("LOGOUT", ()=>facebouk_feeds()));
      navigationMenu.remove(NavMenuItem("LOGIN", ()=>Login()));
    }
  }*/
  @override
  Widget build(BuildContext context) {
       // _checkToken();
  return Drawer(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,top: 50),

            child: ListView.builder(
              itemCount: navigationMenu.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      navigationMenu[index].title,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder:(context){
                      return navigationMenu[index].destination();
                    } ));},
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey.shade400,),
                  ),
                );
              },

            ),
          ),
    );
  }
}
