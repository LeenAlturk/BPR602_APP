import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final Color textColor;
  final Color backgroundColor;
  final double elevation;
  final double? buttonWidth; // New property for button width
  final double? buttonHeight; // New property for button height

  const ElevatedBtn({
    super.key,
    this.onPressed,
    required this.buttonText,
    this.textColor = Kbackground,
    this.backgroundColor = Colors.blue,
    this.elevation = 3.0,
    this.buttonWidth, // Optional parameter for width
    this.buttonHeight, // Optional parameter for height
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust padding based on screen size
    final adjustedHorizontalPadding = screenWidth * 0.05;
    final adjustedVerticalPadding = screenHeight * 0.01;
    final adjustedFontSize = screenWidth * 0.04;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: adjustedHorizontalPadding,
          vertical: adjustedVerticalPadding,
        ),
        elevation: elevation,
        // Set button size; use the buttonWidth and buttonHeight if provided, otherwise use minimumSize as fallback
        fixedSize: buttonWidth != null && buttonHeight != null
            ? Size(buttonWidth!, buttonHeight!)
            : null,
        minimumSize: Size(
          buttonWidth ?? screenWidth * 0.85,
          buttonHeight ?? screenHeight * 0.05,
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: adjustedFontSize),
      ),
    );
  }
}
