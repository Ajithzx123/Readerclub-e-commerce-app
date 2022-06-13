

// // import 'package:flutter/material.dart';
// // import 'package:sizer/sizer.dart';

// // class Snackbarss {
// //   final String name; 
// //     Snackbarss({required this.name});

  
// //   final error = SnackBar(
  
  
// //      duration: const Duration(seconds: 1),
// //     behavior: SnackBarBehavior.floating,
// //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
// //     content:  Text(
// //       "",
// //       style: TextStyle(
// //           fontFamily: "poppinz", fontSize: 15.sp, fontWeight: FontWeight.bold),
// //     ),
// //     backgroundColor: const Color.fromARGB(255, 141, 8, 8),
// //   );

// // }
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class CustomSnackbar extends StatelessWidget implements SnackBar {
//   final String name;
//   const CustomSnackbar({ required this.name, Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SnackBar(
  
  
//      duration: const Duration(seconds: 1),
//     behavior: SnackBarBehavior.floating,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
//     content:  Text(
//       name,
//       style: TextStyle(
//           fontFamily: "poppinz", fontSize: 15.sp, fontWeight: FontWeight.bold),
//     ),
//     backgroundColor: const Color.fromARGB(255, 141, 8, 8),
//   );
//   }

//   @override
//   // TODO: implement action
//   SnackBarAction? get action => throw UnimplementedError();

//   @override
//   // TODO: implement animation
//   Animation<double>? get animation => throw UnimplementedError();

//   @override
//   // TODO: implement backgroundColor
//   Color? get backgroundColor => throw UnimplementedError();

//   @override
//   // TODO: implement behavior
//   SnackBarBehavior? get behavior => throw UnimplementedError();

//   @override
//   // TODO: implement content
//   Widget get content => throw UnimplementedError();

//   @override
//   State<SnackBar> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }

//   @override
//   // TODO: implement dismissDirection
//   DismissDirection get dismissDirection => throw UnimplementedError();

//   @override
//   // TODO: implement duration
//   Duration get duration => throw UnimplementedError();

//   @override
//   // TODO: implement elevation
//   double? get elevation => throw UnimplementedError();

//   @override
//   // TODO: implement margin
//   EdgeInsetsGeometry? get margin => throw UnimplementedError();

//   @override
//   // TODO: implement onVisible
//   VoidCallback? get onVisible => throw UnimplementedError();

//   @override
//   // TODO: implement padding
//   EdgeInsetsGeometry? get padding => throw UnimplementedError();

//   @override
//   // TODO: implement shape
//   ShapeBorder? get shape => throw UnimplementedError();

//   @override
//   // TODO: implement width
//   double? get width => throw UnimplementedError();

//   @override
//   SnackBar withAnimation(Animation<double> newAnimation, {Key? fallbackKey}) {
//     // TODO: implement withAnimation
//     throw UnimplementedError();
//   }
// }