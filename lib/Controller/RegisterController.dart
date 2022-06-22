import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readerclub/View/User%20session/Login%20page/LoginPage.dart';
import 'package:readerclub/View/User%20session/home%20screen/homescreen.dart';
import 'package:readerclub/View/widgets/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class RegisterController extends GetxController {
  int pageindex = 0;
  late TextEditingController nameController,
      usernameController,
      emailController,
      phoneController,
      passwordController,
      confirmPasswordController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();

    usernameController = TextEditingController();

    emailController = TextEditingController();

    phoneController = TextEditingController();

    passwordController = TextEditingController();

    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {

    super.onClose();
   
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  registerationUser() async {
    Dio dio = Dio();
    var apiUrl = ("https://readerclub.store/api/auth/register");

    Map mapDatas = {
      "name": nameController.text,
      "username": usernameController.text,
      "email": emailController.text,
      "mobile": phoneController.text,
      "password": passwordController.text,
      "cpassword": confirmPasswordController.text,
    };
    try {
      final response = await dio.post(apiUrl, data: mapDatas);
      if (response.statusCode == 200) {
        customSnackbar("Success", "Registered Successfully", "success");

        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setBool(savedKey, true);

        Get.offAll( LoginPage(), transition: Transition.fade);
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        customSnackbar(
            "Error",
            e.response!.data["user"] ?? e.response!.data["username"].toString(),
            "error");
      }
    }
  }
}
