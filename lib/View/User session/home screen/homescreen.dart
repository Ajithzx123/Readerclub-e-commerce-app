
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Controller/HomeScreeenController.dart';
import 'package:readerclub/Model/Categories.dart';
import 'package:readerclub/Model/productModel.dart';
import 'package:readerclub/Model/shared_prefrences.dart';
import 'package:readerclub/View/User%20session/Book%20inside/insideBook.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/BookCustom.dart';
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
  late String categoryName;
  var logger = Logger();

  Map userDetails = {};

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);

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
    HomeScreenController controller = Get.put(HomeScreenController());
    return Scaffold(
      drawer: SideDrawer(),
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
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    "New offers from ReaderClub",
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 3.h),
                  const CustTextform(),
                  SizedBox(height: 3.h),

                  // carousel list here
                  FadeIn(child: const Carousel()),
                  SizedBox(height: 3.h),

                  // Tab bars list here

                  FutureBuilder<CategoriesModel>(
                      future: controller.categoriesApi(),
                      builder:
                          (context, AsyncSnapshot<CategoriesModel> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        CategoriesModel categorieslist = snapshot.data!;
                        return TabbarTabs(
                          tabController: _tabController,
                          tab:
                              List.generate(categorieslist.dt!.length, (index) {
                            String text = categorieslist.dt![index].category!;
                            categoryName = text.replaceFirst(
                                text[0], text[0].toUpperCase());
                            return Tab(
                              text: categoryName,
                            );
                          }),
                        );
                      }),
                  SizedBox(height: 3.h),

                  // tab bar view here

                  FutureBuilder<CategoriesModel>(
                    future: controller.categoriesApi(),
                    builder:
                        (context, AsyncSnapshot<CategoriesModel> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      CategoriesModel Categorieslist = snapshot.data!;
                      
                      return TabBarViews(
                        tabController: _tabController,
                        tabBarView: List.generate(
                          Categorieslist.dt!.length,
                          (index) {
                            return FutureBuilder<ProductsModel>(
                              builder: (context,
                                  AsyncSnapshot<ProductsModel> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                ProductsModel products = snapshot.data!;

                                return GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: products.dt!.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    // mainAxisSpacing: ,
                                    crossAxisSpacing: 5.w,
                                    childAspectRatio: 150 / 250,
                                  ),
                                  itemBuilder: (context, index) {

                                    return BookAndName(
                                      tap: () {
                                        Get.to(() => InsideBook(
                                            item: products.dt![index]));
                                      },
                                      image: products.dt![index].img!,
                                      name: products.dt![index].title!,
                                      amount:
                                          "???${products.dt![index].price!.toString()}",
                                    );
                                  },
                                );
                              },
                              future: controller.productsApi(
                                  Categorieslist.dt![index].category!),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
