import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{

@override
  void onInit() {
    super.onInit();
    offerBannerController();
  }

  void offerBannerController () async{
   Dio dio = Dio();
   var ApiUrl = ("https://readerclub.store/api/banner");

  final  response = await dio.get(ApiUrl);

  print(response.data);
  if(response.statusCode == 200 ){
    
  }
  }
}