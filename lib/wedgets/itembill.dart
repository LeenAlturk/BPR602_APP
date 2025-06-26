import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:flutter/material.dart';

class itemBookingSeatbill extends StatelessWidget {
  const itemBookingSeatbill({
    super.key,
    required this.size,
    required this.imgurl,
    required this.title,
    required this.price,
    this.quantity,
    this.date,
    this.Seat,
  });

  final Size size;
  final String imgurl;
  final String title;
  final int price;
  final String? date;
  final String? Seat;
  final String? quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size.height * 0.02),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: border, width:2),
          color: Kbackground,
          borderRadius: BorderRadius.circular(20),
        ),
        width: size.width * 0.9,
        height: size.height * 0.20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(size.width * 0.01),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      imgurl,
                      width: size.width * 0.3,
                      height: size.height * 0.15,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(size.height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       

                        Text(
                          'Title : $title',
                          style: TextStyle(
                             color: Ktext,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          'Price : $price.00 IQR',
                          style: TextStyle(
                            color: Ktext,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Date : $date',
                          style: TextStyle(
                             color: Ktext,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Seats : $Seat',
                          style: TextStyle(
                             color: Ktext,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
            //       onPressed: () {},
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
