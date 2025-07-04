// import 'package:bpr602_cinema/AllUserScreens/Login.dart';
// import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
// import 'package:bpr602_cinema/Constants/colors.dart';
// import 'package:bpr602_cinema/Constants/sizer.dart';
// import 'package:bpr602_cinema/Cubits/emp_profile_cubit.dart/emp_profile_cubit.dart';
// import 'package:bpr602_cinema/data/link.dart';
// import 'package:bpr602_cinema/employeesScreens/Chagepasswordemp.dart';
// import 'package:bpr602_cinema/wedgets/Navigating.dart';
// import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
// import 'package:bpr602_cinema/wedgets/toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class EmployeeProfile extends StatelessWidget {
//   const EmployeeProfile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return BlocProvider(
//       create: (context) => EmpProfileCubit()..getprofileEmp(),
//       child: BlocConsumer<EmpProfileCubit, EmpProfileState>(
//         listener: (context, state) {
//            if (state is ProfileCustomerLoggedOut){
//           AppConstants.showToast(context, "We Will Miss You Dear " , icon: Icons.waving_hand , iconcolor: Colors.amber); 
//          }
//          if (state is Profilerrorstate) {
//               if (state.message == "Session Is Done") {
//                 AppConstants.showToast(context, state.message);
//                 Navigator.of(context).pushAndRemoveUntil(
//                     MaterialPageRoute(builder: (context) => LoginScreen()),
//                     (route) => false);
//               } else if(state.message == "No Internet Connection") {
//                  AppConstants.showToast(context, state.message);
//                 Navigator.of(context).pushAndRemoveUntil(
//                     MaterialPageRoute(builder: (context) => NoInternetScreen()),
//                     (route) => false);
//               }else{
//                         AppConstants.showToast(context, state.message);
//               }
//             }
//         },

//  builder: (context, state) {
//         final cubit = context.read<EmpProfileCubit>();
//           if(state is Profileloading){
//               return Scaffold(
//                 backgroundColor: Kbackground,
//                 body: Center(
//                   child: CircularProgressIndicator(color:kbutton,),
//                 )
//               );
//           }
//           if(state is Profileloaded){
//             return Scaffold(
//             backgroundColor: Kbackground,
//             appBar: AppBar(
//               centerTitle: true,
//               backgroundColor: Kbackground,
//               title: const Text(
//                 'My profile',
//                 style: TextStyle(color: Ktext),
//               ),
//               automaticallyImplyLeading: false,
//             ),
//             body: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       vertical: size.width * 0.02,
//                       horizontal: size.height * 0.02),
//                   child: Container(
//                     width: size.width * 0.95,
//                     height: size.height * 0.13,
//                     decoration: BoxDecoration(
//                         color: Kbackground,
//                         borderRadius: BorderRadius.circular(15),
//                         border: Border.all(
//                             width: size.width * 0.006, color: border)),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                           //vertical: size.width * 0.02,
//                           horizontal: size.height * 0.02),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                          CircleAvatar(
//   radius: 23,
//   backgroundColor: Colors.grey.shade800,
//   backgroundImage: (cubit.getProfileModel!.data!.image?.url != null)
//       ? NetworkImage('${LinksUrl.baseUrl}${cubit.getProfileModel!.data!.image!.url!}')
//       : null,
//   child: (cubit.getProfileModel!.data!.image?.url == null)
//       ? const Icon(Icons.person, color: Colors.white)
//       : null,
// ),

//                           SizedBox(
//                             width: size.width * 0.02,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(
//                                 height: size.height * 0.035,
//                               ),
//                               Text(
//                                "${cubit.getProfileModel!.data!.fullName}",
                          
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 10.sp,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 height: size.height * 0.01,
//                               ),
//                               Text(
//                                    "${cubit.getProfileModel!.data!.email}",
                                  
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 10.sp,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
                     
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       vertical: size.width * 0.02,
//                       horizontal: size.height * 0.02),
//                   child: Container(
//                     width: size.width * 0.9,
//                     height: size.height * 0.25,
//                     decoration: BoxDecoration(
//                         color: Kbackground,
//                         borderRadius: BorderRadius.circular(15),
//                         border: Border.all(
//                             width: size.width * 0.006, color: border)),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                           vertical: size.width * 0.02,
//                           horizontal: size.height * 0.02),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Account",
//                             style: TextStyle(
//                                 color: Ktext,
//                                 fontSize: 15.sp,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             height: size.height * 0.05,
//                           ),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.person,
//                                 color: Colors.white,
//                                 size: 20.sp,
//                               ),
//                               SizedBox(
//                                 width: size.width * 0.05,
//                               ),
//                               Text(
//                                "${cubit.getProfileModel!.data!.role}",
                               
