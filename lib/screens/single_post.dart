import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:news_app/models/post.dart';

class SinglePost extends StatefulWidget {
   final Post post;
   SinglePost(this.post);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
                  SliverAppBar(
                    floating: true,
                    pinned: true,
                    expandedHeight: MediaQuery.of(context).size.height * 0.3,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.post.featuredImage),
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                    ),
      ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          // ignore: missing_return
                          (BuildContext context, int index){
                            if(index==0){
                              return _drowPostDetails();
                            }
                            else{
                              if(index >=0 && index< 9 ){
                                return _comments() ;
                              }else{
                                return  _commentText();
                              }
                            }
                      },
                      childCount: 10,

                    ),
                  ),
        ],
      ),
    );
  }

  Widget _drowPostDetails() {
    return Container(
      padding: EdgeInsets.all(10), 
      child: Text(widget.post.content,style: TextStyle(fontSize: 18, letterSpacing: 1.2, height: 1.25)),
    );
  }

  Widget _comments() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage:
                  ExactAssetImage("assets/images/card.jpg"),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Christina'),
                    Text('1 hour'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
                'Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable...'),
          ],
        ),
      ),
    );
  }

  Widget _commentText() {
    return Container(
      color: Color.fromRGBO(241, 245, 247, 1),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Write Comment here!',
                      contentPadding: EdgeInsets.only( left: 16 , top: 24 , bottom: 28 )
                  ),
                ),
              ),
              FlatButton(
                child: Text(
                  'SEND',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
