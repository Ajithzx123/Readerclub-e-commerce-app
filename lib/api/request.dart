import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClass {
  Future<dynamic> getJson({
    required Map<String ,String> body,
    required bool requiresAuth,
    required String endpoints,
  }) async {
    try {
      // Utils().showProgressDialog(Get.context!);

      final url =
          Uri.parse("https://readerclub.store/api/address/$endpoints");

      http.Response response;
      if (requiresAuth) {
        response = await http.get(
          url,
          headers:body,
        );
      } else {
        response = await http.post(
          url,
          body: body,
        );
      }
      var responseJson = _returnResponse(response);
      // Navigator.pop(Get.context!);
      print('Response ' + responseJson.toString());
      return responseJson;
    } catch (e) {
      // Navigator.pop(Get.context!);
      print(e.toString());
    }
  }
   Future<dynamic> deleteJson({
    required Map<String ,String> body,
    required bool requiresAuth,
    required String endpoints
  }) async {
    try {
      // Utils().showProgressDialog(Get.context!);

      final url =
          Uri.parse("https://readerclub.store/api/address/$endpoints");

      http.Response response;
      if (requiresAuth) {
        response = await http.delete(
          url,
          headers:body,
        );
      } else {
        response = await http.post(
          url,
          body: body,
        );
      }
      var responseJson = _returnResponse(response);
      // Navigator.pop(Get.context!);
      print('Response ' + responseJson.toString());
      return responseJson;
    } catch (e) {
      // Navigator.pop(Get.context!);
      print(e.toString());
    }
  }

  dynamic _returnResponse(http.Response response) async {
    // try {
    var responseJson;
    var errorObject;
    // print('Status Code ' + response.statusCode.toString());
    // print('Response.body___ ' + response.body);

    switch (response.statusCode) {
      case 200:
      case 201:
        {
          responseJson = json.decode(response.body);
          return responseJson;
        }

      case 204:
        {
          // print('204 true');
          return true;
        }

      case 400:
        {
          print('Status Code ' + response.statusCode.toString());
          responseJson = json.decode(response.body);
          errorObject = responseJson['error'];
          errorObject.forEach((key, value) {
            // _toast.showLongToast(errorObject[key][0]);
          });
          break;
        }
    }
  }
}