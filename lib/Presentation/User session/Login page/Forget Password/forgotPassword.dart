import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Presentation/User%20session/Login%20page/Forget%20Password/OtpforgotPass.dart';

import 'package:sizer/sizer.dart';

import '../../../../logic/LoadingBloc/loadingbloc_bloc.dart';
import '../widget/widgets.dart';

class ForgetPassPhone extends StatelessWidget {
  ForgetPassPhone({Key? key}) : super(key: key);

  TextEditingController phcontroller = TextEditingController();

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
          child: ListView(shrinkWrap: true,
              // physics: const ClampingScrollPhysics(
              //     parent: NeverScrollableScrollPhysics()),
              children: [
            Padding(
              padding: EdgeInsets.all(2.w),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, right: 8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Lottie.asset(
                            "Assets/login/forgotPassword.json",
                            height: 40.h,
                            alignment: Alignment.centerLeft,
                            addRepaintBoundary: false,
                          ),
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontSize: 23.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text(
                            "Dont worry! It happens. Please enter the phone number associated with your account",
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          CustomTextformfield(
                            controller: phcontroller,
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
                          Center(
                            child:
                                BlocBuilder<LoadingblocBloc, LoadingblocState>(
                              builder: (context, state) {
                                if (state is CircularOtpPhoneState) {
                                  return const CircularProgressIndicator();
                                } else {
                                  return _RegisterButton(
                                    ontap: () {
                                      if (formKey.currentState!.validate()) {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child: OtpForgotPass(
                                                    phcontroller: phcontroller),
                                                type: PageTransitionType.fade));
                                      }
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          const RegisterDontHaveAccount()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}

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
