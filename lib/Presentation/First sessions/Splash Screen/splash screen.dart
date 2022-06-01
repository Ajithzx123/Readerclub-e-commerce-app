import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Presentation/First%20sessions/Onboarding%20Screen/onboarding_Screen.dart';
import 'package:readerclub/Presentation/First%20sessions/Reg%20or%20sign/RegOrsignPage.dart';
import 'package:readerclub/Presentation/User%20session/home%20screen/homescreen.dart';
import 'package:readerclub/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  
  Future getdata() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final value = sharedPreferences.getBool(savedKey);
    if(value == true){
      navtomain();
    }else{
      navtoREgOrSign();
    }
  }
@override
  void initState() {
getdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:  LottieBuilder.asset("Assets/splash logo.json"),
          ),
          GradientText("READER CLUB", colors: const [
            Color.fromARGB(255, 160, 123, 173),
            Color.fromARGB(255, 24, 79, 124)
          ],style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.sp),)
        ],
      )),
    );
    
}
Future navtomain() async{
    Future.delayed(Duration(seconds: 3),(){
        Navigator.pushAndRemoveUntil(context, PageTransition(child: HomeScreen() ,type:PageTransitionType.fade ), (route) => false);
      });
  }
  Future navtoREgOrSign() async{
    Future.delayed(Duration(seconds: 3),(){
        Navigator.pushAndRemoveUntil(context, PageTransition(child: RegOrSigninPage() ,type:PageTransitionType.fade ), (route) => false);
      });
  }
}