
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/ResetPaaswordCubit/reset_password_cubit.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          // TODO: implement listener
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
                  ),),
                  Text(
                  'Your Password!!',
                  style: GoogleFonts.mulish(
                    textStyle: const TextStyle(color: Colors.white),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),),
                      SizedBox(
                        height: size.height * 0.10,
                      ),
                      Padding(
                        padding:  EdgeInsets.all(size.height * 0.01),
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
                              onPressed: () {},
                              backgroundColor: kbutton,
                              textColor: Kbackground,
                            ),
                          ],
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
