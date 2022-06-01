import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Presentation/First%20sessions/Reg%20or%20sign/RegOrsignPage.dart';
import 'package:readerclub/Presentation/User%20session/RegisterScreen/widget/widgets.dart';
import 'package:readerclub/logic/nav_bloc/bloc/navbloc_bloc.dart';
import 'package:readerclub/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import '../../User session/home screen/homescreen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  int pageindex = 0;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final PageController pageViewcontroller = PageController(initialPage: 0);
    return BlocListener<NavblocBloc, NavblocState>(
      listener: (context, state) {
        if (state is BackToRegorSignstate) {
          Navigator.push(
              context,
              PageTransition(
                  child: const RegOrSigninPage(),
                  type: PageTransitionType.fade));
        } else if (state is PrevPageViewState) {
          pageViewcontroller.previousPage(
              duration: const Duration(milliseconds: 700), curve: Curves.ease);
        } else if (state is NextPageViewState) {
          pageViewcontroller.nextPage(
              duration: const Duration(milliseconds: 700), curve: Curves.ease);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: formKey,
            child: ListView(
                physics: const ClampingScrollPhysics(
                    parent: NeverScrollableScrollPhysics()),
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(2.0.w),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            context
                                .read<NavblocBloc>()
                                .add(BackToRegOrSignEvent());
                          },
                        ),
                      )),
                  Center(
                      child: Text(
                    "Create New Account",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                  SizedBox(
                    height: 70.h,
                    child: PageView(
                      onPageChanged: (index) {
                        pageindex = index;
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      controller: pageViewcontroller,
                      children: [
                        CustomPageView(
                            firstvalidate: ((namevalue) {
                              if (namevalue.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            }),
                            secondvalidate: ((uservalue) {
                              if (uservalue.isEmpty) {
                                return 'Please enter Username';
                              }
                              return null;
                            }),
                            firstcontroller: nameController,
                            secondcontroller: usernameController,
                            textInputActionNext: TextInputAction.next,
                            textInputActionDone: TextInputAction.done,
                            hinttext1: "Name",
                            hinttext2: "Username",
                            lottie: "Assets/Register/register first.json"),
                        CustomPageView(
                            firstvalidate: ((mailvalue) {
                              if (mailvalue != null) {
                                if (mailvalue.length > 5 &&
                                    mailvalue.contains('@') &&
                                    mailvalue.endsWith('.com')) {
                                  return null;
                                }
                                return 'Enter a Valid Email Address';
                              }
                            }),
                            secondvalidate: ((numbervalue) {
                              if (numbervalue.length != 10) {
                                return 'Mobile Number must be of 10 digit';
                              }
                              return null;
                            }),
                            firstcontroller: emailController,
                            secondcontroller: phoneController,
                            hinttext1: "Email",
                            textInputActionNext: TextInputAction.next,
                            textInputActionDone: TextInputAction.done,
                            textinputtype: TextInputType.emailAddress,
                            textinputtypeNumber: TextInputType.number,
                            hinttext2: "Phone Number",
                            lottie: "Assets/Register/register second.json"),
                        CustomPageView(
                            firstvalidate: ((passwordvalue) {
                              if (passwordvalue.isEmpty) {
                                return 'Please enter some text';
                              }
                              if (passwordvalue.length < 5) {
                                return ' password Must be more than 4 charater';
                              }
                            }),
                            secondvalidate: ((confirmvalue) {
                              if (confirmvalue != passwordController.text) {
                                return "please enter same password";
                              }
                              if (confirmvalue == null) {
                                return "please confirm password";
                              }
                            }),
                            firstcontroller: passwordController,
                            secondcontroller: confirmPasswordController,
                            obscure: true,
                            textInputActionNext: TextInputAction.next,
                            textInputActionDone: TextInputAction.done,
                            hinttext1: "Password",
                            hinttext2: "Confirm Password",
                            lottie: "Assets/Register/register third.json")
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.w, left: 10.w),
                    child: Column(
                      children: [
                        BlocBuilder<NavblocBloc, NavblocState>(
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Builder(builder: (context) {
                                    return IconButton(
                                        onPressed: () {
                                          pageindex--;
                                          context
                                              .read<NavblocBloc>()
                                              .add(PrevPageViewEvent());
                                        },
                                        icon: const Icon(Icons.arrow_back));
                                  }),
                                ),
                                pageindex == 2
                                    // ? RegisterButton(formKey: formKey)
                                    ? Align(
                                        alignment: Alignment.bottomCenter,
                                        child: FadeInLeft(
                                          child: SizedBox(
                                            height: 10.h,
                                            child: Center(
                                              child: GestureDetector(
                                                onTap: () {
                                                  if (formKey.currentState!.validate()) {
                                                  registerationUser(context);
                                                  }
                                                },
                                                child: Container(
                                                  width: 30.w,
                                                  height: 6.h,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    gradient: LinearGradient(
                                                        colors: [
                                                          Color.fromRGBO(
                                                              166, 210, 255, 1),
                                                          Color.fromARGB(
                                                              255, 0, 139, 225)
                                                        ]),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "Register",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Align(
                                        alignment: Alignment.bottomRight,
                                        child: FadeInLeft(
                                          child: GestureDetector(
                                            onTap: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                context
                                                    .read<NavblocBloc>()
                                                    .add(NextPageViewEvent());
                                                pageindex++;
                                              } else {
                                                return;
                                              }
                                            },
                                            child: const PageViewNextButton(),
                                          ),
                                        ),
                                      ),
                              ],
                            );
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const SignInAlreadyAccount()
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Future registerationUser(BuildContext context) async {
    var apiUrl = Uri.parse("https://readerclub.store/api/auth/register");

    Map mapDatas = {
      "name": nameController.text,
      "username": usernameController.text,
      "email": emailController.text,
      "mobile": phoneController.text,
      "password": passwordController.text,
      "cpassword": confirmPasswordController.text,
    };
    print("JSON DATA ${mapDatas}");

    http.Response response = await http.post(apiUrl, body: mapDatas);
    if (response.statusCode == 200) {
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setBool(savedKey, true);
      var dataS = jsonDecode(response.body);

      print('DATAAS ${dataS}');
      
        Navigator.push(
          context,
          PageTransition(
            child: HomeScreen(),
            type: PageTransitionType.fade,
          ),
        );
      
    }
  }
}
