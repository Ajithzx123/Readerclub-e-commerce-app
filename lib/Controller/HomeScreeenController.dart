import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:readerclub/Model/Categories.dart';
import 'package:readerclub/Model/OfferBanner.dart';
import 'package:readerclub/Model/productModel.dart';

class HomeScreenController extends GetxController{
  
  Future<OfferBanner> offerBannerApi() async {
  Dio dio = Dio();
  var apiUrl = ("https://readerclub.store/api/banner");

  final response = await dio.get(apiUrl);

  OfferBanner result = OfferBanner.fromJson(response.data);
  return result;
}

Future<CategoriesModel> categoriesApi() async {
  Dio dio = Dio();
  var apiUrl = ("https://readerclub.store/api/categories");

  final response = await dio.get(apiUrl);

  CategoriesModel categoriesList = CategoriesModel.fromJson(response.data);

  return categoriesList;
}

Future<ProductsModel> productsApi(String value) async {
  Dio dio = Dio();
  var apiUrl = ("https://readerclub.store/api/products/cat?category=$value");

  final response = await dio.get(apiUrl);

  // print(response.data);
  ProductsModel products = ProductsModel.fromJson(response.data);
  return products;
}

Future<ProductsModel> searchApi() async {
  Dio dio = Dio();
  var apiUrl = ("https://readerclub.store/api/products");

  final response = await dio.get(apiUrl);

  // print(response.data);
  ProductsModel products = ProductsModel.fromJson(response.data);
  return products;
}

}