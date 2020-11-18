import 'package:flutter/material.dart';

class popular extends StatefulWidget {
  @override
  _popularState createState() => _popularState();
}

class _popularState extends State<popular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,position){
        return Card(
          child: _drawerTop(),
        );
      },
      itemCount: 20,

    );
  }

  Widget _drawerTop(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width:100,
            height:100,
            child: Image.asset(
              "assets/images/email.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              children: [
                Text('The world Global Waring Annual Summit ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Michael Adams '),
                    Row(
                      children: [
                        Icon(Icons.timer),
                        Text('15 min '),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
