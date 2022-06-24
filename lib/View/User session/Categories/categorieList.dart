import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:readerclub/Model/Categories.dart';
import 'package:readerclub/View/User%20session/Categories/Categories.dart';
import 'package:readerclub/api/Categories.dart';
import 'package:sizer/sizer.dart';

import '../../../Controller/HomeScreeenController.dart';

class CategoriesList extends StatelessWidget {
  CategoriesList({Key? key}) : super(key: key);
  late String categoryName;

  @override
  Widget build(BuildContext context) {
            HomeScreenController controller = Get.put(HomeScreenController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black)),
      body: Column(
        children: [
          Lottie.asset("Assets/category.json"),
          Expanded(
              child: FutureBuilder<CategoriesModel>(
            future: controller.categoriesApi(),
            builder: (context, AsyncSnapshot<CategoriesModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              CategoriesModel list = snapshot.data!;

              return ListView.separated(
                  padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
                  separatorBuilder: (context, index) => SizedBox(height: 4.h),
                  itemCount: list.dt!.length,
                  itemBuilder: ((context, index) {
                    String text = list.dt![index].category!;
                    categoryName =
                        text.replaceFirst(text[0], text[0].toUpperCase());

                    return CategoryList(
                      name: categoryName,
                      tap: () => Get.to(CategoriesPage(
                        value: list.dt![index],
                      )),
                    );
                  }));
            },
          )),
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final VoidCallback tap;
  final String name;
  const CategoryList({
    required this.name,
    required this.tap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w),
      child: GestureDetector(
        onTap: tap,
        child: Container(
          height: 9.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19.w),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(blurRadius: 5),
              ]),
          child: Center(
              child: Text(
            name,
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
