import 'dart:io';
import 'package:blogging/Models/main.dart';
import 'package:blogging/UserInterface/AddPostText.dart';
import 'package:blogging/UserInterface/AddingScreenAppBar.dart';
import 'package:blogging/UserInterface/BottomTextAndPostButton.dart';
import 'package:blogging/UserInterface/TextFormFields.dart';
import 'package:blogging/UserInterface/TextOnPostButton.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddingScreen extends StatefulWidget {
  AddingScreenState createState() => AddingScreenState();
}

class AddingScreenState extends State<AddingScreen> {
  final List<Blog> blogList = new List();
  Blog blog;
  DatabaseReference referenceToBlog;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static Future<FirebaseApp> getApp() async {
    const FirebaseOptions myOptions = const FirebaseOptions(
      googleAppID: '1:225417561902:android:7e1cee076fbc3d77',
      apiKey: 'AIzaSyBqBl1UtwytysqbuTB_SJAzAAOEysOiR7o',
      databaseURL: 'https://bloggingfirebase.firebaseio.com',
    );
    FirebaseApp app;
    app = await FirebaseApp.configure(name: "blogs", options: myOptions);
    return app;
  }

  @override
  void initState() {
    super.initState();
    blog = Blog("", "", "");
    getApp().then((app) {
      final FirebaseDatabase database = new FirebaseDatabase(app: app);
      referenceToBlog = database.reference().child('blogs');
      referenceToBlog.onChildAdded.listen(_onEntryAdded);
      referenceToBlog.onChildChanged.listen(_onEntryChanged);
    });
  }

  _onEntryAdded(Event event) {
    setState(() {
      blogList.add(Blog.fromSnapshot(event.snapshot));
    });
  }

  _onEntryChanged(Event event) {
    var oldEntry = blogList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      blogList[blogList.indexOf(oldEntry)] = Blog.fromSnapshot(event.snapshot);
    });
  }

  File _image;
  String urlOfImage;

  Future getImage(imageSource) async {
    var image = await ImagePicker.pickImage(source: imageSource);
    if (image == null) return;

    setState(() {
      _image = image;
    });
  }

  showDrawer() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: ListTile(
                        title: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Choose picture from',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      color: Colors.white,
                      height: 70,
                    ),
                    Container(
                      child: ListTile(
                          leading: Icon(Icons.camera),
                          title: Text('Camera'),
                          onTap: () {
                            getImage(ImageSource.camera);
                            Navigator.pop(context);
                          }),
                    ),
                    Divider(),
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.perm_media),
                        title: Text('Gallery'),
                        onTap: () {
                          getImage(ImageSource.gallery);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
            height: 220,
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true, 
      appBar: 
      AppBar(
         leading: AddingScreenAppBar(blogList: blogList,),
        backgroundColor: Colors.white,
      ),
      body:
       ListView(
        children: [
          Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  new AddPostText(),
                  new TitleTextFormField(blog: blog),
                  ListTile(
                    title: Padding(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 19, left: 12, right: 12),
                      child: Container(
                        child: _image == null
                            ? IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  showDrawer();
                                })                          
                           : Image.file(
                                _image,
                              ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                        height: 150,
                      ),
                    ),
                  ),
                  new DescriptionTextFormField(blog: blog),
                ],
              )),
        ],
      ),
      bottomNavigationBar: 
      new BottomTextAndPostButton(formKey: formKey, image: _image, blog: blog, referenceToBlog: referenceToBlog, blogList: blogList), 
    );
  }
}




class PostButton extends StatelessWidget {
  const PostButton({
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
    return Container(
      child: RaisedButton(
        color: Colors.pink,
        textColor: Colors.white,
        child: new TextOnPostButton(),
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8)),
        onPressed: () async{
            if (formKey.currentState.validate()) {
         final StorageReference referenceToImage =
         FirebaseStorage.instance.ref().child("blogs");
         var timeKey = new DateTime.now();
         final StorageUploadTask uploadTask =
         referenceToImage.child(timeKey.toString() + ".jpg").putFile(_image);
         var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
         var urlOfImage = imageUrl.toString();
         blog.image = urlOfImage;
         formKey.currentState.save();
         referenceToBlog.push().set(blog.toJson());
         Scaffold.of(context).showSnackBar(SnackBar(content: Text('Yay! Your blog is posted!',style: TextStyle(color: Colors.white),),duration: Duration(seconds: 15),backgroundColor: Colors.black,),);

       }
       else{
         Text('Form is not valid. Give input to all the required fields!');
       }
           
          Navigator.pop(context, blogList);
        },
      ),
      width: 330,
    
    );
  }
}






