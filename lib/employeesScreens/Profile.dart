import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/employeesScreens/Chagepasswordemp.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:flutter/material.dart';

class EmployeeProfile extends StatelessWidget {
  const EmployeeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Kbackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none, // Allows the avatar to overflow
            children: [
              Container(
                height: size.height * 0.19,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Ktext, // Light beige color for the background
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200),
                  ),
                ),
              ),
              Positioned(
                top: 30, // Adjust for positioning
                right: 20, // Adjust for positioning
                child: IconButton(
                  icon:  Icon(Icons.logout, color: Kbackground),
                  onPressed: () {
                    // Add logout logic here
                    NavigationWidget.pushAndRemoveUntil(context, LoginScreen());
                  },
                ),
              ),
              Positioned(
                top: size.height * 0.30,
                left: size.height * 0.25,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Kbackground),
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: size.height * 0.08,
                child: Column(
                  children: [
                    Text(
                      "My Profile",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -size.height * 0.05,
                child: CircleAvatar(
                  radius: 40.sp,
                  backgroundColor: const Color(0xFF6b6a5e),
                  child: const Text(
                    "A",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Optional: Add other content below
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.1),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        "Full Name",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.all(size.height * 0.01),
                        child: Text(
                          "Leen Jamal Alturk",
                          style: TextStyle(
                              color: Colors.white, fontSize: 14.sp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(size.height * 0.01),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Text(
                        "Email Address",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.all(size.height * 0.02),
                        child: Text(
                          "LeenAlturk@hotmail.com",
                          style: TextStyle(
                              color: Colors.white, fontSize: 14.sp),
                        ),
                      ),
                      ElevatedBtn(
                        buttonText: "Change Password -->",
                        onPressed: () {
                          NavigationWidget.pushPage(
                              context, Chagepasswordemp());
                        },
                        backgroundColor: kbutton,
                        textColor: Kbackground,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
