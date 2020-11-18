import 'package:flutter/material.dart';
import 'package:news_app/drawer_ui/navigation_drawer.dart';
import 'home_tabs/favorites.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/whatsnew.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
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
                IconButton(icon: Icon(Icons.more_vert),onPressed: (){},),
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
}
