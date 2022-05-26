import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Presentation/First%20page/RegOrsignPage.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Column(
     
        children: [ 
           Center(child: Text("Create New Account",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.black),)),
          SizedBox(
            height: 60.h,
            child: PageView(
              scrollDirection: Axis.horizontal,
            controller: controller,
            children: [
              Column(
                children: [
                 Column(
                   children: [
                     LottieBuilder.asset("Assets/Register/register first.json"),
                     TextFormField()
                    
                   ],
                 )
                ],
              ),
            ],
        ),
          ),
                         Text("hai",style: TextStyle(color: Colors.black),)

        ]
      ),
    );
  }
}