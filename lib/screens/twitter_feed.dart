import 'package:flutter/cupertino.dart';
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
          padding: EdgeInsets.all(8),
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Card(
                child: Column(
                  children: [
                    _cardHeader(),
                    _cardBody(),
                    _drawLine(),
                    _cardFooter(),
                  ],
                ),
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
               Text("Christina meyers",
                 style: TextStyle(color: Colors.grey.shade900 ,
                     fontSize: 16,
                     fontWeight: FontWeight.w600),),
               SizedBox(width: 8,),
               Text("@ch_meyers",style: TextStyle(color: Colors.grey),),
             ],
           ),
            SizedBox(height: 8,),
            Text("Fri, 12 May 2017 . 14.30",style: TextStyle(color: Colors.grey),)
          ],
        ),
      ],
    ) ;
 }
 Widget _cardBody(){
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16,bottom: 8),
      child: Text("We also talk about the future of work as the robots advance, and we ask whether a retro phone",
              style:TextStyle(fontSize: 14,height: 1.2,color: Colors.grey.shade900),),
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
               IconButton( icon:Icon(Icons.repeat , size: 28,),color: Colors.orange ,onPressed: (){},),
               Text('25',style: TextStyle(color: Colors.grey,fontSize: 16),),
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

 Widget _drawLine() {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
      margin: EdgeInsets.only(top: 16),
    );
  }
}


