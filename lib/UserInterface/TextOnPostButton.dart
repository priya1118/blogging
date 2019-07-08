import 'package:flutter/material.dart';

class TextOnPostButton extends StatelessWidget {
  const TextOnPostButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Text(
        'Post',
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}