import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/View/User%20session/Categories/categorieList.dart';
import 'package:readerclub/View/User%20session/My%20Account/account.dart';
import 'package:readerclub/View/User%20session/Offers/Offers.dart';

import 'package:readerclub/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../../Model/shared_prefrences.dart';
import '../../../First sessions/Reg or sign/RegOrsignPage.dart';
import '../../../widgets/AlertdialogueCustom.dart';
import '../../../widgets/error.dart';
import '../../WishList/wishlist.dart';

class SideDrawer extends StatefulWidget {
  SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  
  var userDetails = SharedPrefrenceModel.getString('userDetails');

  var details = SharedPrefrenceModel.getString('details');

  @override
  Widget build(BuildContext context) {
    // UserController controller = Get.put(UserController());
    // print(userDetails["accessToken"]);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // padding: EdgeInsets.zero,
          // shrinkWrap: true,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // controller.userApi();
                  Get.to(AccountPage(), transition: Transition.cupertinoDialog);},
              child: SizedBox(
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
                        backgroundImage:  NetworkImage(details["dt"][0]["image"]
                            ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        userDetails["user"]["name"],
                       
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
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
              onTap: () => Get.to(CategoriesList()),
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
              onTap: () => {
                Navigator.push(
                    context,
                    PageTransition(
                        child: WishLists(), type: PageTransitionType.fade))
              },
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
              onTap: () => {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const OfferPage(),
                        type: PageTransitionType.fade))
              },
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
              onTap: () => {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const ErrorPage(),
                        type: PageTransitionType.fade))
              },
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
              onTap: () => {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const ErrorPage(),
                        type: PageTransitionType.fade))
              },
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
              onTap: () => {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertPopUp(
                        title: "Logout",
                        description: "Do you want to Logout",
                        leftontap: () {
                          sharedprefLogout(context);
                        },
                        leftButton: "Yes",
                        rightbutton: "No",
                        rightontap: () {
                          Navigator.of(context).pop();
                        },
                      );
                    })
              },
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
  sharedPreferences.setBool(savedKey, false);
  Navigator.pushAndRemoveUntil(
      context,
      PageTransition(child: RegOrSigninPage(), type: PageTransitionType.fade),
      (route) => false);
}
