import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';
class RunApp extends StatefulWidget {
  @override
  _RunAppState createState() => _RunAppState();
}

class _RunAppState extends State<RunApp> {
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          body: Stack(
            children: [
              Container(
                color: Colors.black87,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.translate(
                      offset: Offset(0,-100),
                      child: Icon(
                        Icons.ac_unit,
                        size: 150,
                        color: Colors.white,
                      )
                  ),
                  Text('Welcome',
                    style: TextStyle(
                        color:  Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 48,right: 48,top: 9),
                    child: Text( 'Making friends is easy as waving your hand back and forth in easy step',
                      style: TextStyle(color:  Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),

                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24,left: 20,right: 20),
                  child: SizedBox(
                    width: double.infinity ,
                    height: 60,
                    child: RaisedButton(
                      color: Colors.red.shade900,
                      child: Text(
                        'GET STARTED',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context){
                                  return HomeScreen();
                                },
                            ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        );


  }
}
