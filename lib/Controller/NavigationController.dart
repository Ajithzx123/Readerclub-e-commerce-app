import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:readerclub/View/First%20sessions/Onboarding%20Screen/onboarding_Screen.dart';
import 'package:readerclub/View/First%20sessions/Reg%20or%20sign/RegOrsignPage.dart';
import 'package:readerclub/View/User%20session/home%20screen/homescreen.dart';
import 'package:readerclub/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationController extends GetxController {
  @override
  void onInit() {
    getdata();
    super.onInit();
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;
      if(notification != null && android != null){
        flutterLocalNotificationsPlugin.show(notification.hashCode, notification.title, notification.body, NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,channelDescription: channel.description,color: Colors.blue,playSound: true,)
        ));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      print("A new onMessageOpenedApp event was published");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if(notification != null && android != null){
       Get.dialog(Title(color: Colors.blue, child: Text(notification.body!)));
      }
    });
  }

  void getdata() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final value = sharedPreferences.getBool(savedKey);
    final onboardvalue = sharedPreferences.getBool(onboardKey);
    if (value == true) {
      navtomain();
    } else if (onboardvalue == true) {
      navtoREgOrSign();
    } else {
      navtoOnboard();
    }
  }

  navtomain() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll( const HomeScreen(),
          transition: Transition.fade,
          duration: const Duration(milliseconds: 700));
    });
  }

  navtoREgOrSign() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(const RegOrSigninPage(),
          transition: Transition.fade,
          duration: const Duration(milliseconds: 700));
    });
  }

  navtoOnboard() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(onboardKey, true);

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(const OnboardingScreen(),
          transition: Transition.fade,
          duration: const Duration(milliseconds: 700));
    });
  }
}
