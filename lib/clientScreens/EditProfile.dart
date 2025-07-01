// // import 'package:cinema_app_pr2/Constants/colors.dart';
// // import 'package:cinema_app_pr2/Constants/sizer.dart';
// // import 'package:cinema_app_pr2/Cubits/EditProfilecubit/edit_profile_cubit_cubit.dart';
// // import 'package:cinema_app_pr2/wedgets/textform.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // class EditProfileScreen extends StatelessWidget {
// //   const EditProfileScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     Size size = MediaQuery.of(context).size;
// //     return BlocProvider(
// //       create: (context) => EditProfileCubitCubit(),
// //       child: BlocConsumer<EditProfileCubitCubit, EditProfileCubitState>(
// //         listener: (context, state) {
          
// //         },
// //         builder: (context, state) {
// //           return Scaffold(
// //             backgroundColor: Kbackground,
// //             appBar: AppBar(
// //               backgroundColor: Kbackground,
// //               title: const Text(
// //                 'Edit profile',
// //                 style: TextStyle(color: Ktext),
// //               ),
// //               leading: IconButton(
// //                 icon: const Icon(
// //                   Icons.arrow_back_ios,
// //                   color: kbutton,
// //                 ),
// //                 onPressed: () => Navigator.of(context).pop(),
// //               ),
// //               automaticallyImplyLeading: true,
// //             ),
// //             body: Column(
// //               crossAxisAlignment: CrossAxisAlignment.center,
// //               children: [
// //                 SizedBox(
// //                   height: size.height * 0.05,
// //                 ),
// //                 const Center(
// //                     child: CircleAvatar(
// //                   radius: 50,
// //                 )),
// //                 ListView(
// //                   shrinkWrap: true,
// //                   physics: BouncingScrollPhysics(),
// //                   children: [
// //                     Column(
// //                       children: [
// //                         Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: InputTextForm(
// //                             formValidator: context
// //                                 .read<EditProfileCubitCubit>()
// //                                 .fullNameValidator,
// //                             prefIcon: Icons.person,
// //                             hintText: 'Enter your Full Name',
// //                             iconData: Icons.person,
// //                             onChange: () {},
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //                 InputTextForm(
// //                   formValidator:
// //                       context.read<EditProfileCubitCubit>().emailValidator,
// //                   prefixIcon: Icons.email,
// //                   prefIcon: Icons.email,
// //                   hintText: 'Enter your email',
// //                   iconData: Icons.email,
// //                   onChange: () {},
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }

// import 'package:bpr602_cinema/Constants/colors.dart';
// import 'package:bpr602_cinema/Cubits/EditProfilecubit/edit_profile_cubit_cubit.dart';
// import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
// import 'package:bpr602_cinema/wedgets/textform.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'dart:io';

