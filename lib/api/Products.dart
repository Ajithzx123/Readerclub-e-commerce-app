
import 'package:dio/dio.dart';
import 'package:readerclub/Model/Categories.dart';

Future <CategoriesModel> productsApi() async{
  
  
   Dio dio = Dio();
   var ApiUrl = ("https://readerclub.store/api/categories");

  final  response = await dio.get(ApiUrl);


  print(response.data);
   CategoriesModel products =  CategoriesModel.fromJson(response.data);
    return products;
}