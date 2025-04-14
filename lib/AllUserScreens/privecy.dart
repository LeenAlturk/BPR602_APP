import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/colors.dart';
import '../Constants/sizer.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kbackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Privacy Policy',
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
            '''We value your privacy!

This Privacy Policy explains how we collect and use your information:

1. We collect basic information such as email and name to provide our service.
2. Your data is stored securely and never sold to third parties.
3. We use data for account verification, analytics, and improving user experience.
4. You can request account deletion at any time.

If you have any questions, contact us at privacy@cinemate.com.
''',
            style: TextStyle(color: Ktext, fontSize: 13.sp),
          ),
        ),
      ),
    );
  }
}
