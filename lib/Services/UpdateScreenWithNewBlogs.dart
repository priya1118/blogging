import 'package:blogging/Models/main.dart';
import 'package:blogging/UserInterface/CustomDivider.dart';
import 'package:blogging/UserInterface/IconAndNameOfBlogger.dart';
import 'package:blogging/UserInterface/NoImageText.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddNewBlogScreen.dart';
import 'DetailsOfSelectedBlogScreen.dart';

class UpdateBlogs extends StatefulWidget {
  final List<Blog> blogList;

  UpdateBlogs(this.blogList);

  UpdateBlogsState createState() => UpdateBlogsState();
}

class UpdateBlogsState extends State<UpdateBlogs> {
  final AddingScreenState ref = new AddingScreenState();

  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //  FirebaseDatabase.instance.reference().child('blogs')!=null?
          widget.blogList != null
              ? widget.blogList.length != 0
                  ? Container(
                      child: FirebaseAnimatedList(
                          query: FirebaseDatabase.instance
                              .reference()
                              .child('blogs'),
                          itemBuilder: (BuildContext context,
                              DataSnapshot snapshot,
                              Animation<double> animation,
                              int index) {
                             return ListTile(
                              title: Container(
                                  child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          new IconAndNameOfBlogger(),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(right: 0),
                                            child: IconButton(
                                              icon: Icon(Icons.more_vert),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ElaborateBlog(
                                                                widget.blogList[
                                                                    index])));
                                              },
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 10,right: 10,bottom: 8,top: 5),
                                        child: Text(
                                          widget.blogList[index].title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Card(
                                          color: Colors.blueGrey,
                                          child: Container(
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  width: 300.0,
                                                  height: 300.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                40.0)),
                                                  ),
                                                  child: widget.blogList[index]
                                                              .image !=
                                                          null
                                                      ? Image.network(
                                                          widget.blogList[index]
                                                              .image,
                                                          height: 250,
                                                          width: 300)
                                                      : new NoImageText(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  new CustomDivider(),
                                ],
                              ),                             
                              ),
                            );
                          }),
                    )
                  : null
              : null,
    );
  }
}






