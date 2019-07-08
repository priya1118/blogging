import 'package:flutter/material.dart';

class NoImageText extends StatelessWidget {
  const NoImageText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          'No image',
          style: TextStyle(
              color: Colors
                  .redAccent),
        ),
      );
  }
}