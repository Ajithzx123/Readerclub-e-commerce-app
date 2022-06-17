 import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:readerclub/Model/OfferBanner.dart';

Future<OfferBanner> offerBannerApi() async{
  
   Dio dio = Dio();
   var ApiUrl = ("https://readerclub.store/api/banner");

  final  response = await dio.get(ApiUrl);


  // print(response.data);
   OfferBanner result =  OfferBanner.fromJson(response.data);
    return result;
  
  }
