//
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
                  
                  GestureDetector(
  onTap: () => cubit.pickImage(),
  child: CircleAvatar(
    radius: 50,
    backgroundImage: cubit.image != null
        ? FileImage(File(cubit.image!.path))
        : (imageUrl != null
            ? NetworkImage('${LinksUrl.baseUrl}$imageUrl')
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
                    
                        await cubit.updateProfile();
                      },
                      backgroundColor: kbutton,
                    )
                    
                     
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
