import 'package:firebase_database/firebase_database.dart';

class Blog {
  String key;
  String title;
  String description;
  String image;

  Blog(String title, String description,String image){
    this.title=title;
    this.description=description;
    this.image=image;
  }
   

  Blog.fromSnapshot(DataSnapshot snapshot) :
     key= snapshot.key,
    title = snapshot.value["title"],
    description = snapshot.value["description"],
    image=snapshot.value["image"];
  toJson() {
    return {
      "title": title,
      "description": description,
      "image": image,
    };
  }

}
