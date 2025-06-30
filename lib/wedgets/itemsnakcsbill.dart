
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:flutter/material.dart';

class itemSnacksbill extends StatelessWidget {
  const itemSnacksbill({
    super.key,
    required this.size,
    required this.imgurl,
    required this.title,
    required this.price,
    
    this.quantity,

 
  });

  final Size size;
  final String imgurl;
  final String title;
  final int price;
 

 
   final String? quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size.height * 0.01),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: border, width: 2),
          color: Kbackground,
          borderRadius: BorderRadius.circular(20),
        ),
        width: size.width * 0.95,
        height: size.height * 0.20,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(size.width * 0.02),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      imgurl,
                      width: size.width * 0.3,
                      height: size.height * 0.15,
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(size.height * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tittle : $title',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Price : $price.00 SYP ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        
                      ),
                        Text(
                        'quantity : $quantity',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: EdgeInsets.all(size.height * 0.0007),
            //   child: Divider(
            //     thickness: 1,
            //   ),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Text(
            //       "Cancel your selection",
            //       style: TextStyle(fontSize: 12.sp, color: Whitconst),
            //     ),
            //     IconButton(
                 
            //       icon: Icon(
            //         Icons.cancel_outlined,
            //         size: 20.sp,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}