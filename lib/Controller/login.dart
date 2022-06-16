import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:readerclub/Model/UserDetails.dart';
import 'package:readerclub/View/User%20session/home%20screen/homescreen.dart';
import 'package:readerclub/View/widgets/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class LoginController extends GetxController {
  var name ;
  late TextEditingController usernamecontroller, passwordcontroller;

  @override
  void onInit() {
    super.onInit();
    usernamecontroller = TextEditingController();
    passwordcontroller = TextEditingController();
  }

  Future<UserDetails?> loginData() async {
    Dio dio = Dio();
    var apiData = ("https://readerclub.store/api/auth/login");

    Map mapdatas = {
      "username": usernamecontroller.text,
      "password": passwordcontroller.text,
    };
    try {
      final response = await dio.post(apiData, data: mapdatas);

      if (response.statusCode == 200) {
        print("name is............${response.data["user"]["name"].toString()}");
        customSnackbar(
            "Success",
           "Login SuccessFully",
            "success");
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setBool(savedKey, true);
         name = response.data["user"]["name"].toString();
          Get.offAll(const HomeScreen());
        UserDetails user =  UserDetails.fromJson(jsonDecode(response.data));
        
        
      
      
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        print("error is......... ${e.response!.data.toString()}");

        customSnackbar(
            "Error",
            e.response!.data["user"] ?? e.response!.data["password"].toString(),
            "error");
          
        //  Text(
        //     e.response!.data["user"] ?? e.response!.data["password"].toString(),

      }
    }
  }
}
