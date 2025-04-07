// import 'package:cinema_app_pr2/Constants/colors.dart';
// import 'package:flutter/material.dart';

// class Onboarding extends StatefulWidget {
//   const Onboarding({super.key});

//   @override
//   State<Onboarding> createState() => _OnboardingState();
// }

// class _OnboardingState extends State<Onboarding> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kbutton,
//       body: Stack(
//         children: [
//           // Background Image
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.all(70.0),
//               child: Image.asset(
//                 "assets/ONBOARDING1.png",
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Foreground Curved Container
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: ClipPath(
//               clipper: BottomCurveClipper(),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 400,
//                 color: Kbackground,
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(height: 90),
//                       Text(
//                         "Embrace Cinematic Anytime Anywhere",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       // const SizedBox(height: 16), // Add some spacing between texts
//                       Text(
//                         "Watch your favorite movies and shows on the go",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       // const SizedBox(height: 8),
//                       Text(
//                         "No matter where you are, we’re here to bring your\ncinematic experience straight to you.",
//                         style: TextStyle(
//                           color: Colors.white70,
//                           fontSize: 14,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Custom clipper for the bottom container
// class BottomCurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();

//     // Start at the top-left corner
//     path.moveTo(0, 0);
//     // Create a large downward arc. Adjust the control point's Y value
//     // to change how "deep" the curve goes.
//     final controlPoint = Offset(size.width / 2, size.height * 0.9);
//     final endPoint = Offset(size.width, 0);

//     path.quadraticBezierTo(
//       controlPoint.dx,
//       controlPoint.dy,
//       endPoint.dx,
//       endPoint.dy,
//     );

//     // Go down the right edge, bottom edge, and back to start
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(BottomCurveClipper oldClipper) => false;
// }
