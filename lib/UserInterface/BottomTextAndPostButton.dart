import 'dart:io';
import 'package:blogging/Models/main.dart';
import 'package:blogging/Services/AddNewBlogScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BottomTextAndPostButton extends StatelessWidget {
  const BottomTextAndPostButton({
    Key key,
    @required this.formKey,
    @required File image,
    @required this.blog,
    @required this.referenceToBlog,
    @required this.blogList,
  }) : _image = image, super(key: key);

  final GlobalKey<FormState> formKey;
  final File _image;
  final Blog blog;
  final DatabaseReference referenceToBlog;
  final List<Blog> blogList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 19, left: 12, right: 12),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  'By posting you are agreeing to the following',
                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12),
                ),
              ),
              Container(
                child: Text(
                  'Terms of Services & Privacy Policy',
                ),
              ),
              new PostButton(formKey: formKey, image: _image, blog: blog, referenceToBlog: referenceToBlog, blogList: blogList,),
            ],
          ),
        ),
      ),
    );
  }
}