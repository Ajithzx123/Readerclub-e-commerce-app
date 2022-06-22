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
  dynamic isloading = false;
  late TextEditingController usernamecontroller, passwordcontroller;

  @override
  void onInit() {
    super.onInit();
    usernamecontroller = TextEditingController();
    passwordcontroller = TextEditingController();
  }

  Future loginData() async {
    isloading = true;
    update();
    Dio dio = Dio();
    var apiData = ("https://readerclub.store/api/auth/login");

    Map mapdatas = {
      "username": usernamecontroller.text,
      "password": passwordcontroller.text,
    };
    try {
      final response = await dio.post(apiData, data: mapdatas);

      customSnackbar("Success", "Login SuccessFully", "success");
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setBool(savedKey, true);

      sharedPreferences.setString('userDetails', jsonEncode(response.data));

      Get.offAll(() => HomeScreen());
    } catch (e) {
      if (e is DioError) {
        print("error is......... ${e.response!.data.toString()}");

        customSnackbar(
            "Error",
            e.response!.data["user"] ?? e.response!.data["password"].toString(),
            "error");
      }
    } finally {
      print("dskjfdfsdk");
      isloading = false;
      update();
    }
  }
}
