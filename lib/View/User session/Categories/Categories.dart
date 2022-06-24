import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readerclub/Model/Categories.dart';

import 'package:sizer/sizer.dart';

import '../../../Controller/HomeScreeenController.dart';
import '../../../Model/productModel.dart';
import '../../../api/Products.dart';
import '../../widgets/BookCustom.dart';
import '../Book inside/insideBook.dart';

class CategoriesPage extends StatelessWidget {
  final Dt value;
  const CategoriesPage({required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
            HomeScreenController controller = Get.put(HomeScreenController());

    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(5.w),
            child: GestureDetector(
              child: const Icon(Icons.arrow_back),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Column(children: [
            Center(
                child: Text(
              value.category!.replaceFirst(
                  value.category![0], value.category![0].toUpperCase()),
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w900),
            )),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 5.5.h,
              width: 85.w,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 195, 195, 195),
                borderRadius: BorderRadius.circular(10.w),
              ),
              child: Padding(
                padding: EdgeInsets.all(2.0.w),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search here',
                  ),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 3.h,
          ),
          Expanded(
            child: SingleChildScrollView(
                child: FutureBuilder<ProductsModel>(
              builder: (context, AsyncSnapshot<ProductsModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                ProductsModel productsL = snapshot.data!;

                return GridView.builder(
                  shrinkWrap: true,
                  itemCount: productsL.dt!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // mainAxisSpacing: ,
                    // crossAxisSpacing: 2.w,
                    childAspectRatio: 150 / 200,
                  ),
                  itemBuilder: (context, index) {
                    return BookAndName(
                      tap: () {
                        Get.to(() => InsideBook(item: productsL.dt![index]));
                      },
                      image: productsL.dt![index].img!,
                      name: productsL.dt![index].title!,
                      amount: "₹${productsL.dt![index].price!.toString()}",
                    );
                  },
                );
              },
              future: controller. productsApi(value.category!),
            )),
          ),
        ],
      )),
    );
  }
}
