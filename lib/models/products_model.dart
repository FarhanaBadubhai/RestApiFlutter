import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/models/categories_model.dart';

class Products with ChangeNotifier{
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  Category? category;

  Products(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.images,
      this.creationAt,
      this.updatedAt,
      this.category});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
  }
  static List<Products>productFromSnapshot(List productSnapshot){
    return productSnapshot.map((data){
      return Products.fromJson(data);
    }).toList();
  }
  
}

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['image'] = image;
  //   data['creationAt'] = creationAt;
  //   data['updatedAt'] = updatedAt;
  //   return data;
  
