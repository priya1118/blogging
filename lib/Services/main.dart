import 'package:blogging/Models/main.dart';
import 'package:blogging/Services/AddNewBlogScreen.dart';
import 'package:blogging/Services/UpdateScreenWithNewBlogs.dart';
import 'package:blogging/UserInterface/bottomIcons.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main(){
runApp(MaterialApp(debugShowCheckedModeBanner: false,
home: LatestFeed(),));
} 

class LatestFeed extends StatefulWidget{
 
  State<StatefulWidget> createState(){
    return LatestFeedState();
  }
}

class LatestFeedState extends State<LatestFeed> {
  // This widget is the root of your application.
 List<Blog> blogList=List();  
    Blog blog;
  DatabaseReference referenceToBlogInitially;


   @override
  void initState() {
    super.initState();
    blog = Blog("", "", "");
    referenceToBlogInitially = FirebaseDatabase.instance.reference().child('blogs');
    referenceToBlogInitially.onChildAdded.listen(_onEntryAdded);
  }

   _onEntryAdded(Event event) {
    setState(() {
     blogList.add(Blog.fromSnapshot(event.snapshot));
   });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blogging App',
      theme: ThemeData(       
        primaryColor: Colors.white,
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.black)
        )
      ),
      home: Scaffold(appBar: AppBar(
        title:Text('Latest Feed',style:TextStyle(fontSize:20 ),),
        actions: <Widget>[
         Container(
          child: Padding(padding:EdgeInsets.all(10),child: RaisedButton(
            color: Colors.red,
            textColor: Colors.white,
            child:Row(children:[
               Padding(padding:EdgeInsets.only(left: 10,right:10), child:Text('Add Post',style: TextStyle(fontSize: 14),),),
               Icon(Icons.add,color: Colors.white,),
            ]  ),
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20)),
          onPressed: ()async{
           blogList=await Navigator.push(context,MaterialPageRoute(builder: (context)=>AddingScreen()));
          },            
          ),
          ),
          ),
      ],),
      body:
      UpdateBlogs(blogList),
       bottomNavigationBar:
       BottomIcons(),
      ),
      ); 

  }
}


