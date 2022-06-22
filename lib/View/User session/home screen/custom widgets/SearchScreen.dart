import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readerclub/Model/productModel.dart';
import 'package:readerclub/api/productSearch.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/BookCustom.dart';
import '../../Book inside/insideBook.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(5.0.w),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 204, 204, 204),
                  borderRadius: BorderRadius.circular(10.w)),
              child: Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: TextFormField(
                  controller: searchController,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Book",
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h,),
           
            SingleChildScrollView(
              child: SizedBox(
                  width: double.maxFinite,
              height: 74.h,
                child: FutureBuilder<ProductsModel>(
                    future: searchApi(searchController.text),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      else if(snapshot.connectionState == ConnectionState.none){
                        return const Text("No books found");
                      }
                      ProductsModel search = snapshot.data!;
                      
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: search.dt!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, 
                          mainAxisSpacing: 0.h,
                          crossAxisSpacing: 5.w,
                          childAspectRatio: 150 / 250,
                        ),
                        itemBuilder: (context, index) {
                          return BookAndName(
                            tap: () {
                              Get.to(() => InsideBook(item: search.dt![index]));
                            },
                            image: search.dt![index].img!,
                            name: search.dt![index].title!,
                            amount: "₹${search.dt![index].price!.toString()}",
                          );
                        },
                      );
                    }),
              ),
            )
          ],
        ),
      )),
    );
  }
}
