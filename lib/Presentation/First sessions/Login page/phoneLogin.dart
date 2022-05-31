import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import 'LoginPage.dart';

class PhoneLogin extends StatelessWidget {
  PhoneLogin({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.arrow_back),
            Lottie.asset(
              "Assets/login/phone otp page/otplogin.json",
              height: 30.h,
              alignment: Alignment.centerLeft,
              addRepaintBoundary: false,
            ),
            Text(
              "Enter Your Phone Number",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              "You'll recieve a 4-digit  code for the  Phone Number verification",
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 9.w,right: 9.w),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controller,
                validator: ((numbervalue) {
                  if (numbervalue!.length != 10) {
                    return 'Mobile Number must be of 10 digit';
                  }
                  return null;
                }),
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    hintText: "Phone Number",
                    hintStyle: TextStyle(fontSize: 12.sp),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: .3.w),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: .3.w),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: .3.w),
                      borderRadius: BorderRadius.circular(25.0),
                    )),
              ),
            ),
            SizedBox(height: 2.h,),
            Center(
              child: Container(
                  width: 70.w,
                  height: 6.h,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(166, 210, 255, 1),
                      Color.fromARGB(255, 0, 139, 225)
                    ]),
                  ),
                  child: Center(
                      child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp),
                  ))),
            ),
          ],
        ),
      )),
    );
  }
}
