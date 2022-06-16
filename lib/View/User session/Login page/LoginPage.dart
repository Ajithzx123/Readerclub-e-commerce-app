import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Controller/login.dart';
import 'package:readerclub/View/User%20session/Login%20page/widget/widgets.dart';
import 'package:sizer/sizer.dart';
import '../../First sessions/Reg or sign/RegOrsignPage.dart';
import '../../widgets/textfromWidget.dart';
import 'Forget Password/forgotPassword.dart';
import 'OtpLogin/phoneLogin.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
 
  //  bool progress =false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
  
    return Scaffold(
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
                      Get.to(() => RegOrSigninPage());
                    },
                  )),
            ),
            Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: GetBuilder<LoginController>(builder: (controller) {
                  return Form(
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
                            controller: controller.usernamecontroller,
                            hinttext: "Username",
                            labeltext: 'Username',
                          ),
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
                            controller: controller.passwordcontroller,
                            hinttext: "Password",
                            labeltext: 'Password',
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Align(
                          alignment: Alignment.topRight,
                          child: FadeInRight(
                            child: GestureDetector(
                              onTap: () {
                                Get.to(ForgetPassPhone());
                              },
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
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
                                  controller.loginData();
                                }
                              },
                              colours: const [
                                Color.fromRGBO(166, 210, 255, 1),
                                Color.fromARGB(255, 0, 139, 225)
                              ],
                            ),
                          ),
                        ),
                        //

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
                  );
                })),
          ],
        ),
      )),
    );

//   Future LoginData(BuildContext context) async {
//     var apiData = Uri.parse("https://readerclub.store/api/auth/login");

//     Map mapdatas = {
//       "username": usernamecontroller.text,
//       "password": passwordcontroller.text,
//     };
//     try {
//       http.Response response = await http.post(apiData, body: mapdatas);
//               var jsondata = jsonDecode(response.body);
//                       print("..................................haiiii$jsondata");

// if(jsondata['user']!=null){
//   throw HttpException(jsondata[""]);
// }
//       if (response.statusCode == 200) {
//         final SharedPreferences sharedPreferences =
//             await SharedPreferences.getInstance();
//         sharedPreferences.setBool(savedKey, true);
//         context
//             .read<LoadingblocBloc>()
//             .add(CircularLoadingEvent(isLoading: false));

//         context.read<NavblocBloc>().add(NavToHomeScrenEvent());
//         return UserDetails.fromJson(jsonDecode(response.body));
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           duration: const Duration(seconds: 1),
//     behavior: SnackBarBehavior.floating,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
//     content:  Text(
//       response.body.toString(),
//       style: TextStyle(
//           fontFamily: "poppinz", fontSize: 15.sp, fontWeight: FontWeight.bold),
//     ),
//     backgroundColor: const Color.fromARGB(255, 141, 8, 8),
//          ));
//          context
//             .read<LoadingblocBloc>()
//             .add(CircularLoadingEvent(isLoading: false));
//         print(
//             "..................................helloooo${response.body.toString()}");
//       }
//     } catch (e) {}
//   }
  }
}
