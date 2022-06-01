
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Presentation/First%20sessions/Reg%20or%20sign/RegOrsignPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

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