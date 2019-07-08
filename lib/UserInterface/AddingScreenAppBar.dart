import 'package:blogging/Models/main.dart';
import 'package:blogging/UserInterface/GoBackButton.dart';
import 'package:flutter/material.dart';

class AddingScreenAppBar extends StatelessWidget {
  const AddingScreenAppBar({
    Key key,
    @required this.blogList,
  }) : super(key: key);

  final List<Blog> blogList;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          new GoBackButton(blogList: blogList),
        ],
      );
  }
}