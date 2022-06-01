import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:readerclub/Presentation/User%20session/home%20screen/custom%20widgets/widgets.dart';

import 'package:sizer/sizer.dart';

import 'custom widgets/Custom Tab bar.dart';
import 'custom widgets/carouselCustom.dart';
import 'custom widgets/side Drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var currentindex = 0;
  late TabController _tabController;
  bool isopened = false;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideDrawer(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(7.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top icons here
                const Topicons(),
                SizedBox(height: 5.h),
                Text(
                  "Hi Ajith!",
                  style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 1.h),
                Text(
                  "New offers from ReaderClub",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 4.h),
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
        ));
  }
}
