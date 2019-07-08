import 'package:flutter/material.dart';

class AddPostText extends StatelessWidget {
  const AddPostText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.only(top: 10, left: 12),
        child: Container(
          child: Text(
            'Add Post',
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}