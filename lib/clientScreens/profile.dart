import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/Animation/Fadeinfadeout.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/clientScreens/ChangePassword.dart';
import 'package:bpr602_cinema/clientScreens/EditProfile.dart';
import 'package:bpr602_cinema/clientScreens/NotificationPage.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:flutter/material.dart';

class Clientprofile extends StatelessWidget {
  const Clientprofile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Kbackground,
      appBar: AppBar(
        
        centerTitle: true,
        backgroundColor: Kbackground,
        title: const Text(
          'My profile',
          style: TextStyle(color: Ktext),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.width * 0.02, horizontal: size.height * 0.02),
            child: FadeInDown(
              child: Container(
                width: size.width * 0.95,
                height: size.height * 0.13,
                decoration: BoxDecoration(
                    color: Kbackground,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: size.width * 0.006, color: border)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      //vertical: size.width * 0.02,
                      horizontal: size.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 23,
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.035,
                          ),
                          Text(
                            "Leen",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold),
                          ),
                           SizedBox(
                             height: size.height * 0.01,
                          ),
                          Text(
                            "Leen@gmail.com",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.25,
                      ),
                      IconButton(
                        onPressed: () {
                          NavigationWidget.pushPage(context, EditProfileScreen());
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.width * 0.02, horizontal: size.height * 0.02),
            child: FadeInDown(
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.25,
                decoration: BoxDecoration(
                    color: Kbackground,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: size.width * 0.006, color: border)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.width * 0.02,
                      horizontal: size.height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Account",
                        style: TextStyle(
                            color: Ktext,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Text(
                            "Mambers",
                            style: TextStyle(
                                color: Colors.white38,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Divider(
                        thickness: 0.5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Text(
                            "change password",
                            style: TextStyle(
                                color: Colors.white38,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: size.width * 0.25,
                          ),
                          IconButton(
                            onPressed: () {
                              NavigationWidget.pushPage(
                                  context, ChangePassword());
                            },
                            icon: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.width * 0.02, horizontal: size.height * 0.02),
            child: FadeInDown(
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.26,
                decoration: BoxDecoration(
                    color: Kbackground,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: size.width * 0.006, color: border)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.width * 0.02,
                      horizontal: size.height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "General",
                        style: TextStyle(
                            color:Ktext,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.0001,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Text(
                            "Notifications",
                            style: TextStyle(
                                color: Colors.white38,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: size.width * 0.34,
                          ),
                          IconButton(
                            onPressed: () {
                              NavigationWidget.pushPage(context, Notificationpage());
                            },
                            icon: Icon(Icons.arrow_forward_ios),
                          ),
                          
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Divider(
                        thickness: 0.5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: size.width * 0.052,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(
                                color: Colors.white38,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: size.width * 0.42,
                          ),
                          IconButton(
                            onPressed: () {
                              NavigationWidget.pushAndRemoveUntil(context, LoginScreen());
                            },
                            icon: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
