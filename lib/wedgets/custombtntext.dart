import 'package:flutter/material.dart';

class customTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final Color textColor;

  const customTextButton({super.key, 
    this.onPressed,
    required this.buttonText,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
