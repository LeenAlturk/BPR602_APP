import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String ? imageUrl;
  final String? title;
  final String? genre;
  final double ?rating;

  const MovieCard({
    super.key,
     this.imageUrl,
     this.title,
     this.genre,
     this.rating,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.42,
      height: size.height * 0.4,
      decoration: BoxDecoration(
        color: ksmallActionColor,
        borderRadius: BorderRadius.circular(12),
     
        gradient: const LinearGradient(
          colors: [
            Color(0xFF303030), // Subtle gradient for a lighting effect
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
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  imageUrl!,
                  height: size.height * 0.25,
                  width: size.width * 0.48,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: size.height * 0.01,
                right: size.height * 0.01,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16.sp),
                       SizedBox(width: size.width * 0.025),
                      Text(
                        rating.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Movie Title
          Padding(
            padding:  EdgeInsets.all(size.height * 0.01),
            child: Text(
              title!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          // Movie Genre
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: size.width * 0.01),
            child: Text(
              genre!,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12.sp,
              ),
            ),
          ),
           SizedBox(height:size.height * 0.01),
        ],
      ),
    );
  }
}