// class EditProfileScreen extends StatelessWidget {
//   const EditProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return BlocProvider(
//       create: (context) => EditProfileCubitCubit(),
//       child: BlocConsumer<EditProfileCubitCubit, EditProfileCubitState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Scaffold(
//             backgroundColor: Kbackground,
//             appBar: AppBar(
//               backgroundColor: Kbackground,
//               title: const Text(
//                 'Edit profile',
//                 style: TextStyle(color: Ktext),
//               ),
//               leading: IconButton(
//                 icon: const Icon(
//                   Icons.arrow_back_ios,
//                   color: kbutton,
//                 ),
//                 onPressed: () => Navigator.of(context).pop(),
//               ),
//               automaticallyImplyLeading: true,
//             ),
//             body: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: size.height * 0.05,
//                 ),
//                 Center(
//                   child: GestureDetector(
//                     onTap: () => context.read<EditProfileCubitCubit>().pickImage(),
//                     child: CircleAvatar(
//                       radius: 50,
//                       backgroundImage: context.read<EditProfileCubitCubit>().image != null
//                           ? FileImage(File(context.read<EditProfileCubitCubit>().image!.path))
//                           : null,
//                       child: context.read<EditProfileCubitCubit>().image == null
//                           ? const Icon(
//                               Icons.camera_alt,
//                               size: 50,
//                               color: Colors.grey,
//                             )
//                           : null,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView(
//                     shrinkWrap: true,
//                     physics: const BouncingScrollPhysics(),
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: InputTextForm(
//                               formValidator: context
//                                   .read<EditProfileCubitCubit>()
//                                   .fullNameValidator,
//                               prefIcon: Icons.person,
//                               hintText: 'Enter your Full Name',
//                               iconData: Icons.person,
//                               onChange: () {},
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: InputTextForm(
//                               formValidator: context
//                                   .read<EditProfileCubitCubit>()
//                                   .emailValidator,
//                               prefixIcon: Icons.email,
//                               prefIcon: Icons.email,
//                               hintText: 'Enter your email',
//                               iconData: Icons.email,
//                               onChange: () {},
//                             ),
//                           ),
//                              ElevatedBtn(
//                               //minWidth: 200.0,
//                               //minHeight: 20.0,
//                               buttonText: "Edit ",
//                               onPressed: () {
                           
//                               },
//                               backgroundColor: kbutton,
//                               textColor: Kbackground,
//                             ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Cubits/EditProfilecubit/edit_profile_cubit_cubit.dart';
import 'package:bpr602_cinema/clientScreens/indexedstackclientnav.dart';
import 'package:bpr602_cinema/clientScreens/profile.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  final String Name;
    final String? imageUrl;
  const EditProfileScreen( {super.key, required this.Name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => EditProfileCubitCubit()..fetchUserProfileData(Name),
      child: BlocConsumer<EditProfileCubitCubit, EditProfileCubitState>(
        listener: (context, state) {
          if (state is UploadImageproSuccess) {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   const SnackBar(content: Text("Profile image uploaded successfully")),
            // );
          } else if (state is UploadImageproFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Upload failed: ${state.message}")),
            );
          }
            if (state is UpdateProfileErrorState) {
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
            if(state is UpdateProfileSuccessState){
               AppConstants.showToast(context, " your profile updated succesfully " , icon: Icons.done , iconcolor: Colors.green);
              NavigationWidget.pushPage(
            context,
            const IndexedStackTeacherScreen(initialIndex: 3),
          );
            }
        },
        builder: (context, state) {
          final cubit = context.read<EditProfileCubitCubit>();

          return Scaffold(
            backgroundColor: Kbackground,
            appBar: AppBar(
              backgroundColor: Kbackground,
              title: const Text(
                'Edit profile',
                style: TextStyle(color: Ktext),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: kbutton,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              automaticallyImplyLeading: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.05),
                Center(
                  child:
                  //  GestureDetector(
                  //   onTap: () => cubit.pickImage(),
                  //   child: CircleAvatar(
                  //     radius: 50,
                  //     backgroundImage: cubit.image != null
                  //         ? FileImage(File(cubit.image!.path))
                  //         : null,
                  //     child: cubit.image == null
                  //         ? const Icon(
                  //             Icons.camera_alt,
                  //             size: 50,
                  //             color: Colors.grey,
                  //           )
                  //         : null,
                  //   ),
                  // ),
                  GestureDetector(
  onTap: () => cubit.pickImage(),
  child: CircleAvatar(
    radius: 50,
    backgroundImage: cubit.image != null
        ? FileImage(File(cubit.image!.path))
        : (imageUrl != null
            ? NetworkImage('${LinksUrl.baseUrl}$imageUrl') // 🔹 من الـ API
            : null),
    child: cubit.image == null && imageUrl == null
        ? const Icon(
            Icons.camera_alt,
            size: 50,
            color: Colors.grey,
          )
        : null,
  ),
),

                ),
                const SizedBox(height: 10),
                if (state is UploadImageproInProgress)
                  const CircularProgressIndicator(),
                Expanded(
                  child: Form(
                     key: context.read<EditProfileCubitCubit>().formKey1,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(16),
                      children: [
                         InputTextForm(
                                  formValidator: context
                                      .read<EditProfileCubitCubit>()
                                      .fullNameValidator,
                                  prefIcon: Icons.person,
                                  hintText: 'Enter your User Name',
                                  iconData: Icons.person,
                                  onChange: () {},
                                ),
                       
                        const SizedBox(height: 20),
                        ElevatedBtn(
                      buttonText: "Save Changes",
                      onPressed: () async {
                        
                        final cubit = context.read<EditProfileCubitCubit>();
                    
                       
                        if (cubit.image != null) {
                          await cubit.uploadImage();
                    
                         
                          if (cubit.uploadedImageId == null) {
                            return;
                          }
                        }
                    
                        // ثم نتابع تعديل الملف الشخصي (حتى لو لم تكن هناك صورة)
                        await cubit.updateProfile();
                      },
                      backgroundColor: kbutton,
                    )
                    
                        // ElevatedBtn(
                        //   buttonText: "Upload Image",
                        //   onPressed: () {
                        //     cubit.uploadImage();
                        //   },
                        //   backgroundColor: kbutton,
                        // ),
                    //                       ElevatedBtn(
                    //   buttonText: "Save Changes",
                    //   onPressed: () async {
                    //     final cubit = context.read<EditProfileCubitCubit>();
                    
                    //     String fullName = fullNameController.text.trim();
                    //     String email = emailController.text.trim();
                    
                    //     // يمكنك عرض حالة تحميل للمستخدم هنا (اختياري)
                    
                    //     // إذا المستخدم اختار صورة، ارفعها أولاً
                    //     if (cubit.image != null) {
                    //       await cubit.uploadImage();
                    
                    //       // إذا فشل رفع الصورة، لا تكمل تعديل البيانات
                    //       if (cubit.uploadedImageId == null) {
                    //         return;
                    //       }
                    //     }
                    
                    //     // بعد ذلك نفذ تعديل الملف الشخصي، مع أو بدون imageId
                    //     await cubit.editProfile(
                    //       fullName: fullName,
                    //       email: email,
                    //     );
                    //   },
                    //   backgroundColor: kbutton,
                    // )
                    
                        // يمكنك إضافة زر تعديل بيانات بروفايل هنا أيضاً
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
