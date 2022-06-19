
import 'package:dio/dio.dart';
import 'package:readerclub/Model/Categories.dart';

Future <CategoriesModel> categoriesApi() async{
  
  
   Dio dio = Dio();
   var ApiUrl = ("https://readerclub.store/api/categories");

  final  response = await dio.get(ApiUrl);


   CategoriesModel categoriesList =  CategoriesModel.fromJson(response.data);
   
    return categoriesList;

}