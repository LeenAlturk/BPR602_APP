
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/models/onboardingModel.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../WellcomeScreen.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  
  int currentIndex = 0;
  late PageController _controller;
  bool isLastPage = false;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void goToNextPage() {
    if (!isLastPage) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      // On the last page - get started logic
      DataStore.instance.setNumOpenApp('x');
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => WellcomeScreen()), 
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: beige,
        floatingActionButton: isLastPage
            ? TextButton(
                onPressed: () {
                  DataStore.instance.setNumOpenApp('x');
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => WellcomeScreen()),
                    (route) => false,
                  );
                },
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      return Colors.transparent;
                    },
                  ),
                ),
                child: Container(
                      decoration: BoxDecoration(
        color: ksmallActionColor,
        borderRadius: BorderRadius.circular(10),
     
        gradient: const LinearGradient(
          colors: [
            Color(0xFF303030), // Subtle gradient for a lighting effect
            ksmallActionColor
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
                  child:  Padding(
                    padding: EdgeInsets.symmetric(vertical:size.height * 0.01 , horizontal:size.width * 0.03),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        
                        fontWeight: FontWeight.bold,
                        color: kbutton),
                    ),
                  ),
                ),
              )
            : FloatingActionButton(
                onPressed: goToNextPage,
                backgroundColor:Kbackground,
                child:  Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 32.0.sp,
                ),
              ),
        body: Stack(
          children: [
            // PageView with each onboarding page
            PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                  isLastPage = index == contents.length - 1;
                });
              },
              itemBuilder: (context, index) {
                final item = contents[index];
                return Stack(
                  children: [
                    // Background image
                    Center(
                      child: Padding(
                        padding:  EdgeInsets.all(size.height * 0.04),
                        child: Image.asset(
                          item.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Curved container with text at the bottom
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipPath(
                        clipper: BottomCurveClipper(),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          //350
                          height: size.height *0.4 ,
                          color: Kbackground,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 SizedBox(height: size.height * 0.05),
                                Text(
                                  item.title,
                                  style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  item.discription,
                                  style:  TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            // Smooth Page Indicator positioned above the black container
            Positioned(
              bottom: size.height * 0.02,
              left: size.height * 0.02,
              right: size.height * 0.02,
              child: Center(
                child: SmoothPageIndicator(
                  effect: const WormEffect(
                    spacing: 8,
                    dotColor: Colors.blueGrey,
                    activeDotColor: Ktext
                  ),
                  controller: _controller,
                  count: contents.length,
                  onDotClicked: (index) {
                    _controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom clipper for the bottom container
class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start at the top-left corner
    path.moveTo(0, 0);

    // Create a large downward arc
    final controlPoint = Offset(size.width / 2, size.height * 0.7);
    final endPoint = Offset(size.width, 0);

    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    // Bottom part of the shape
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(BottomCurveClipper oldClipper) => false;
}
