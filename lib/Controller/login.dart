import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:readerclub/View/User%20session/home%20screen/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class LoginController extends GetxController{
  late TextEditingController usernamecontroller,passwordcontroller;

@override
  void onInit() {
    super.onInit();
   usernamecontroller = TextEditingController();
   passwordcontroller = TextEditingController();
  }


  void loginData() async {
    Dio dio = Dio();
    var apiData = ("https://readerclub.store/api/auth/login");

    Map mapdatas = {
      "username": usernamecontroller.text,
      "password": usernamecontroller.text,
    };
    try {
      final  response = await dio.post(apiData, data: mapdatas);
     

      if (response.statusCode == 200) {
        var dataS = jsonDecode(response.data);

      print('DATAAS $dataS');
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setBool(savedKey, true);
        Get.offAll(HomeScreen());
        // context
        //     .read<LoadingblocBloc>()
        //     .add(CircularLoadingEvent(isLoading: false));

        // context.read<NavblocBloc>().add(NavToHomeScrenEvent());
        // return UserDetails.fromJson(jsonDecode(response.data));
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        print("error is......... ${e.response!.data.toString()}");
        // context
        //     .read<LoadingblocBloc>()
        //     .add(CircularLoadingEvent(isLoading: false));
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   duration: const Duration(seconds: 2),
        //   behavior: SnackBarBehavior.floating,
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        //   content: Text(
        //     e.response!.data["user"] ?? e.response!.data["password"].toString(),
        //     style: TextStyle(
        //         fontFamily: "poppinz",
        //         fontSize: 12.sp,
        //         fontWeight: FontWeight.bold),
        //   ),
        //   backgroundColor: const Color.fromARGB(255, 141, 8, 8),
        // ));
      }
    }
}}