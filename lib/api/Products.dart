
import 'package:dio/dio.dart';
import 'package:readerclub/Model/Categories.dart';
import 'package:readerclub/Model/productModel.dart';

Future <ProductsModel> productsApi(String value) async{

  
  
   Dio dio = Dio();
   var ApiUrl = ("https://readerclub.store/api/products/cat?category=$value");
   

  final  response = await dio.get(ApiUrl);


  print(response.data);
   ProductsModel products = ProductsModel.fromJson(response.data);
    return products;
}