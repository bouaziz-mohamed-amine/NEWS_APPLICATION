

import 'package:flutter/material.dart';
import 'package:news_app/api/auth_api.dart';
import 'package:news_app/api/authors_api.dart';
import 'package:news_app/screens/home_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
   AuthenticationAPI auth= AuthenticationAPI();

  bool isLoading;
  bool loginError ;

  TextEditingController _useremail;
  TextEditingController _userpassword;

  String email;
  String password;
  @override
  void initState() {
    // TODO: implement initState
     isLoading= false;
     loginError = false;
     _useremail=TextEditingController();
     _userpassword=TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
        child: (isLoading)? _drawLoading() : _drawLoginForm(),
      ),
    );
  }

 Widget _drawLoginForm() {
   if (loginError) {
     return Container(
       child: Center(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text('Login Error'),
             RaisedButton(onPressed: () {
               setState(() {
                 loginError = false;
               });
             }, child: Text('try Again', style: TextStyle(
                 color: Colors.white
             ),),)
           ],
         ),
       ),
     );
   } else {
     return Form(
       key: _formKey,
       child: SingleChildScrollView(
         child: Column(
           children: [
             TextFormField(
               controller: _useremail,
               decoration: InputDecoration(labelText: "Username",),
               validator: (value) {
                 if (value.isEmpty) {
                   return "Please enter your email";
                 } else
                   return null;
               },
             ),
             SizedBox(height: 48,),
             TextFormField(
                controller: _userpassword,
               decoration: InputDecoration(labelText: "password",),
               validator: (value) {
                 if (value.isEmpty) {
                   return "Please enter your password";
                 } else {
                   return null;
                 }
               },
             ),
             SizedBox(height: 48,),
             SizedBox(
               width: double.infinity,
               child: RaisedButton(
                 onPressed: () async {
                   //_formKey.currentState.validate();     //return true if  text != null     return false if text = nul
                   //print(_formKey.currentState.validate());
                   if (_formKey.currentState.validate()) {
                     setState(() {
                       isLoading = true;
                     });
                          email= _useremail.text;
                          password=_userpassword.text;

                     var response = await auth.login(email,password);
                     print(response);
                     if (response == true) {
                       Navigator.push(context, MaterialPageRoute(
                           builder: (context) {
                             return HomeScreen();
                           }));
                     } else {

                       setState(() {
                         isLoading = false;
                         loginError = true;
                       });
                     }
                   }
                   else {
                     setState(() {
                       isLoading = false;
                     });
                   }
                 },
                 color: Colors.red.shade900,
                 child: Text("LOGIN", style: TextStyle(color: Colors.white),),
               ),
             ),
           ],
         ),
       ),
     );
   }
 }
  Widget _drawLoading(){
    return Container(
      padding:  EdgeInsets.only(top: 16,bottom: 16),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
