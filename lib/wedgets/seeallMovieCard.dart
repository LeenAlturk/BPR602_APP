
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:flutter/material.dart';

// class SeeallMovieCard extends StatelessWidget {
//   final String title;
//   final String imgurl;
//   final int duration;
//   final String director;
//   final String ar;
//   final String genre;
//   final String Language;

//   const SeeallMovieCard({
//     super.key,
//     required this.imgurl,
//     required this.title,
//     required this.duration,
//     required this.genre,
//     required this.ar,
//     required this.director,
//     required this.Language
//   });

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Container(
//       width: size.width * 0.95,
//       height: size.height * 0.30,
//       decoration: BoxDecoration(
//         color: Kbackground,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(
//                 top: Radius.circular(12), bottom: Radius.circular(12)),
//             child: Image.network(
//               imgurl,
//               height: size.height * 0.32,
//               width: size.width * 0.36,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(size.width * 0.03),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: size.height * 0.03,
//                 ),
//                 _buildRow("Duration:", duration.toString() , size.width * 0.01),
//                 SizedBox(
//                   height: size.height * 0.01,
//                 ),
//                 _buildRow("Director:", director , size.width * 0.01),
//                 SizedBox(
//                   height: size.height * 0.01,
//                 ),
//                 _buildRow("AR:", ar , size.width * 0.001),
//                 SizedBox(
//                   height: size.height * 0.01,
//                 ),
//                 _buildRow("Genre:", genre , size.width * 0.01),
//                 SizedBox(
//                   height: size.height * 0.01,
//                 ),
//                 _buildRow("Language:", Language , size.width * 0.01),
//                 SizedBox(
//                   height: size.height * 0.01,
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildRow(String label, String value , double size) {
    
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(
//           width: 80, // Adjust width for alignment
//           child: Text(
//             label,
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//          SizedBox(width: size),
//         Text(
//           value,
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: 12.sp,
//               fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }
// }


class SeeallMovieCard extends StatelessWidget {
  final String title;
  final String imgurl;
  final int duration;
  final String director;
  final String ar;
  final String genre;
  final String Language;
  final double rating;
  final String subtitle;
  final String  ? status ;

  const SeeallMovieCard({
    super.key,
    required this.imgurl,
    required this.title,
    required this.duration,
    required this.genre,
    required this.ar,
    required this.director,
    required this.Language,
    required this.rating,
    required this.subtitle,
    this.status

    
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.95,
      height: size.height * 0.30,
      decoration: BoxDecoration(
        color: Kbackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // لمحاذاة العناصر للأعلى في الصف
        children: [
          // ClipRRect(
          //   borderRadius: const BorderRadius.vertical(
          //       top: Radius.circular(12), bottom: Radius.circular(12)),
          //   child: Image.network(
          //     imgurl,
          //     height: size.height * 0.30, // تأكد من أن الارتفاع يطابق ارتفاع الحاوية
          //     width: size.width * 0.36,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12) , bottom: Radius.circular(12)),
                child: Image.network(
                  imgurl,
                  height: size.height * 0.30,
                  width: size.width * 0.36,
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
          Expanded( // يسمح للعمود بأخذ المساحة المتبقية
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color:kbutton,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                    maxLines: 2, // يسمح للعنوان بالالتفاف لسطرين
                    overflow: TextOverflow.ellipsis, // يضيف "..." إذا كان العنوان أطول من اللازم
                  ),
                    SizedBox(
                    height: size.height * 0.0022,
                  ),
                  _buildDetailRow("status:", status.toString()),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  _buildDurationRow("Duration:", duration.toString()),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  _buildDetailRow("Director:", director),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  _buildDetailRow("M.class:", ar),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  _buildDetailRow("Type:", genre),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  _buildDetailRow("Language:", Language),
                   SizedBox(
                    height: size.height * 0.01,
                  ),
                  _buildDetailRow("Subtitles:", Language),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // لمحاذاة النص للأعلى
      children: [
        SizedBox(
          width: 70, // عرض ثابت للتصنيف لضمان المحاذاة
          child: Text(
            label,
            style: TextStyle(
                color:Ktext,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 5), // مسافة صغيرة بين التصنيف والقيمة
        Expanded( // يسمح للقيمة بأخذ المساحة المتبقية
          child: Text(
            value,
            style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold),
            maxLines: 2, // يسمح للقيمة بالالتفاف لسطرين
            overflow: TextOverflow.ellipsis, // يضيف "..." إذا كانت القيمة أطول من اللازم
          ),
        ),
      ],
    );
  }
  Widget _buildDurationRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // لمحاذاة النص للأعلى
      children: [
        SizedBox(
          width: 70, // عرض ثابت للتصنيف لضمان المحاذاة
          child: Text(
            label,
            style: TextStyle(
                color:Ktext,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 5), // مسافة صغيرة بين التصنيف والقيمة
        Expanded( // يسمح للقيمة بأخذ المساحة المتبقية
          child: Text(
            "$value minute",
            style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold),
            maxLines: 2, // يسمح للقيمة بالالتفاف لسطرين
            overflow: TextOverflow.ellipsis, // يضيف "..." إذا كانت القيمة أطول من اللازم
          ),
        ),
      ],
    );
  }
}