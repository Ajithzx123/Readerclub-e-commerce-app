
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:readerclub/View/User%20session/home%20screen/custom%20widgets/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/BookCustom.dart';

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
              FadeInUp(child: CustomButtonHome())
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
              FadeInUp(child: CustomButtonHome())
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
              FadeInUp(child: CustomButtonHome())
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
              FadeInUp(child: CustomButtonHome())
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
              FadeInUp(child: CustomButtonHome())
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
