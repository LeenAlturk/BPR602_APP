import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Animation/Fadeinfadeout.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/profile_custumer_cubit/profile_customer_cubit.dart';
import 'package:bpr602_cinema/clientScreens/ChangePassword.dart';
import 'package:bpr602_cinema/clientScreens/EditProfile.dart';
import 'package:bpr602_cinema/clientScreens/NotificationPage.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Clientprofile extends StatelessWidget {
  const Clientprofile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ProfileCustomerCubit()..getprofile(),
      child: BlocConsumer<ProfileCustomerCubit, ProfileCustomerState>(
        listener: (context, state) {
         if (state is ProfileCustomerLoggedOut){
          AppConstants.showToast(context, "We Will Miss You Dear " , icon: Icons.waving_hand , iconcolor: Colors.amber); 
         }
         if (state is profilerrorstate) {
              if (state.message == "Session Is Done") {
                AppConstants.showToast(context, state.message);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false);
              } else if(state.message == "No Internet Connection") {
                 AppConstants.showToast(context, state.message);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => NoInternetScreen()),
                    (route) => false);
              }else{
                        AppConstants.showToast(context, state.message);
              }
            }
        },
        builder: (context, state) {
        final cubit = context.read<ProfileCustomerCubit>();
          if(state is profileloading){
              return Scaffold(
                backgroundColor: Kbackground,
                body: Center(
                  child: CircularProgressIndicator(color:kbutton,),
                )
              );
          }
          if(state is profileloaded){
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
                      vertical: size.width * 0.02,
                      horizontal: size.height * 0.02),
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
  backgroundColor: Colors.grey.shade800,
  backgroundImage: (cubit.getProfileModel!.data!.image?.url != null)
      ? NetworkImage('${LinksUrl.baseUrl}${cubit.getProfileModel!.data!.image!.url!}')
      : null,
  child: (cubit.getProfileModel!.data!.image?.url == null)
      ? const Icon(Icons.person, color: Colors.white)
      : null,
),

                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: size.height * 0.035,
                              ),
                              Text(
                               "${cubit.getProfileModel!.data!.fullName}",
                          
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                   "${cubit.getProfileModel!.data!.email}",
                                  
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
                              NavigationWidget.pushPage(
                                  context, EditProfileScreen());
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.width * 0.02,
                      horizontal: size.height * 0.02),
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
                               // "${cubit.getProfileModel!.data!.role}",
                               "jjjjj",
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
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.width * 0.02,
                      horizontal: size.height * 0.02),
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
                                color: Ktext,
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
                                  NavigationWidget.pushPage(
                                      context, Notificationpage());
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
                                onPressed: ()  {
                  
                                                  context.read<ProfileCustomerCubit>().logout(context);
                                  },
                                icon: Icon(Icons.arrow_forward_ios),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
          }
          return SizedBox(
          );
        },
      ),
    );
  }
}