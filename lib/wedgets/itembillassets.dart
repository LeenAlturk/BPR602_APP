

import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:flutter/material.dart';

class itembillassets extends StatelessWidget {
  const itembillassets({
    super.key,
    required this.size,
    required this.imgurl,
    required this.title,
    required this.price,
  });

  final Size size;
  final String imgurl;
  final String title;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size.height * 0.02),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Whitconst, width: 0.3),
          color: Kbackground,
          borderRadius: BorderRadius.circular(20),
        ),
        width: size.width * 0.9,
        height: size.height * 0.28,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(size.height * 0.007),
                  child: Image.asset(
                    imgurl,
                    width: size.width * 0.3,
                    height: size.height * 0.15,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(size.height * 0.007),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$price.00 SAR',
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
            Padding(
              padding: EdgeInsets.all(size.height * 0.007),
              child: Divider(
                thickness: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "To cancel remind me 30 minutes ago",
                  style: TextStyle(fontSize: 12.sp, color: Whitconst),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.cancel_outlined,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
