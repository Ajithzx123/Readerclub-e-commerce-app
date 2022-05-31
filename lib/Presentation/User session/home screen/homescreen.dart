import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:readerclub/Presentation/User%20session/home%20screen/widgets.dart';

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

class TabBarViews extends StatelessWidget {
  const TabBarViews({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          Center(
              child: Column(
                children: [
                  Row(
            children: [
                  FadeInLeft(
                    child: const BookAndName(
                        image:
                            "https://i.pinimg.com/originals/6b/34/d7/6b34d7e6e6e6a4f177d135abb6426c68.jpg",
                        name: "Romeo & Juliet",
                        amount: "₹549.00"),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  FadeInRight(
                    child: const BookAndName(
                        image:
                            "https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781476792491/after-we-collided-9781476792491_hr.jpg",
                        name: "After",
                        amount: "₹999.00"),
                  ),
            ],
          ),
          FadeInUp(child: CustomButtonHome(onPressed: (){}))
                ],
              )),
          Center(
              child: Column(
                children: [
                  Row(
            children: [
                  FadeInLeft(
                    child: const BookAndName(
                        image:
                            "https://images-na.ssl-images-amazon.com/images/I/816NlEQFMOL.jpg",
                        name: "Life Of Pi",
                        amount: "₹699.00"),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  FadeInRight(
                    child: const BookAndName(
                        image:
                            "https://mspalas.weebly.com/uploads/1/3/2/0/13208827/3664890.jpg",
                        name: "The Giver",
                        amount: "₹549.00"),
                  ),
            ],
          ),
                    FadeInUp(child: CustomButtonHome(onPressed: (){}))

                ],
              )),
          Center(
              child: Column(
                children: [
                  Row(
            children: [
                  FadeInLeft(
                    child: const BookAndName(
                        image:
                            "https://images-na.ssl-images-amazon.com/images/I/61zG02r3qCL.jpg",
                        name: "IT",
                        amount: "₹749.00"),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  FadeInRight(
                    child: const BookAndName(
                        image:
                            "https://kbimages1-a.akamaihd.net/9541dc73-a03c-433d-9e2c-9fba5ff67ea5/1200/1200/False/dracula-173.jpg",
                        name: "Dracula",
                        amount: "₹549.00"),
                  ),
            ],
          ),
                    FadeInUp(child: CustomButtonHome(onPressed: (){}))

                ],
              )),
          Center(
              child: Column(
                children: [
                  Row(
            children: [
                  FadeInLeft(
                    child: const BookAndName(
                        image:
                            "https://i.pinimg.com/originals/6b/34/d7/6b34d7e6e6e6a4f177d135abb6426c68.jpg",
                        name: "Romeo & Juliet",
                        amount: "₹549.00"),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  FadeInRight(
                    child: const BookAndName(
                        image:
                            "https://i.pinimg.com/originals/6b/34/d7/6b34d7e6e6e6a4f177d135abb6426c68.jpg",
                        name: "Romeo & Juliet",
                        amount: "₹549.00"),
                  ),
            ],
          ),
                    FadeInUp(child: CustomButtonHome(onPressed: (){}))

                ],
              )),
          Center(
              child: Column(
                children: [
                  Row(
            children: [
                  FadeInLeft(
                    child: const BookAndName(
                        image:
                            "https://i.pinimg.com/originals/6b/34/d7/6b34d7e6e6e6a4f177d135abb6426c68.jpg",
                        name: "Romeo & Juliet",
                        amount: "₹549.00"),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  FadeInRight(
                    child: const BookAndName(
                        image:
                            "https://i.pinimg.com/originals/6b/34/d7/6b34d7e6e6e6a4f177d135abb6426c68.jpg",
                        name: "Romeo & Juliet",
                        amount: "₹549.00"),
                  ),
            ],
          ),
                    FadeInUp(child: CustomButtonHome(onPressed: (){}))

                ],
              )),
          Center(
            child: Text(
              'Fantasy',
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabbarTabs extends StatelessWidget {
  const TabbarTabs({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0.w,
        ),
      ),
      child: TabBar(
        isScrollable: true,
        automaticIndicatorColorAdjustment: true,
        controller: _tabController,
        indicatorPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w), color: Colors.black),
        labelColor: Colors.white,
        labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        unselectedLabelColor: Colors.black,
        unselectedLabelStyle:
            TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
        tabs: const [
          Tab(
            text: 'Romance',
          ),
          Tab(
            text: 'Fiction',
          ),
          Tab(
            text: 'Horror',
          ),
          Tab(
            text: 'Fantasy',
          ),
          Tab(
            text: 'Fantasy',
          ),
          Tab(
            text: 'Fantasy',
          ),
        ],
      ),
    );
  }
}

class Topicons extends StatelessWidget {
  const Topicons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FadeInRight(
          child: GestureDetector(
              onTap: (() {}),
              child: Icon(
                Icons.sort,
                size: 8.w,
              )),
        ),
        FadeInLeft(
          child: GestureDetector(
              onTap: (() {}),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 8.w,
              )),
        ),
      ],
    );
  }
}

class Carousel extends StatelessWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [
          Container(
            width: 100.w,
            height: 15.h,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1497633762265-9d179a990aa6?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Ym9va3N8ZW58MHx8MHx8&auto=format&fit=crop&w=500"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            width: 100.w,
            height: 15.h,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1531988042231-d39a9cc12a9a?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            width: 100.w,
            height: 15.h,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1471970471555-19d4b113e9ed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),
                  fit: BoxFit.cover),
            ),
          ),
        ],
        options: CarouselOptions(
            initialPage: 0,
            autoPlay: true,
            enableInfiniteScroll: true,
            // viewportFraction: 1,
            // autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale));
  }
}
