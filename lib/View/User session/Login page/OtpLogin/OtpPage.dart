import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:readerclub/Controller/loginController.dart';
import 'package:sizer/sizer.dart';

import '../widget/widgets.dart';

class OtpPage extends StatelessWidget {
  OtpPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
          child: ListView(
              // physics: const ClampingScrollPhysics(
              //     parent: NeverScrollableScrollPhysics()),
              children: [
            Padding(
              padding: EdgeInsets.all(2.w),
              child: GetBuilder<LoginController>(
                builder: ((controller) {
                  return Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.w, right: 8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Lottie.asset(
                                "Assets/login/phone otp page/otpverification.json",
                                height: 40.h,
                                alignment: Alignment.centerLeft,
                                addRepaintBoundary: false,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                "Enter Your Code",
                                style: TextStyle(
                                    fontSize: 23.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Text(
                                "Please enter the 4-digit verification code sent to your Phone Number",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(
                                        255, 103, 102, 102)),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: .5.w),
                                child: Pinput(
                                  validator: (value) {
                                    if (value!.length != 4) {
                                      return "Enter the 4 digit Otp";
                                    }
                                    return null;
                                  },
                                  length: 4,
                                  controller: controller.otpController,
                                  focusNode: FocusNode(),
                                  separator: SizedBox(
                                    width: 6.w,
                                  ),
                                  defaultPinTheme: defaultPinTheme,
                                  showCursor: true,
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              controller.isloading == true
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : Center(
                                      child: _RegisterButton(
                                        ontap: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            controller.otpVerification();
                                          }
                                        },
                                      ),
                                    ),
                              SizedBox(
                                height: 7.h,
                              ),
                              const RegisterDontHaveAccount()
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ])),
    );
  }
}

// Future otpVerification(BuildContext context) async {
//   var apiUrl = Uri.parse("https://readerclub.store/api/auth/otpverify");

//   Map mapDatas = {
//     "otp": otpController.text,
//     "mobile": phcontroller.text,
//   };
//   //  print("${otpController.text}");
//   http.Response response = await http.post(apiUrl, body: mapDatas);
//   // print("${response.statusCode}");

//   if (response.statusCode == 200) {
//     final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   sharedPreferences.setBool(savedKey, true);
//     var dataS = jsonDecode(response.body);

//     print('DATAAS $dataS');
//     Navigator.pushAndRemoveUntil(
//         context,
//         PageTransition(child: HomeScreen(), type: PageTransitionType.fade),
//         (route) => false);
//   } else {
//     print("wrong Otp");
//   }
// }

final defaultPinTheme = PinTheme(
    width: 18.w,
    height: 8.h,
    textStyle: TextStyle(
        fontSize: 15.sp,
        color: const Color.fromRGBO(70, 69, 66, 1),
        fontWeight: FontWeight.bold),
    decoration: BoxDecoration(
      color: const Color.fromARGB(94, 202, 202, 202),
      borderRadius: BorderRadius.circular(24),
    ));

class _RegisterButton extends StatelessWidget {
  final VoidCallback ontap;
  const _RegisterButton({
    required this.ontap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          height: 7.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(166, 210, 255, 1),
              Color.fromARGB(255, 0, 139, 225)
            ]),
          ),
          child: Center(
              child: Text(
            "Submit",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp),
          ))),
    );
  }
}
