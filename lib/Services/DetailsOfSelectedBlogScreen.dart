import 'package:blogging/Models/main.dart';
import 'package:blogging/UserInterface/GoBackButton.dart';
import 'package:blogging/UserInterface/IconsOnTitleBar.dart';
import 'package:blogging/UserInterface/NoImageText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElaborateBlog extends StatefulWidget {
  final Blog blogSelected;
  ElaborateBlog(this.blogSelected);
  @override
  ElaborateBlogState createState() => ElaborateBlogState();
}

class ElaborateBlogState extends State<ElaborateBlog> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return new GoBackButton(blogList: null,);
          },
        ),
        title: IconsOnTitleBar(),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //Icon(Icons.)
        ],
      )),
      body: BlogInDetail(widget.blogSelected),
    );
  }
}


class BlogInDetail extends StatefulWidget {
  final Blog blogSelected;
  BlogInDetail(this.blogSelected);
  BlogInDetailState createState() => BlogInDetailState();
}

class BlogInDetailState extends State<BlogInDetail> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: 
          Container(
            child: widget.blogSelected.image != null
                ? Image.network(widget.blogSelected.image)
                : Container(
                    child: NoImageText(),
                    width: 250,
                    height: 250,
                  ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            widget.blogSelected.title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: 32,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Name',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'date',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
          child: Text(
            widget.blogSelected.description,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
          ),
        ),
      ],
    );
  }
}
