import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Presentation/First%20sessions/Reg%20or%20sign/RegOrsignPage.dart';
import 'package:readerclub/logic/nav_bloc/bloc/navbloc_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class BookAndName extends StatelessWidget {
  final String image;
  final String name;
  final String amount;

  const BookAndName({
    Key? key,
    required this.image,
    required this.name,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 40.w,
        height: 30.h,
        child: Column(
          children: [
            Container(
              width: 35.w,
              height: 21.h,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      image: NetworkImage(
                        image,
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(5.w)),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: .5.h,
            ),
            Text(
              amount,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54),
            )
          ],
        ));
  }
}

class CustomButtonHome extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomButtonHome({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 33.w,
      height: 5.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 140, 140, 140),
                Color.fromARGB(255, 9, 9, 9)
              ])),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          "View All",
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
      ),
    );
  }
}

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // padding: EdgeInsets.zero,
          // shrinkWrap: true,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30.h,
              child: DrawerHeader(
                margin: EdgeInsets.only(bottom: 2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 10.w,
                      backgroundColor: Colors.red,
                      backgroundImage: const NetworkImage(
                          "https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDZ8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Ajith Kumar',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.format_list_bulleted_sharp,
                color: Colors.black,
              ),
              title: Text(
                'Categories',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
              ),
              onTap: () => {},
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite,
                color: Colors.black,
              ),
              title: Text(
                'Whishlist',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: const Icon(
                Icons.local_offer_sharp,
                color: Colors.black,
              ),
              title: Text(
                'Offers',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
              title: Text(
                'My cart',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: const Icon(
                Icons.account_box,
                color: Colors.black,
              ),
              title: Text(
                'About',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
            Spacer(),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
              ),
              onTap: () => {sharedprefLogout(context)},
            ),
          ],
        ),
      ),
    );
  }
}

Future sharedprefLogout(BuildContext context) async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sharedPreferences.clear();
  Navigator.pushAndRemoveUntil(
      context,
      PageTransition(child: RegOrSigninPage(), type: PageTransitionType.fade),
      (route) => false);
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
              onTap: (() {
                Scaffold.of(context).openDrawer();
              }),
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
              FadeInUp(child: CustomButtonHome(onPressed: () {}))
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
              FadeInUp(child: CustomButtonHome(onPressed: () {}))
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
              FadeInUp(child: CustomButtonHome(onPressed: () {}))
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
              FadeInUp(child: CustomButtonHome(onPressed: () {}))
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
              FadeInUp(child: CustomButtonHome(onPressed: () {}))
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
