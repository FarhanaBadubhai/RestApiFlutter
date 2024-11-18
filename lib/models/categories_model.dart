import 'package:flutter/material.dart';

class Category with ChangeNotifier{
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category({this.id, this.name, this.image, this.creationAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  static List<Category>categoryFromSnapshot(List categorySnapshot){
    return categorySnapshot.map((data){
      return Category.fromJson(data);
    }).toList();
  }
}