//                                 style: TextStyle(
//                                     color: Colors.white38,
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.bold),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: size.height * 0.02,
//                           ),
//                           Divider(
//                             thickness: 0.5,
//                           ),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.lock,
//                                 color: Colors.white,
//                                 size: 20.sp,
//                               ),
//                               SizedBox(
//                                 width: size.width * 0.05,
//                               ),
//                               Text(
//                                 "change password",
//                                 style: TextStyle(
//                                     color: Colors.white38,
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 width: size.width * 0.25,
//                               ),
//                               IconButton(
//                                 onPressed: () {
//                                   NavigationWidget.pushPage(
//                                       context, Chagepasswordemp());
//                                 },
//                                 icon: Icon(Icons.arrow_forward_ios),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       vertical: size.width * 0.02,
//                       horizontal: size.height * 0.02),
//                   child: Container(
//                     width: size.width * 0.9,
//                     height: size.height * 0.14,
//                     decoration: BoxDecoration(
//                         color: Kbackground,
//                         borderRadius: BorderRadius.circular(15),
//                         border: Border.all(
//                             width: size.width * 0.006, color: border)),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                           vertical: size.width * 0.02,
//                           horizontal: size.height * 0.02),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "General",
//                             style: TextStyle(
//                                 color: Ktext,
//                                 fontSize: 15.sp,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             height: size.height * 0.0001,
//                           ),
                          
                          
//                           Divider(
//                             thickness: 0.5,
//                           ),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.logout,
//                                 color: Colors.white,
//                                 size: 20.sp,
//                               ),
//                               SizedBox(
//                                 width: size.width * 0.052,
//                               ),
//                               Text(
//                                 "Logout",
//                                 style: TextStyle(
//                                     color: Colors.white38,
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 width: size.width * 0.42,
//                               ),
//                               IconButton(
//                                 onPressed: ()  {
                  
//                                                   context.read<EmpProfileCubit>().logout(context);
//                                   },
//                                 icon: Icon(Icons.arrow_forward_ios),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           );
//           }
//           return SizedBox(
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/emp_profile_cubit.dart/emp_profile_cubit.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/employeesScreens/Chagepasswordemp.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
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
          if (state is ProfileCustomerLoggedOut) {
            AppConstants.showToast(context, "We Will Miss You Dear",
                icon: Icons.waving_hand, iconcolor: Colors.amber);
          }
          if (state is Profilerrorstate) {
            if (state.message == "Session Is Done") {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            } else if (state.message == "No Internet Connection") {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => NoInternetScreen()),
                  (route) => false);
            } else {
              AppConstants.showToast(context, state.message);
            }
          }
        },
        builder: (context, state) {
          final cubit = context.read<EmpProfileCubit>();

          return Scaffold(
            backgroundColor: Kbackground,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Kbackground,
              title: const Text('My profile', style: TextStyle(color: Ktext)),
              automaticallyImplyLeading: false,
            ),
            body: () {
              if (state is Profileloading) {
                return Center(child: CircularProgressIndicator(color: kbutton));
              }

              if (state is Profileloaded) {
                return Column(
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
                              width: size.width * 0.006, color: border),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: size.height * 0.02),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 23,
                                backgroundColor: Colors.grey.shade800,
                                backgroundImage:
                                    (cubit.getProfileModel!.data!.image?.url !=
                                            null)
                                        ? NetworkImage(
                                            '${LinksUrl.baseUrl}${cubit.getProfileModel!.data!.image!.url!}')
                                        : null,
                                child: (cubit.getProfileModel!.data!.image?.url ==
                                        null)
                                    ? const Icon(Icons.person,
                                        color: Colors.white)
                                    : null,
                              ),
                              SizedBox(width: size.width * 0.02),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: size.height * 0.035),
                                    Text(
                                      "${cubit.getProfileModel!.data!.fullName}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: size.height * 0.01),
                                    Text(
                                      "${cubit.getProfileModel!.data!.email}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
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
                              width: size.width * 0.006, color: border),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.width * 0.02,
                              horizontal: size.height * 0.02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Account",
                                  style: TextStyle(
                                      color: Ktext,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: size.height * 0.05),
                              Row(
                                children: [
                                  Icon(Icons.person,
                                      color: Colors.white, size: 20.sp),
                                  SizedBox(width: size.width * 0.05),
                                  Text(
                                    "${cubit.getProfileModel!.data!.role}",
                                    style: TextStyle(
                                        color: Colors.white38,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(height: size.height * 0.02),
                              Divider(thickness: 0.5),
                              Row(
                                children: [
                                  Icon(Icons.lock,
                                      color: Colors.white, size: 20.sp),
                                  SizedBox(width: size.width * 0.05),
                                  Text("change password",
                                      style: TextStyle(
                                          color: Colors.white38,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold)),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      NavigationWidget.pushPage(
                                          context, Chagepasswordemp());
                                    },
                                    icon: const Icon(Icons.arrow_forward_ios),
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
                        height: size.height * 0.17,
                        decoration: BoxDecoration(
                          color: Kbackground,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              width: size.width * 0.006, color: border),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.width * 0.02,
                              horizontal: size.height * 0.02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("General",
                                  style: TextStyle(
                                      color: Ktext,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold)),
                              Divider(thickness: 0.5),
                              Row(
                                children: [
                                  Icon(Icons.logout,
                                      color: Colors.white, size: 20.sp),
                                  SizedBox(width: size.width * 0.05),
                                  Text("Logout",
                                      style: TextStyle(
                                          color: Colors.white38,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold)),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      context
                                          .read<EmpProfileCubit>()
                                          .logout(context);
                                    },
                                    icon: const Icon(Icons.arrow_forward_ios),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }

              return const SizedBox();
            }(),
          );
        },
      ),
    );
  }
}
