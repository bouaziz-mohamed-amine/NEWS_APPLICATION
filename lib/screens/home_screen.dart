import 'package:flutter/material.dart';
import 'package:news_app/drawer_ui/navigation_drawer.dart';
import 'home_tabs/favorites.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/whatsnew.dart';
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
    icon: ,
    onSelected: (PopOutMenu menu){},
    itemBuilder: (context){
      return[
         PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.ABOUT,
          child: Text('ABOUT'),
        ),
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.HELP,
          child: Text('HELP'),
        ),
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.CONTACT,
          child: Text('CONTACT'),
        ),
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.SETTINGS,
          child: Text('SETTINGS'),
        ),
      ];
    },
  );
  }
}
