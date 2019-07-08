import 'package:blogging/Models/main.dart';
import 'package:flutter/material.dart';

class TitleTextFormField extends StatelessWidget {
  const TitleTextFormField({
    Key key,
    @required this.blog,
  }) : super(key: key);

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.only(
            top: 10, bottom: 19, left: 12, right: 12),
        child: Container(
          child: TextFormField(
            initialValue: "",
            decoration: const InputDecoration(
              hintText: 'Title',
              contentPadding: EdgeInsets.all(12),
              border: InputBorder.none,
            ),
             onSaved: (value) => blog.title = value,
            validator: (value) {
             return value.isEmpty
                 ? 'There must be a title to the blog.'
                 : null;
           },

          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200],
          ),
          height: 46,
        ),
      ),
    );
  }
}
  
class DescriptionTextFormField extends StatelessWidget {
  const DescriptionTextFormField({
    Key key,
    @required this.blog,
  }) : super(key: key);

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.only(
            top: 10, bottom: 19, left: 12, right: 12),
        child: Container(
          child: TextFormField(
            initialValue: "",
            decoration: const InputDecoration(
              hintText: 'Your desription..',
              contentPadding: EdgeInsets.all(12),
              border: InputBorder.none,
            ),
            onSaved: (value) => blog.description = value,
            validator: (value) {
              return value.isEmpty
                  ? 'There must be a description to the blog.'
                  : null;
            },
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200],
          ),
          height: 148,
        ),
      ),
    );
  }
}
