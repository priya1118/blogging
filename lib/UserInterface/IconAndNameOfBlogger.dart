import 'package:flutter/material.dart';

class IconAndNameOfBlogger extends StatelessWidget {
  const IconAndNameOfBlogger({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.account_circle),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            'Name',
          ),
        )
      ],
    );
  }
}