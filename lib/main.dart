import 'package:flutter/material.dart';
import 'package:readerclub/Presentation/First%20page/Splash%20Screen/splash%20screen.dart';
import 'package:sizer/sizer.dart';

void main(List<String> args) {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {  
     return  const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );},
    );
  }
}