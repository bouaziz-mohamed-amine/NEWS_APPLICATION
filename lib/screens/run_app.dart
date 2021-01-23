import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';
class RunApp extends StatefulWidget {
  @override
  _RunAppState createState() => _RunAppState();
}

class _RunAppState extends State<RunApp> {

    List<String>images=["assets/images/image1.jpg","assets/images/image2.jpg","assets/images/image3.jpg"];
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                  itemCount: 3,
                  itemBuilder: (context,index){
                    return _fondecran(images[index],index) ;
                  }
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24,left: 20,right: 20),
                  child: SizedBox(
                    width: double.infinity ,
                    height: 50,
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

  Widget _fondecran(String image, int num ) {
    return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage(image),
                fit: BoxFit.cover
            ),
          ),
          child: Column(
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
              Transform.translate(
                offset: Offset(0,-50),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color:  (num==0)? Colors.white : Colors.grey,
                      ),
                      Icon(Icons.check_circle,color: (num==1)? Colors.white : Colors.grey,),
                      Icon(Icons.check_circle,color:  (num==2)? Colors.white : Colors.grey,),
                    ],
                  ),
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
        );
  }
}
