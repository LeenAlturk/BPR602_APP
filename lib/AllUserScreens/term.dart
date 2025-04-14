import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/colors.dart';
import '../Constants/sizer.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kbackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Terms of Service',
          style: GoogleFonts.mulish(
            textStyle: const TextStyle(color: Ktext),
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Ktext),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Text(
            '''Welcome to Cinemate!

These Terms of Service govern your use of our app. By creating an account or using our services, you agree to the following:

1. You must be at least 13 years old to use this app.
2. You are responsible for the security of your account.
3. You may not use our app for illegal or harmful activities.
4. We reserve the right to suspend or terminate your account at any time.
5. Content provided in the app is for personal use only.

Please read and understand these terms before using our service.

For more details, contact support@cinemate.com
''',
            style: TextStyle(color: Ktext, fontSize: 13.sp),
          ),
        ),
      ),
    );
  }
}
