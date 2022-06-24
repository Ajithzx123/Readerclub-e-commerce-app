import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:readerclub/Controller/loginController.dart';

import 'package:sizer/sizer.dart';

import '../widget/widgets.dart';

class PhoneLogin extends StatelessWidget {
  PhoneLogin({Key? key}) : super(key: key);

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
              physics: const ClampingScrollPhysics(
                  parent: NeverScrollableScrollPhysics()),
              children: [
            Padding(
              padding: EdgeInsets.all(2.w),
              child: GetBuilder<LoginController>(
                builder: (controller) {
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
                                "Assets/login/phone otp page/otp.json",
                                height: 40.h,
                                alignment: Alignment.centerLeft,
                                addRepaintBoundary: false,
                              ),
                              Text(
                                "Enter Your Phone Number",
                                style: TextStyle(
                                    fontSize: 23.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Text(
                                "You'll recieve a 4-digit  code for the  Phone Number verification",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              CustomTextformfield(
                                controller: controller.phcontroller,
                                validator: ((numbervalue) {
                                  if (numbervalue.length != 10) {
                                    return 'Mobile Number must be of 10 digit';
                                  }
                                  return null;
                                }),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              controller.isloading == true
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : Center(child: _RegisterButton(
                                      ontap: () {
                                        if (formKey.currentState!.validate()) {
                                          controller.phoneVerification();
                                        }
                                      },
                                    )),
                              SizedBox(
                                height: 12.h,
                              ),
                              const RegisterDontHaveAccount()
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ])),
    );
  }
}

//   Future phoneVerification(BuildContext context) async {
//     var apiUrl = Uri.parse("https://readerclub.store/api/auth/otplogin");

//     Map mapDatas = {
//       "mobile": phonecontroller.text,
//     };
//     print("JSON DATA $mapDatas");

//     http.Response response = await http.post(apiUrl, body: mapDatas);

//     if (response.statusCode == 200) {
//       var dataS = jsonDecode(response.body);

//       print('DATAAS $dataS');
//       Navigator.push(
//           context,
//           PageTransition(
//               child: OtpPage(phcontroller: phonecontroller),
//               type: PageTransitionType.fade));
//     } else {
//       print("No phone number");
//     }
//   }

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

class CustomTextformfield extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator validator;

  const CustomTextformfield(
      {required this.controller, required this.validator, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controller,
      validator: validator,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          hintText: "Phone Number",
          labelText: "Phone Number",
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
    );
  }
}
