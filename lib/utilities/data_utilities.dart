import 'package:flutter/material.dart';

Widget loading() {
  return Container(
    padding: EdgeInsets.only(top: 16,bottom: 16),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
Widget connectionError() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text('Connection Error!!!!'),
  );
}
Widget noData() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text('No Data Available!'),
  );
}
Widget error(var error) {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text(error.toString()),
  );
}