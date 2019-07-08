import 'package:flutter/material.dart';

class IconsOnTitleBar extends StatefulWidget {
  IconsOnTitleBarState createState() => IconsOnTitleBarState();
}

class IconsOnTitleBarState extends State<IconsOnTitleBar> {
  static bool saved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.brightness_3),
            onPressed: null,
          ),
          IconButton(
            icon: isSaved()
                ? Icon(
                    Icons.bookmark_border,
                  )
                : Icon(Icons.bookmark),
            onPressed: () {
              setState(() {
                {
                  pressFavorite();
                }
              });
            },
          ),
        ],
      ),
    );
  }

  void pressFavorite() {
    if (isSaved() == true) {
      saved = false;
    } else {
      saved = true;
    }
  }

  bool isSaved() {
    return saved == null ? false : saved;
  }
}
