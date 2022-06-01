import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'package:readerclub/Presentation/First%20sessions/Reg%20or%20sign/RegOrsignPage.dart';
import 'package:readerclub/Presentation/User%20session/Login%20page/widget/widgets.dart';
import 'package:readerclub/Presentation/User%20session/home%20screen/homescreen.dart';
import 'package:readerclub/Presentation/widgets/textfromWidget.dart';
import 'package:readerclub/logic/nav_bloc/bloc/navbloc_bloc.dart';
import 'package:readerclub/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import 'OtpLogin/phoneLogin.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavblocBloc, NavblocState>(
      listener: (context, state) {
        if (state is BackToRegorSignstate) {
          Navigator.push(
            context,
            PageTransition(
                child: const RegOrSigninPage(), type: PageTransitionType.fade),
          );
        } else if (state is NavToHomeScreenState) {
          Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                  child: HomeScreen(), type: PageTransitionType.fade),
              (route) => false);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          context
                              .read<NavblocBloc>()
                              .add(BackToRegOrSignEvent());
                        },
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: FadeInLeft(
                            child: LottieBuilder.asset(
                              "Assets/login/ideabook.json",
                              height: 25.h,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        FadeInRight(
                          child: Text(
                            "Welcome Back",
                            style: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.w900),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        FadeInLeft(
                          child: CustomText(
                              validator: ((uservalue) {
                                if (uservalue.isEmpty) {
                                  return 'Please enter Username';
                                }
                                return null;
                              }),
                              textinputaction: TextInputAction.next,
                              textinputtype: TextInputType.name,
                              obscure: false,
                              controller: usernamecontroller,
                              hinttext: "Username"),
                        ),
                        SizedBox(height: 2.h),
                        FadeInRight(
                          child: CustomText(
                              validator: ((passwordvalue) {
                                if (passwordvalue.isEmpty) {
                                  return 'Please enter some text';
                                }
                                if (passwordvalue.length < 5) {
                                  return ' password Must be more than 4 charater';
                                }
                              }),
                              textinputaction: TextInputAction.done,
                              textinputtype: TextInputType.name,
                              obscure: true,
                              controller: passwordcontroller,
                              hinttext: "Password"),
                        ),
                        SizedBox(height: 1.h),
                        Align(
                          alignment: Alignment.topRight,
                          child: FadeInRight(
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Center(
                          child: FadeInLeft(
                            child: CustombuttonLogin(
                              iconcolor: Colors.white,
                              cusIcons: Icons.login,
                              textcolor: Colors.white,
                              width: 35.w,
                              text: "Sign In",
                              onpressed: () {
                                if (formKey.currentState!.validate()) {
                                  LoginData(context);
                                }
                              },
                              colours: const [
                                Color.fromRGBO(166, 210, 255, 1),
                                Color.fromARGB(255, 0, 139, 225)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Center(
                            child: FadeInLeft(
                          child: Text(
                            "OR",
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                        )),
                        SizedBox(height: 2.h),
                        Center(
                          child: FadeInRight(
                            child: CustombuttonLogin(
                                cusIcons: Icons.phone_iphone,
                                iconcolor: Colors.black,
                                textcolor: Colors.black,
                                width: 70.w,
                                text: "Sign In with Phone Number",
                                onpressed: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: PhoneLogin(),
                                          type: PageTransitionType.fade));
                                },
                                colours: const [
                                  Color.fromARGB(255, 222, 222, 222),
                                  Color.fromARGB(255, 227, 227, 227)
                                ]),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        const RegisterDontHaveAccount(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future LoginData(BuildContext context) async {
    var apiData = Uri.parse("https://readerclub.store/api/auth/login");

    Map mapdatas = {
      "username": usernamecontroller.text,
      "password": passwordcontroller.text,
    };

    http.Response response = await http.post(apiData, body: mapdatas);
    if (response.statusCode == 200) {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(savedKey, true);
      var JSONDATA = jsonDecode(response.body);
      print("${JSONDATA}");

      context.read<NavblocBloc>().add(NavToHomeScrenEvent());
    } else {
      print("No user found");
    }
  }
}
