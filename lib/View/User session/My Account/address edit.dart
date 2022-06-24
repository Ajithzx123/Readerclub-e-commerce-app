import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:readerclub/Controller/loginController.dart';
import 'package:readerclub/View/widgets/BlueButton.dart';
import 'package:readerclub/View/widgets/textfromWidget.dart';

import 'package:sizer/sizer.dart';


class AddressEdit extends StatelessWidget {
  AddressEdit({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final addressController = TextEditingController();

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
              child: GetBuilder(
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
                              CustomText(validator: (value) {
                                if(value == null){

                                }
                              }, textinputaction: TextInputAction.next, textinputtype: TextInputType.streetAddress, obscure: false, controller: addressController, hinttext: "Address", labeltext: "Address")
                              // CustomTextformfield(
                              //   controller: controller.phcontroller,
                              //   validator: ((numbervalue) {
                              //     if (numbervalue.length != 10) {
                              //       return 'Mobile Number must be of 10 digit';
                              //     }
                              //     return null;
                              //   }),
                              // ),,
                              ,
                              SizedBox(
                                height: 2.h,
                              ),
                              // controller.isloading == true
                              //     ? const Center(
                              //         child: CircularProgressIndicator())
                                   Center(child: ButtonBlue(ontap: (){}, title: "Submit")),
                              SizedBox(
                                height: 12.h,
                              ),
                            
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