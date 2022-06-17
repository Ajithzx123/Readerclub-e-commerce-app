import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Controller/loginController.dart';
import 'package:readerclub/Model/shared_prefrences.dart';
import 'package:sizer/sizer.dart';
import 'custom widgets/Custom Tab bar.dart';
import 'custom widgets/SearchScreen.dart';
import 'custom widgets/carouselCustom.dart';
import 'custom widgets/side Drawer.dart';
import 'custom widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var currentindex = 0;
  late TabController _tabController;
  bool isopened = false;

//  late SharedPreferences sharedPreferences;
  Map userDetails = {};

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);

    userDetails = SharedPrefrenceModel.getString('userDetails');

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
        drawer: const SideDrawer(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(7.w),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // top icons here

                    const Topicons(),
                    SizedBox(height: 5.h),
                    Text(
                      "Hii ${userDetails['user']['name']} !",
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      "New offers from ReaderClub",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 3.h),
                    const CustTextform(),
                    SizedBox(height: 3.h),

                    // carousel list here
                    FadeIn(child: const Carousel()),
                    SizedBox(height: 3.h),
                    // Tab bars list here
                    TabbarTabs(tabController: _tabController),
                    SizedBox(height: 3.h),
                    // tab bar view here
                    TabBarViews(tabController: _tabController),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class CustTextform extends StatelessWidget {
  const CustTextform({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 204, 204, 204),
          borderRadius: BorderRadius.circular(10.w)),
      child: Padding(
        padding: EdgeInsets.only(left: 3.w),
        child: TextFormField(
          readOnly: true,
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: SearchScreen(), type: PageTransitionType.fade));
          },
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Search Book",
            fillColor: Colors.grey,
            focusColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}
