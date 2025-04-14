import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppConstants {
  static FToast fToast = FToast();

  // static void showToast(
  //   BuildContext context,
  //   String text, {
  //   bool gradient = false,
  // }) {
  //   fToast.init(context);
  //   Widget toast = Padding(
  //     padding:  EdgeInsets.symmetric(horizontal: 20),
  //     child: Container(
  //       width: MediaQuery.of(context).size.width / 1.1,
  //       decoration: BoxDecoration(
  //         color: const Color.fromARGB(255, 36, 43, 71),
  //         borderRadius: BorderRadius.circular(12), // Increased radius for more rounded effect
  //         gradient: gradient
  //             ? LinearGradient(
  //                 begin: Alignment.topLeft,
  //                 end: Alignment.bottomRight,
  //                 colors: [
  //                   const Color.fromARGB(255, 39, 49, 104),
  //                   ksmallActionColor,
  //                 ],
  //               )
  //             : null,
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black.withOpacity(0.3),
  //             offset: Offset(0, 10),
  //             blurRadius: 10,
  //             spreadRadius: 2,
  //           ),
  //           BoxShadow(
  //             color: Colors.white.withOpacity(0.2),
  //             offset: Offset(0, -2),
  //             blurRadius: 6,
  //           ),
  //         ], 
  //       ),
  //       child: Center(
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Row(
  //                 children: [
  //                   Text(
  //                     text,
                     
  //                     style: TextStyle(
                        
  //                       color: Colors.white,
  //                       fontSize: 13.sp,
  //                       fontWeight: FontWeight.normal,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  //   fToast.showToast(
  //     child: toast,
  //     gravity: ToastGravity.SNACKBAR,
  //     toastDuration: const Duration(seconds: 2),
  //   );
  // }
 static void showToast(
  BuildContext context,
  String text, {
  bool gradient = false,
  IconData icon = Icons.warning,
  Color iconcolor = Colors.amber,
}) {
  fToast.init(context);
  Widget toast = Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 36, 43, 71),
        borderRadius: BorderRadius.circular(12),
        gradient: gradient
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color.fromARGB(255, 39, 49, 104),
                  ksmallActionColor,
                ],
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(0, 10),
            blurRadius: 10,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            offset: Offset(0, -2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Icon(icon, color: iconcolor,),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 4),
  );
}

}
