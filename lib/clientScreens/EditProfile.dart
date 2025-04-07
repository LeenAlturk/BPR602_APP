// import 'package:cinema_app_pr2/Constants/colors.dart';
// import 'package:cinema_app_pr2/Constants/sizer.dart';
// import 'package:cinema_app_pr2/Cubits/EditProfilecubit/edit_profile_cubit_cubit.dart';
// import 'package:cinema_app_pr2/wedgets/textform.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class EditProfileScreen extends StatelessWidget {
//   const EditProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return BlocProvider(
//       create: (context) => EditProfileCubitCubit(),
//       child: BlocConsumer<EditProfileCubitCubit, EditProfileCubitState>(
//         listener: (context, state) {
          
//         },
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
//                 const Center(
//                     child: CircleAvatar(
//                   radius: 50,
//                 )),
//                 ListView(
//                   shrinkWrap: true,
//                   physics: BouncingScrollPhysics(),
//                   children: [
//                     Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: InputTextForm(
//                             formValidator: context
//                                 .read<EditProfileCubitCubit>()
//                                 .fullNameValidator,
//                             prefIcon: Icons.person,
//                             hintText: 'Enter your Full Name',
//                             iconData: Icons.person,
//                             onChange: () {},
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 InputTextForm(
//                   formValidator:
//                       context.read<EditProfileCubitCubit>().emailValidator,
//                   prefixIcon: Icons.email,
//                   prefIcon: Icons.email,
//                   hintText: 'Enter your email',
//                   iconData: Icons.email,
//                   onChange: () {},
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Cubits/EditProfilecubit/edit_profile_cubit_cubit.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => EditProfileCubitCubit(),
      child: BlocConsumer<EditProfileCubitCubit, EditProfileCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
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
                SizedBox(
                  height: size.height * 0.05,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => context.read<EditProfileCubitCubit>().pickImage(),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: context.read<EditProfileCubitCubit>().image != null
                          ? FileImage(File(context.read<EditProfileCubitCubit>().image!.path))
                          : null,
                      child: context.read<EditProfileCubitCubit>().image == null
                          ? const Icon(
                              Icons.camera_alt,
                              size: 50,
                              color: Colors.grey,
                            )
                          : null,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InputTextForm(
                              formValidator: context
                                  .read<EditProfileCubitCubit>()
                                  .fullNameValidator,
                              prefIcon: Icons.person,
                              hintText: 'Enter your Full Name',
                              iconData: Icons.person,
                              onChange: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InputTextForm(
                              formValidator: context
                                  .read<EditProfileCubitCubit>()
                                  .emailValidator,
                              prefixIcon: Icons.email,
                              prefIcon: Icons.email,
                              hintText: 'Enter your email',
                              iconData: Icons.email,
                              onChange: () {},
                            ),
                          ),
                             ElevatedBtn(
                              //minWidth: 200.0,
                              //minHeight: 20.0,
                              buttonText: "Edit ",
                              onPressed: () {
                           
                              },
                              backgroundColor: kbutton,
                              textColor: Kbackground,
                            ),
                        ],
                      ),
                    ],
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
