import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/otp.dart';
import 'package:bpr602_cinema/AllUserScreens/privecy.dart';
import 'package:bpr602_cinema/AllUserScreens/term.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/signUpCubit/signup_cubit.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

class SighnUpScreen extends StatelessWidget {
  const SighnUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupErrorState) {
            AppConstants.showToast(context, state.message);
          }
          //s2
          if (state is SignupAcceptState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OtpScreen(email: state.email)),
            );
          }
                     AppConstants.showToast(context, " 1 Step until you complete create account " , icon: Icons.done , iconcolor:  Colors.green);

        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Kbackground,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title: Text(
                  'Signup',
                  style: GoogleFonts.mulish(
                    textStyle: const TextStyle(color: Ktext),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              body: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hello Dear User",
                            style: GoogleFonts.mulish(
                              textStyle: const TextStyle(color: Ktext),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            "Let’s  Create your account ",
                            style: GoogleFonts.mulish(
                              textStyle: const TextStyle(color: Ktext),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Padding(
                        padding: EdgeInsets.all(size.height * 0.01),
                        child: Form(
                          key: context.read<SignupCubit>().formKey2,
                          child: Column(
                            children: [
                              InputTextForm(
                                formValidator: context
                                    .read<SignupCubit>()
                                    .fullNameValidator,
                                prefIcon: Icons.person,
                                hintText: 'Enter your Full Name',
                                iconData: Icons.person,
                                onChange: () {},
                              ),
                              InputTextForm(
                                formValidator:
                                    context.read<SignupCubit>().emailValidator,
                                prefixIcon: Icons.email,
                                prefIcon: Icons.email,
                                hintText: 'Enter your email',
                                iconData: Icons.email,
                                onChange: () {},
                              ),
                              InputTextForm(
                                formValidator: context
                                    .read<SignupCubit>()
                                    .passwordValidator,
                                hintText: 'Enter your password',
                                suffixPressed: () {
                                  context
                                      .read<SignupCubit>()
                                      .togglePasswordVisibility();
                                },
                                suffixIcon:
                                    context.read<SignupCubit>().isPasswordHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                suffIconColor: Colors.white,
                                showText: !context
                                    .read<SignupCubit>()
                                    .isPasswordHidden,
                                prefIcon: Icons.lock,
                                onChange: () {},
                              ),
                              InputTextForm(
                                prefIcon: Icons.lock,
                                formValidator: context
                                    .read<SignupCubit>()
                                    .confirmpasswordValidator,
                                prefixIcon: Icons.lock,
                                hintText: 'Confirm password',
                                suffixPressed: () {
                                  context
                                      .read<SignupCubit>()
                                      .togglePasswordVisibility();
                                },
                                suffixIcon:
                                    context.read<SignupCubit>().isPasswordHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                suffIconColor: Colors.white,
                                showText: !context
                                    .read<SignupCubit>()
                                    .isPasswordHidden,
                                onChange: () {},
                              ),
                              Padding(
                                padding: EdgeInsets.all(size.width * 0.03),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      value: context
                                          .read<SignupCubit>()
                                          .isAgreedToTerms,
                                      onChanged: (value) {
                                        context
                                            .read<SignupCubit>()
                                            .toggleAgreedToTerms();
                                      },
                                      activeColor: kbutton,
                                    ),
                                    // Flexible(
                                    //   child: Text(
                                    //     'I agree to the terms terms of Service and Privecy',
                                    //     style: TextStyle(
                                    //         color: Ktext, fontSize: 11.sp),
                                    //   ),
                                    // ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                              text: 'I agree to the ',
                                              style: TextStyle(
                                                  color: Ktext,
                                                  fontSize: 11.sp)),
                                          TextSpan(
                                            text: 'Terms of Service',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                decoration:
                                                    TextDecoration.underline),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            TermsScreen()));
                                              },
                                          ),
                                          TextSpan(
                                              text: ' and ',
                                              style: TextStyle(
                                                  color: Ktext,
                                                  fontSize: 11.sp)),
                                          TextSpan(
                                            text: 'Privacy Policy',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                decoration:
                                                    TextDecoration.underline),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            PrivacyPolicyScreen()));
                                              },
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ElevatedBtn(
                                //minWidth: 200.0,
                                //minHeight: 20.0,
                                buttonText: "SignUp",
                                onPressed: () {
                                  if (context
                                      .read<SignupCubit>()
                                      .fullNameValidator
                                      .controller
                                      .text
                                      .isEmpty) {
                                    AppConstants.showToast(
                                        context, 'full name is empety');
                                    return;
                                  } else if (context
                                      .read<SignupCubit>()
                                      .emailValidator
                                      .controller
                                      .text
                                      .isEmpty) {
                                    AppConstants.showToast(
                                        context, 'email is empety');
                                  } else if (context
                                      .read<SignupCubit>()
                                      .passwordValidator
                                      .controller
                                      .text
                                      .isEmpty) {
                                    AppConstants.showToast(
                                        context, 'password is empety');
                                  } else if (context
                                      .read<SignupCubit>()
                                      .confirmpasswordValidator
                                      .controller
                                      .text
                                      .isEmpty) {
                                    AppConstants.showToast(context,
                                        'confirmed password is empety');
                                  } else if (context
                                          .read<SignupCubit>()
                                          .passwordValidator
                                          .controller
                                          .text
                                          .length <
                                      8) {
                                    AppConstants.showToast(context,
                                        'Password should be 8 Char or More');
                                  } else if (context
                                          .read<SignupCubit>()
                                          .confirmpasswordValidator
                                          .controller
                                          .text
                                          .length <
                                      8) {
                                    AppConstants.showToast(context,
                                        'Confirm Password Should be 8 Char or More');
                                  } else if (!context
                                      .read<SignupCubit>()
                                      .formKey2
                                      .currentState!
                                      .validate()) {
                                  } else if (context
                                          .read<SignupCubit>()
                                          .confirmpasswordValidator
                                          .controller
                                          .text !=
                                      context
                                          .read<SignupCubit>()
                                          .passwordValidator
                                          .controller
                                          .text) {
                                    AppConstants.showToast(context,
                                        'password and confirm password not match');
                                  } else if (!context
                                      .read<SignupCubit>()
                                      .isAgreedToTerms) {
                                    AppConstants.showToast(
                                        context, 'You must Accept terms ');
                                  } else {
                                    context.read<SignupCubit>().register();
                                  }
                                },
                                backgroundColor: kbutton,
                                textColor: Kbackground,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'By creating an account, you accept Cinemate’s',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10.sp),
                                  ),
                                  Text(
                                    ' Terms of Service and Privacy Policy?',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 9.sp),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.001,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Already Have Account ?',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        NavigationWidget.pushPage(
                                            context, const LoginScreen());
                                      },
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(color: Ktext),
                                      ))
                                ],
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
