import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
         const   Spacer(),
           const Expanded(
              flex:1,
              child: Text("No books found"),
            ),
          ],
        ),
      )),
    );
  }
}
