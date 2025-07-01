import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/emp_profile_cubit.dart/emp_profile_cubit.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/employeesScreens/Chagepasswordemp.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeProfile extends StatelessWidget {
  const EmployeeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => EmpProfileCubit()..getprofileEmp(),
      child: BlocConsumer<EmpProfileCubit, EmpProfileState>(
        listener: (context, state) {
           if (state is ProfileCustomerLoggedOut){
          AppConstants.showToast(context, "We Will Miss You Dear " , icon: Icons.waving_hand , iconcolor: Colors.amber); 
         }
         if (state is Profilerrorstate) {
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
//         builder: (context, state) {
//           return Scaffold(
//             backgroundColor: Kbackground,
//             body: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Stack(
//                   alignment: Alignment.center,
//                   clipBehavior: Clip.none, // Allows the avatar to overflow
//                   children: [
//                     Container(
//                       height: size.height * 0.19,
//                       width: size.width,
//                       decoration: const BoxDecoration(
//                         color: Ktext, // Light beige color for the background
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(200),
//                           bottomRight: Radius.circular(200),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 30, // Adjust for positioning
//                       right: 20, // Adjust for positioning
//                       child: IconButton(
//                         icon: Icon(Icons.logout, color: Kbackground),
//                         onPressed: () {
//                           // Add logout logic here
//                          context.read<EmpProfileCubit>().logout(context);
//                         },
//                       ),
//                     ),
//                     Positioned(
//                       top: size.height * 0.30,
//                       left: size.height * 0.25,
//                       child: IconButton(
//                         icon: const Icon(Icons.arrow_back, color: Kbackground),
//                         onPressed: () {},
//                       ),
//                     ),
//                     Positioned(
//                       top: size.height * 0.08,
//                       child: Column(
//                         children: [
//                           Text(
//                             "My Profile",
//                             style: TextStyle(
//                               fontSize: 22.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                       bottom: -size.height * 0.05,
//                       child: CircleAvatar(
//                         radius: 40.sp,
//                         backgroundColor: const Color(0xFF6b6a5e),
//                         child: const Text(
//                           "A",
//                           style: TextStyle(
//                             fontSize: 28,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 // Optional: Add other content below
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: size.height * 0.1),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Column(
//                           children: [
//                             Text(
//                               "Full Name",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20.sp,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(size.height * 0.01),
//                               child: Text(
//                                 "Leen Jamal Alturk",
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 14.sp),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(size.height * 0.01),
//                               child: Divider(
//                                 thickness: 1,
//                               ),
//                             ),
//                             Text(
//                               "Email Address",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20.sp,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(size.height * 0.02),
//                               child: Text(
//                                 "LeenAlturk@hotmail.com",
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 14.sp),
//                               ),
//                             ),
//                             ElevatedBtn(
//                               buttonText: "Change Password -->",
//                               onPressed: () {
//                                 NavigationWidget.pushPage(
//                                     context, Chagepasswordemp());
//                               },
//                               backgroundColor: kbutton,
//                               textColor: Kbackground,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
 builder: (context, state) {
        final cubit = context.read<EmpProfileCubit>();
          if(state is Profileloading){
              return Scaffold(
                backgroundColor: Kbackground,
                body: Center(
                  child: CircularProgressIndicator(color:kbutton,),
                )
              );
          }
          if(state is Profileloaded){
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
                               "${cubit.getProfileModel!.data!.role}",
                               
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
                                      context, Chagepasswordemp());
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
                    height: size.height * 0.14,
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
                  
                                                  context.read<EmpProfileCubit>().logout(context);
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