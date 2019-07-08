import 'package:blogging/Models/main.dart';
import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({
    Key key,
    @required this.blogList,
  }) : super(key: key);

  final List<Blog> blogList;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: Colors.black,
      onPressed: () {
        blogList!=null?
        Navigator.pop(context,blogList):Navigator.pop(context);
      },
    );
  }
}