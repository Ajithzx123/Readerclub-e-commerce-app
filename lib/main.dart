import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

import 'View/First sessions/Splash Screen/splash screen.dart';

const savedKey = "value is saved";
const onboardKey = "value is also saved";
void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return     GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        
      },
    );
  }
}
