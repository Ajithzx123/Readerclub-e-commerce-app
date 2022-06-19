import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:readerclub/Model/Categories.dart';
// import 'package:readerclub/api/Categories.dart';

class ApiController extends GetxController {
  final dio = Dio();
  List<Category> categorys = [];
  getCategory(String query) async {
    var response = await dio.get("https://readerclub.store/api/products/cat?category=$query");
    // print("12345 ${response.data}");
  }

  Future<List<Category>>getCat() async {
    categorys.clear();
  final response = await dio.get("https://readerclub.store/api/categories");
  List<dynamic> data = response.data["dt"];
   List<Category> cat =data.map((e) => Category.fromJson(e)).toList();
  // print("12345 ${cat.length}");
  categorys.addAll(cat);
  // print("1111 ${categorys.length}");


  return cat;
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCat();
  }
}