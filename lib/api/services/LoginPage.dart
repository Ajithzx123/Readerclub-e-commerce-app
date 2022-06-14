
  import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:readerclub/api/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

Future loginData( String username, String password) async {
    Dio dio = Dio();
    var apiData = ("https://readerclub.store/api/auth/login");

    Map mapdatas = {
      "username": username,
      "password": password,
    };
    try {
      final Response response = await dio.post(apiData, data: mapdatas);
      print(response.data);

      if (response.statusCode == 200) {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setBool(savedKey, true);
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
  }