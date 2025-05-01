import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/verificationReset.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/ResetPaaswordCubit/reset_password_cubit.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String otp;
  final String email;
  const ResetPasswordScreen(
      {super.key, required this.email, required this.otp});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('Email: $email');
    print(' OTP: $otp');
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          print(
              "i am listener i am working $state ++++++++++++++++++++++++++++++++++++++++");
          // if (state is ResetpasswordErrorState) {
          //   AppConstants.showToast(context, state.message);
          // }
          if (state is ResetpasswordErrorState) {
  AppConstants.showToast(context, state.message);

  // إذا الخطأ سببه الرمز
  if (state.message.toLowerCase().contains('wrong code')) {
    // الرجوع إلى صفحة OTP
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => OtpScreenReset(email: email), // أو حسب اسم شاشتك
      ),
    );
  }
}

          

          if (state is ResetpasswordAcceptState) {
            AppConstants.showToast(context, "password reseted succesfully " , icon: Icons.done_rounded ,iconcolor: Colors.green);
            // print("before navigate");
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );

            //print("after navigate");
          }
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Kbackground,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title: Text(
                  'Reset Password',
                  style: GoogleFonts.mulish(
                    textStyle: const TextStyle(color: Ktext),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                leading: IconButton(
                  color: Ktext,
                  onPressed: () {
                    NavigationWidget.popPage(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              body: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.10,
                      ),
                      Text(
                        'Lets We Reset Your Password',
                        style: GoogleFonts.mulish(
                          textStyle: const TextStyle(color: Colors.white),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Dont Warry Dear',
                        style: GoogleFonts.mulish(
                          textStyle: const TextStyle(color: Colors.white),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(size.height * 0.01),
                        child: Form(
                          key: context.read<ResetPasswordCubit>().formKey3,
                          child: Column(
                            children: [
                              InputTextForm(
                                formValidator: context
                                    .read<ResetPasswordCubit>()
                                    .newpasswordValidator,
                                hintText: 'Enter your New password',
                                suffixPressed: () {
                                  context
                                      .read<ResetPasswordCubit>()
                                      .togglePasswordVisibility();
                                },
                                suffixIcon: context
                                        .read<ResetPasswordCubit>()
                                        .isPasswordHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                suffIconColor: Colors.white,
                                showText: !context
                                    .read<ResetPasswordCubit>()
                                    .isPasswordHidden,
                                prefIcon: Icons.lock,
                                onChange: () {},
                              ),
                              InputTextForm(
                                formValidator: context
                                    .read<ResetPasswordCubit>()
                                    .confirmpasswordValidator,
                                hintText: 'Confirm Your password',
                                suffixPressed: () {
                                  context
                                      .read<ResetPasswordCubit>()
                                      .togglePasswordVisibility();
                                },
                                suffixIcon: context
                                        .read<ResetPasswordCubit>()
                                        .isPasswordHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                suffIconColor: Colors.white,
                                showText: !context
                                    .read<ResetPasswordCubit>()
                                    .isPasswordHidden,
                                prefIcon: Icons.lock,
                                onChange: () {},
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              ElevatedBtn(
                                // minWidth: 200.0,
                                //minHeight: 20.0,
                                buttonText: "Reset",
                                onPressed: () {
                                  if (context
                                      .read<ResetPasswordCubit>()
                                      .newpasswordValidator
                                      .controller
                                      .text
                                      .isEmpty) {
                                    AppConstants.showToast(
                                        context, 'password is empety');
                                  } else if (context
                                      .read<ResetPasswordCubit>()
                                      .confirmpasswordValidator
                                      .controller
                                      .text
                                      .isEmpty) {
                                    AppConstants.showToast(context,
                                        'confirmed password is empety');
                                  } else if (context
                                          .read<ResetPasswordCubit>()
                                          .newpasswordValidator
                                          .controller
                                          .text !=
                                      context
                                          .read<ResetPasswordCubit>()
                                          .confirmpasswordValidator
                                          .controller
                                          .text) {
                                    AppConstants.showToast(context,
                                        'password and confirm password not match');
                                  } else if (!context
                                      .read<ResetPasswordCubit>()
                                      .formKey3
                                      .currentState!
                                      .validate()) {
                                  } else {
                                    context
                                        .read<ResetPasswordCubit>()
                                        .resetpassword(email, otp);
                                  }
                                },
                                backgroundColor: kbutton,
                                textColor: Kbackground,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ));
        },
      ),
    );
  }
}
