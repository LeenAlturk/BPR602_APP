
import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/Sighnup.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:flutter/material.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DataStore.instance.setNumOpenApp("1");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Kbackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/moon.png"),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              "let’s dive in into your account !",
              style: TextStyle(color: Ktext, fontSize: 15.sp),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ElevatedBtn(
              //minWidth: 200.0, // Customize width
              //minHeight: 20.0, // Customize height
              buttonText: "Login",
              onPressed: () {
                NavigationWidget.pushPage(context, const LoginScreen());
              },
              backgroundColor: kbutton,
              textColor: Kbackground,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ElevatedBtn(
              //minWidth: 200.0,
              //minHeight: 20.0,
              buttonText: "Signup",
              onPressed: () {
                NavigationWidget.pushPage(context, const SighnUpScreen());
              },
              backgroundColor: kbutton,
              textColor: Kbackground,
            )
          ],
        ),
      ),
    );
  }
}
