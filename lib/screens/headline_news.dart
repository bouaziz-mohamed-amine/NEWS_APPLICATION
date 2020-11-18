import 'package:flutter/material.dart';
import 'package:news_app/drawer_ui/navigation_drawer.dart';

import 'home_tabs/favorites.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/whatsnew.dart';

class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}
class _HeadLineNewsState extends State<HeadLineNews>with TickerProviderStateMixin {

  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0,length: 3, vsync:this,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("HeadLine News"),
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
            favorites(),
            popular(),
            favorites(),
          ],
        ),
      ),

    );

  }
}
