

import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();

  bool isLoading= false;

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
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(

              decoration: InputDecoration(labelText: "Username",),
              validator: (value){
                if(value.isEmpty){
                  return "Please enter your username";
                }else return null ;
              },
            ),
            SizedBox(height: 48,),
            TextFormField(
              decoration: InputDecoration(labelText : "password",),
              validator: (value){
                if(value.isEmpty){
                  return "Please enter your password";
                }else{
                return null;
                }
              },
            ),
            SizedBox(height: 48,),
            SizedBox(
              width: double.infinity,
              child:RaisedButton(
                onPressed: (){
                  /* if(_formKey.currentState.validate()){
                      setState(() {
                        isLoading=true;
                      });
                    }*/
                  _formKey.currentState.validate();
                },
                color: Colors.red.shade900,
                child: Text("LOGIN",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
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
