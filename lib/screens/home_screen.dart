import 'package:flutter/material.dart';
import 'package:news_app/drawer_ui/navigation_drawer.dart';
import 'package:news_app/main.dart';
import 'package:news_app/screens/pages/about.dart';
import 'package:news_app/screens/pages/contact.dart';
import 'package:news_app/screens/pages/help.dart';
import 'package:news_app/screens/pages/settings.dart';
import 'home_tabs/favorites.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/whatsnew.dart';
import 'package:news_app/api/authors_api.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
enum PopOutMenu {
  HELP,ABOUT,CONTACT,SETTINGS
}
class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

    // tabcontroller
  TabController _tabController;
@override
  void initState() {
    super.initState();
    _tabController= TabController(length: 3, vsync:this,);
  }
  // end tabcontroller


  @override
  Widget build(BuildContext context) {

    return
     Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Text("Explore"),
              centerTitle: false,
              actions: [
                IconButton(icon: Icon(Icons.search), onPressed: () {  },),
                _popmenu(context),
              ],
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Colors.white,
                tabs: [
                Tab(text: "WHAT'S NEW",),
                Tab(text: "POPULAR",),
                Tab(text: 'FAVOURITES',),
              ],
              ),
            ),
      drawer: NavigationDrawer(),
       body: Center(
         child: TabBarView(
           controller: _tabController,
           children: [
             Whats_New(),
             popular(),
             favorites(),
           ],
         ),
       ),

    );
  }

  _popmenu( BuildContext context) {
  return PopupMenuButton<PopOutMenu>(
      onSelected: (PopOutMenu menu) {
    switch( menu ){
      case PopOutMenu.ABOUT :
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ABOUTUS();
        }));
        break;
      case PopOutMenu.SETTINGS:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SETTING();
        }));
        break;
      case PopOutMenu.CONTACT :
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CONTACT();
        }));
        break;
      case PopOutMenu.HELP :
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HELP();
        }));
        break;
    }
  },
    icon: Icon(Icons.more_vert),
    itemBuilder: (context){
      return[
         PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.ABOUT,
          child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return ABOUTUS() ;
                    }));
              },
              child: Text('ABOUT')),
        ),
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.HELP,
          child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return HELP();
                    }));
              },
              child: Text('HELP')),
        ),
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.CONTACT,
          child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return CONTACT();
                    }));
              },
              child: Text('CONTACT')),
        ),
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.SETTINGS,
          child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return SETTING();
                    }));
              },
              child: Text('SETTINGS')),
        ),
      ];
    },
  );
  }
}

