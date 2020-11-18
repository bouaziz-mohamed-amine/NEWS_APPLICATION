import 'package:flutter/material.dart';
import 'package:news_app/drawer_ui/navigation_drawer.dart';
 
class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Twitter Feed'),
        centerTitle: false,
        backgroundColor:Colors.red ,
        actions: [
          IconButton(
            icon: Icon(Icons.search), onPressed: () {  },),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
          itemBuilder: (context,index){
            return Card(
              child: Column(
                children: [
                  _cardHeader(),
                  _cardBody(),
                  _cardFooter(),
                ],
              ),
            );
          },
          itemCount: 20,
      ),
    );
  }

 Widget _cardHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 24,

          ),
        ),
        Column(
          children: [
           Row(
             children: [
               Text("Christina meyers"),
               Text("@ch_meyers"),
             ],
           ),
            SizedBox(height: 8,),
            Text("Fri, 12 May 2017 . 14.30")
          ],
        ),
      ],
    ) ;
 }
 Widget _cardBody(){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16,bottom: 8),
      child: Text("We also talk about the future of work as the robots advance, and we ask whether a retro phone"),
    );
 }
 Widget _cardFooter(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Row(
             children: [
               IconButton( icon:Icon(Icons.repeat),color: Colors.orange ,onPressed: (){},),
               Text('25'),
             ],
           ),
           Row(
             children: [
               FlatButton(onPressed: (){},child: Text("SHARE",style: TextStyle(color: Colors.orange),),),
               FlatButton(onPressed: (){},child: Text("OPEN",style: TextStyle(color: Colors.orange),),),
             ],
           ),
         ],
      ),

    );
 }
}


