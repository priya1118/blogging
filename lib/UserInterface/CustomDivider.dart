import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top:10,bottom: 10),child: Container(
           decoration: BoxDecoration(
             border: Border(
               bottom: BorderSide(color: Colors.grey[200],width: 3.0),
             ),
           ),
         ),);
  }
}