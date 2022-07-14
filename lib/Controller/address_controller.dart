import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:readerclub/Model/OfferBanner.dart';
import 'package:readerclub/Model/addressModel.dart';
import 'package:readerclub/repository/AddressRepository.dart';

import '../Model/Categories.dart';

class HomeController extends GetxController {
    @override
  void onInit() {
    super.onInit();
   getPodDetails();
  }
  
AddressRepo getPodRepository = AddressRepo();

  RxList<AddressDetails> podDetails = <AddressDetails>[].obs;



  Future<bool> getPodDetails() async {
    try {
      AddressModel? podDetailsRequestResponse =
          await getPodRepository.getProductDetails();
      log("----------controller page------$podDetailsRequestResponse");
      if (podDetailsRequestResponse != null &&
          podDetailsRequestResponse.dt != null) {
        podDetails.value = podDetailsRequestResponse.dt!;
        podDetails.refresh();

print("podaa........${podDetails}");
        return true;
      }

      return false;
    } catch (e) {
      print('IN catch' + e.toString());

      return false;
    }
  }
}