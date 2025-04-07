import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:flutter/material.dart';

class SeeallSnacksCard extends StatelessWidget {
  final String title;
  final String imgurl;
  final int price;
  final String desc;

  const SeeallSnacksCard({
    super.key,
    required this.imgurl,
    required this.title,
    required this.price,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width ,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        color: Kbackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12), bottom: Radius.circular(12)),
            child: Image.network(
              imgurl,
              height: size.height * 0.32,
              width: size.width * 0.36,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
              padding: EdgeInsets.all(size.width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: kbutton,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  _buildRow("Unit Price:", price.toString(), size.width * 0.01),
                  SizedBox(height: size.height * 0.01),
                  Container(
                    width: size.width * 0.5, 
                    child: Text(
                      desc,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 80, // Adjust width for alignment
          child: Text(
            label,
            style: TextStyle(
                color: Ktext,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: size),
        Text(
          value,
          style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
