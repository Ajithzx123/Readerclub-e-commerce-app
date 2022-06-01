import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Presentation/User%20session/home%20screen/homescreen.dart';
import 'package:readerclub/Presentation/widgets/textfromWidget.dart';
import 'package:readerclub/logic/nav_bloc/bloc/navbloc_bloc.dart';
import 'package:sizer/sizer.dart';

class CustomPageView extends StatelessWidget {
  final TextEditingController firstcontroller;
  final TextEditingController secondcontroller;
  final String hinttext1;
  final String hinttext2;
  final String lottie;
  final bool? obscure;
  final FormFieldValidator firstvalidate;
  final FormFieldValidator secondvalidate;
  final TextInputType? textinputtypeNumber;
  final TextInputType? textinputtype;
  final TextInputAction textInputActionNext;
  final TextInputAction textInputActionDone;

  CustomPageView({
    Key? key,
    this.textinputtypeNumber,
    this.obscure,
    this.textinputtype,
    required this.firstvalidate,
    required this.secondvalidate,
    required this.textInputActionDone,
    required this.textInputActionNext,
    required this.firstcontroller,
    required this.secondcontroller,
    required this.hinttext1,
    required this.hinttext2,
    required this.lottie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInRight(child: LottieBuilder.asset(lottie)),
        Padding(
          padding: EdgeInsets.only(left: 13.w, right: 13.w),
          child: FadeInLeft(
            child: CustomText(
              validator: firstvalidate,
              textinputtype: textinputtype,
              obscure: obscure,
              controller: firstcontroller,
              hinttext: hinttext1,
              textinputaction: textInputActionNext,
            ),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 13.w, right: 13.w),
          child: FadeInRight(
              child: CustomText(
            validator: secondvalidate,
            textinputtype: textinputtypeNumber,
            obscure: obscure,
            controller: secondcontroller,
            hinttext: hinttext2,
            textinputaction: textInputActionDone,
          )),
        )
      ],
    );
  }
}

class PageViewNextButton extends StatelessWidget {
  const PageViewNextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 15.w,
        height: 10.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(166, 210, 255, 1),
            Color.fromARGB(255, 0, 139, 225)
          ]),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
          size: 13.sp,
        ));
  }
}

// class RegisterButton extends StatelessWidget {
//   const RegisterButton({
//     Key? key,
//     required this.formKey,
//   }) : super(key: key);

//   final GlobalKey<FormState> formKey;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: FadeInLeft(
//         child: SizedBox(
//           height: 10.h,
//           child: Center(
//             child: GestureDetector(
//               onTap: () {


//                 registerationUser();


//                 if (formKey.currentState!.validate()) {
//                   Navigator.push(
//                     context,
//                     PageTransition(
//                       child: HomeScreen(),
//                       type: PageTransitionType.fade,
//                     ),
//                   );
//                 }
//               },
//               child: Container(
//                 width: 30.w,
//                 height: 6.h,
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                   gradient: LinearGradient(colors: [
//                     Color.fromRGBO(166, 210, 255, 1),
//                     Color.fromARGB(255, 0, 139, 225)
//                   ]),
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Register",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 13.sp,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void registerationUser() {

//     var apiurl ="";

//     Map mapData =  {
//       "name": namecontroller
//     } 



//   }
// }

class SignInAlreadyAccount extends StatelessWidget {
  const SignInAlreadyAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "Already have an Account? ",
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          TextSpan(
              text: "Sign In",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = (() {
                 context.read<NavblocBloc>().add(NavToSignInScreenEvent());
                }))
        ]),
      ),
    );
  }
}
