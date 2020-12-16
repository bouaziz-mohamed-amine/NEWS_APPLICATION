import 'package:flutter/material.dart';
import 'package:news_app/drawer_ui/navigation_drawer.dart';
class facebouk_feeds extends StatefulWidget {
  @override
  _facebouk_feedsState createState() => _facebouk_feedsState();
}

class _facebouk_feedsState extends State<facebouk_feeds> {
  TextStyle _hashTagStyle=TextStyle(color: Colors.orange);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Facebook Feeds"),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: ()=>null,
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context,index){
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _drawHeader(),
                  _drawTitle(),
                  _drawHashTags(),
                  _drawBody(),
                  _drawFooter(),
                ],
              ),
            );
          }
      ),
    );
  }
  Widget  _drawHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
      children: [
        Row (
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 24,

              ),
            ),
            Column(
              children: [
                Text("Christina meyers" ,
                  style: TextStyle(color: Colors.grey.shade900 , fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8,),
                Text("Fri, 12 May 2017 . 14.30",style: TextStyle(color: Colors.grey),)
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(icon: Icon(Icons.favorite),onPressed: (){},color: Colors.grey,),
            Transform.translate(
                offset: Offset(-10,0),
                child: Text('25',style: TextStyle(color: Colors.grey),)),
          ],
        ),
      ],
    );
  }
  Widget  _drawTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8,left: 5),
      child: Text(
        "We also talk about the future of work as the robots",
        style: TextStyle(
          color: Colors.grey.shade900,
        ),
      ),
    );
  }
  Widget  _drawFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(onPressed: (){},child: Text('10 OMMENTS',style: _hashTagStyle,),),
        Row(
          children: [
            FlatButton(onPressed: (){},child: Text('SHARE',style: _hashTagStyle,),),
            FlatButton(onPressed: (){},child: Text('OPEN',style: _hashTagStyle,),),
          ],
        ),

      ],
    );
  }
  Widget  _drawBody() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.3,
      child: Image(
        image: ExactAssetImage('assets/images/card.jpg'),
        fit: BoxFit.cover,

      ),
    );
  }
  Widget  _drawHashTags() {
    return Container(
      child: Wrap(
        children: [
          FlatButton(onPressed: (){},child: Text('#advance',style: _hashTagStyle,),),
          FlatButton(onPressed: (){},child: Text('#advance',style: _hashTagStyle,),),
          FlatButton(onPressed: (){},child: Text('#advance',style: _hashTagStyle,),),
        ],
      ),
    );
  }
}
