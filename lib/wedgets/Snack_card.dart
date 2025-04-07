
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:flutter/material.dart';

class SnackCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int price;

  const SnackCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.42,
      //height: size.height * 0.5,
         decoration: BoxDecoration(
        color: ksmallActionColor,
        borderRadius: BorderRadius.circular(12),
     
        gradient: const LinearGradient(
          colors: [
            Color(0xFF303030), 
            ksmallActionColor
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              height: size.height * 0.25,
              width: size.width * 0.48,
              fit: BoxFit.cover,
            ),
          ),

          // snack Title
          Padding(
            padding:  EdgeInsets.all( size.height * 0.01),
            child: Text(
              title,
              style:  TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
          ),
          // Movie Genre
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:  size.width * 0.01),
            child: Text(
              price.toString(),
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12.sp,
              ),
            ),
          ),
           SizedBox(height:  size.height * 0.01),
        ],
      ),
    );
  }
}
