import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:readerclub/Presentation/User%20session/home%20screen/widgets.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var currentindex = 0;
  late TabController _tabController;
  bool isopened = false;

   final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

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
      drawer: SideDrawer(),
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(7.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Topicons(),
            SizedBox(height: 5.h),
            Text(
              "Hi Ajith!",
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 1.h),
            Text(
              "New offers from ReaderClub",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4.h),
            FadeIn(child: const Carousel()),
            SizedBox(
              height: 3.h,
            ),
            TabbarTabs(tabController: _tabController),
            SizedBox(height: 3.h,),
            // tab bar view here
            TabBarViews(tabController: _tabController),
            
          ],
        ),
      ),
    ));
  }
}
