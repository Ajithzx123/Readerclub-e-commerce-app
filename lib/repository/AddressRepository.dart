

import 'package:readerclub/Model/addressModel.dart';
import 'package:readerclub/Model/shared_prefrences.dart';
import 'package:readerclub/api/request.dart';

class AddressRepo {
  final ApiClass helper = ApiClass();
  var LoginDetails = SharedPrefrenceModel.getString('userDetails');


  Future<dynamic> getProductDetails() async {

    Map<String, String> params = {
     "header" : "${LoginDetails["accessToken"]}"
    };
    String endpoints = LoginDetails["user"]["_id"];
    try {
      var addressApiResponse = await helper.getJson(body:params , requiresAuth: true,endpoints:endpoints );
      if (addressApiResponse != null) {
        print('Response - $addressApiResponse');
        AddressModel AddressDetails =AddressModel.fromJson(
            addressApiResponse);
        print('tripDetails $AddressDetails');
        return AddressDetails;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

   Future<dynamic> deletePrpducts() async {

    Map<String, String> params = {
     "header" : "${LoginDetails["accessToken"]}",
     "userId" :  LoginDetails["user"]["_id"]
    };
    String endpoints = "";
    try {
      var addressApiResponse = await helper.getJson(body:params , requiresAuth: true,endpoints:endpoints );
      if (addressApiResponse != null) {
        print('Response - $addressApiResponse');
        AddressModel AddressDetails =AddressModel.fromJson(
            addressApiResponse);
        print('tripDetails $AddressDetails');
        return AddressDetails;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}