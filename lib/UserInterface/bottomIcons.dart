import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomIcons extends StatefulWidget{
BottomIconsState createState()=>BottomIconsState();
}
class BottomIconsState extends State<BottomIcons>{
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(height: 60,child:BottomAppBar(
        color: Colors.black,
      child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[  
          Container(child: Icon(Icons.home,color: Colors.white70,size:30),),
         Container(child: Icon(Icons.search,color: Colors.white70,size:30),
         ),
          Container(child: Icon(Icons.bookmark_border,color: Colors.white70,size:30),
         ),
          Container(child:Icon(Icons.account_circle,color: Colors.white70,size:30),
          ),
      ],) ,
      ));
  }
}
