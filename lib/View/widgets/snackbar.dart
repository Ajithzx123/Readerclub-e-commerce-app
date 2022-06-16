import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackbar(title, message, type) {
  Get.snackbar(title, message,
      snackPosition:
          type == "error" ? SnackPosition.BOTTOM : SnackPosition.TOP,
          backgroundColor: type == "error"? Colors.red:Colors.green,
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          duration: Duration(milliseconds: 1300)
          );
}
