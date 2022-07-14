import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:readerclub/Model/UserDetails.dart';
import 'package:readerclub/Model/addressModel.dart';
import 'package:readerclub/Model/shared_prefrences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userApi();
  }

  var LoginDetails = SharedPrefrenceModel.getString('userDetails');

  Future userApi() async {
    Dio dio = Dio();

    var apiurl =
        ("https://readerclub.store/api/userDetails/${LoginDetails["user"]["_id"]}");

    dio.options.headers['header'] = "${LoginDetails["accessToken"]}";

    final response = await dio.get(apiurl);
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    print(response.data);

    sharedPreferences.setString('details', jsonEncode(response.data));
    // var details = SharedPrefrenceModel.getString("details");
    // print("jfdskfdjfdkfjkjfjskjfsfjsfjsdklfjskfjsdkfjskdfjdsklf${details}");
    // print('hhhhhhhhhhhhhhhhhhhhhhhhh${details["dt"][0]["gender"]}');
    // UserDetails value = UserDetails.fromJson(response.data);
    // return value;
  }

  //  Future<AddressModel> addressApi() async {
  //   Dio dio = Dio();

  //   var apiurl =
  //       ("https://readerclub.store/api/address/${LoginDetails["user"]["_id"]}");

  //   dio.options.headers['header'] = "${LoginDetails["accessToken"]}";

  //   final response = await dio.get(apiurl);
   
  //   print(response.data);
    
  //   AddressModel value = AddressModel.fromJson(response.data);
  //   return value;

  
  // }


}
