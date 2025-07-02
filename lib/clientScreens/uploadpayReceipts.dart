
import 'dart:io';

import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Uploadpayreceiptscubit/uploadpayreceipts_cubit.dart';
import 'package:bpr602_cinema/clientScreens/payment.dart';
import 'package:bpr602_cinema/models/response/alluserbooking.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Uploadpayreceipts extends StatelessWidget {
  final int paymentid ;
  const Uploadpayreceipts({super.key, required this.paymentid});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => UploadpayreceiptsCubit(),
      child: BlocConsumer<UploadpayreceiptsCubit, UploadpayreceiptsState>(
        listener: (context, state) {
          // Handle upload and delete success/failure
          if (state is UploadImageSuccess) {
            //AppConstants.showToast(context, "Upload is Done ");
          } else if (state is UploadImageFailure) {
             if (state.message == "Session Is Done") {
            AppConstants.showToast(context, state.message);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          } else {
            AppConstants.showToast(context, state.message);
          }
          }

          if (state is deleteImageSuccess) {
            AppConstants.showToast(context, "Delete is Done ");
          } else if (state is DeleteImageFailure) {
            if (state.message == "Session Is Done") {
            AppConstants.showToast(context, state.message);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          } else {
            AppConstants.showToast(context, state.message);
          }
          }
          
          if (state is UploadSuccessState) {
            AppConstants.showToast(context, "Upload is Done " , icon: Icons.done , iconcolor: Colors.green);
            NavigationWidget.pushPage(
                                context,
                                 Payments(),
                              );
          } else if (state is UploadErrorState) {
            if (state.message == "Session Is Done") {
            AppConstants.showToast(context, state.message);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          } else {
            AppConstants.showToast(context, state.message);
          }
          }
          
        },
        builder: (context, state) {
          int? imageId;
          
          // Extract imageId if the upload is successful
          if (state is UploadImageSuccess) {
            imageId = state.imageId;  // Now imageId is available here
          }

          return Scaffold(
            backgroundColor: Kbackground,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Kbackground,
              title: const Text(
                'My Payments',
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
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      style: TextStyle(fontSize: 14.sp, color: Whitconst),
                      "Upload payment Receipts"),
                  SizedBox(height: size.height * 0.2),
                  Center(
                    child: GestureDetector(
                      onTap: () =>
                          context.read<UploadpayreceiptsCubit>().pickImage(),
                      child: Container(
                        width: size.width * 0.6, // Adjust as needed
                        height: size.width * 0.6, // Adjust as needed
                        decoration: BoxDecoration(
                          color: Colors.grey[800], // Background color
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                          border: Border.all(
                              color: Colors.grey[600]!, width: 1), // Border
                        ),
                        child: context.read<UploadpayreceiptsCubit>().image !=
                                null
                            ? Image.file(
                                File(context
                                    .read<UploadpayreceiptsCubit>()
                                    .image!
                                    .path),
                                fit: BoxFit.cover,
                              )
                            : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Pick Recipet",
                                      style: TextStyle(
                                          fontSize: 18.sp, color: Ktext),
                                    ),
                                    Icon(
                                      Icons
                                          .insert_photo, // Adjust icon as per design
                                      color: Colors.grey[500],
                                      size: 50, // Adjust size as needed
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.08),
                  ElevatedBtn(
                    buttonText: "Upload",
                    // onPressed: () {
                    //   context.read<UploadpayreceiptsCubit>().uploadImage();
                    // },
                    onPressed: () async {
  final cubit = context.read<UploadpayreceiptsCubit>();

  // فقط إذا تم اختيار صورة
  if (cubit.image != null) {
    await cubit.uploadImage();

    // إذا فشل رفع الصورة، لا تكملي
    if (cubit.imageId == null) {
      return;
    }

    // إذا نجح رفع الصورة، نتابع تعديل الملف الشخصي
    await cubit.uploadpayment(paymentid);
  }
  // إذا لم يتم اختيار صورة، لا نقوم بأي شيء
},

                    backgroundColor: kbutton,
                  ),
                  // Show Delete button only after successful upload
                  // if (imageId != null)  // Check if imageId is available
                  //   Padding(
                  //     padding: const EdgeInsets.only(top: 20),
                  //     child: ElevatedBtn(
                  //       buttonText: "Delete",
                  //       backgroundColor:const Color.fromARGB(255, 237, 88, 88),
                  //       onPressed: () {
                  //         context.read<UploadpayreceiptsCubit>().deleteImage(imageId!);  // Pass the imageId
                  //       },
                  //     ),
                  //   ),
                  // Show loading indicator when deleting image
                  // if (state is DelImageInProgress)
                  //   CircularProgressIndicator(),
                  // Show upload progress
                  if (state is UploadImageInProgress) 
                    CircularProgressIndicator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

