import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/consts/api_const.dart';
import 'package:store_api_flutter_course/models/categories_model.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/models/user_model.dart';
//import 'package:store_api_flutter_course/screens/categories_screen.dart';

class APIHandler{
  static Future<List<dynamic>>getData({required String target})async{
    var uri=Uri.https(
      BASE_URL,"api/v1/$target",
    );
   var response= await http.get(uri);


   var data=jsonDecode(response.body); 
   List tempList=[];
   for(var v in data){
    tempList.add(v);
   }
   return tempList;
  }

  static Future<List<Products>> getAllProducts()async{
   List temp=await getData(target: "products");
   return Products.productFromSnapshot(temp);
  }


  static Future<List<Category>> getAllCategories()async{
    List temp=await getData(target: "categories");
   return Category.categoryFromSnapshot(temp);
  }

   static Future<List<Users>> getAllUsers()async{
    List temp=await getData(target: "users");
   return Users.usersFromSnapshot(temp);
  }

   static Future<Products>getProductById({required String id})async{
    var uri=Uri.https(
      BASE_URL,"api/v1/products/$id",
    );
   var response= await http.get(uri);


   var data=jsonDecode(response.body); 
  
   
   return Products.fromJson(data);
  }

}