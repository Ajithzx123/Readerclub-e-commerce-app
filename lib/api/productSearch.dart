
import 'package:dio/dio.dart';
import 'package:readerclub/Model/Categories.dart';
import 'package:readerclub/Model/productModel.dart';

Future <ProductsModel> searchApi(String search) async{

  
  
   Dio dio = Dio();
   var ApiUrl = ("https://readerclub.store/api/products/search?search=$search");
   

  final  response = await dio.get(ApiUrl);


  // print(response.data);
   ProductsModel products = ProductsModel.fromJson(response.data);
    return products;
}