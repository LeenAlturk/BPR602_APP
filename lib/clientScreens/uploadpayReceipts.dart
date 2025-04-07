import 'dart:io';

import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Uploadpayreceiptscubit/uploadpayreceipts_cubit.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Uploadpayreceipts extends StatelessWidget {
  const Uploadpayreceipts({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => UploadpayreceiptsCubit(),
      child: BlocConsumer<UploadpayreceiptsCubit, UploadpayreceiptsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
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
                      SizedBox(height: size.height*0.2),
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
                                  Text("Pick  Recipet" ,  style: TextStyle( fontSize:18.sp , color:  Ktext), ),
                                  Icon(
                                      Icons.insert_photo, // Adjust icon as per design
                                      color: Colors.grey[500],
                                      size: 50, // Adjust size as needed
                                    ),
                                ],
                              ),
                            ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.08,),
                  ElevatedBtn(buttonText: "Upload" , onPressed: (){},
                   backgroundColor: kbutton,
                   
                   )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
