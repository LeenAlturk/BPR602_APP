
// import 'package:bpr602_cinema/Constants/colors.dart';
// import 'package:bpr602_cinema/Constants/sizer.dart';
// import 'package:flutter/material.dart';

// class SnackCard extends StatelessWidget {
//   final String ? imageUrl;
//   final String ?  title;
//   final int   ?price;

//   const SnackCard({
//     super.key,
//      this.imageUrl,
//      this.title,
//      this.price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       width: size.width * 0.42,
//       //height: size.height * 0.5,
//          decoration: BoxDecoration(
//         color: ksmallActionColor,
//         borderRadius: BorderRadius.circular(12),
     
//         gradient: const LinearGradient(
//           colors: [
//             Color(0xFF303030), 
//             ksmallActionColor
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Movie Image
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//             child: Image.network(
//               imageUrl!,
//               height: size.height * 0.25,
//               width: size.width * 0.48,
//               fit: BoxFit.cover,
//             ),
//           ),

//           // snack Title
//           Padding(
//             padding:  EdgeInsets.all( size.height * 0.01),
//             child: Text(
//               title!,
//               style:  TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 12.sp,
//               ),
//             ),
//           ),
//           // Movie Genre
//           Padding(
//             padding:  EdgeInsets.symmetric(horizontal:  size.width * 0.01),
//             child: Text(
//               price.toString(),
//               style: TextStyle(
//                 color: Colors.white70,
//                 fontSize: 12.sp,
//               ),
//             ),
//           ),
//            SizedBox(height:  size.height * 0.01),
//         ],
//       ),
//     );
//   }
// }
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/models/response/snacks_response.dart' as model;
import 'package:flutter/material.dart';

class SnackCard extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final List<model.Variant>? variants;

  const SnackCard({
    super.key,
    this.imageUrl,
    this.title,
    this.variants,
  });

  int get minPrice {
    if (variants == null || variants!.isEmpty) return 0;
    return variants!.map((v) => v.price ?? 0).reduce((a, b) => a < b ? a : b);
  }

  String get priceText {
    if (variants == null || variants!.isEmpty) return 'No price';
    if (variants!.length == 1) return '${variants!.first.price}';
    
    final min = minPrice;
    final max = variants!.map((v) => v.price ?? 0).reduce((a, b) => a > b ? a : b);
    return '$min  - $max';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.42,
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
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl ?? 'https://via.placeholder.com/150',
              height: size.height * 0.25,
              width: size.width * 0.48,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: size.height * 0.25,
                width: size.width * 0.48,
                color: Colors.grey,
                child: const Icon(Icons.fastfood, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.height * 0.01),
            child: Text(
              title ?? 'No title',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            child: Text(
              "Prices range: ${priceText} IQD",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12.sp,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),
        ],
      ),
    );
  }
}

