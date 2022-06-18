
import 'package:dio/dio.dart';
import 'package:readerclub/Model/Categories.dart';
import 'package:readerclub/Model/productModel.dart';

Future <ProductsModel> productsApi() async{
  
  
   Dio dio = Dio();
   var ApiUrl = ("https://readerclub.store/api/products");
   

  final  response = await dio.get(ApiUrl);


  print(response.data);
   ProductsModel products = ProductsModel.fromJson(response.data);
    return products;
}