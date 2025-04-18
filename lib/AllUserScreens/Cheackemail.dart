
import 'package:bpr602_cinema/AllUserScreens/verificationReset.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/cheackemailCubit/cheackemail_cubit.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Cheackemail extends StatelessWidget {
  const Cheackemail({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CheackemailCubit(),
      child: BlocConsumer<CheackemailCubit, CheackemailState>(
        listener: (context, state) {
          print(
              "i am listener i am working $state ++++++++++++++++++++++++++++++++++++++++");
          if (state is CheackemailErrorState) {
            AppConstants.showToast(context, state.message);
          }

          if (state is CheackemailAcceptState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) =>
                      OtpScreenReset(email: state.email)),
            );

            print("after navigate");
          }
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Kbackground,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title: Text(
                  'verify Email',
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Verify",
                            style: GoogleFonts.mulish(
                              textStyle: const TextStyle(color: Ktext),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            "it's you",
                            style: GoogleFonts.mulish(
                              textStyle:
                                  const TextStyle(color: Ktext),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            //Please enter your account
                          ),
                          Text(
                            "Please enter your Email ",
                            style: GoogleFonts.mulish(
                              textStyle:
                                  const TextStyle(color: Ktext),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                      Padding(
                        padding:  EdgeInsets.all(size.height * 0.01),
                        child: Form(
                           key: context.read<CheackemailCubit>().formKey1,
                          child: Column(
                            children: [
                              InputTextForm(
                                formValidator: context
                                    .read<CheackemailCubit>()
                                    .emailValidatorcheack,
                                prefixIcon: Icons.email,
                                prefIcon: Icons.email,
                                hintText: 'Enter your email',
                                iconData: Icons.email,
                                onChange: () {},
                              ),
                                state is CheackemailAwaitState
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : ElevatedBtn(
                                //minWidth: 200.0,
                                //minHeight: 20.0,
                                buttonText: "Confirm",
                                onPressed: () {
                                  if (context
                                                .read<CheackemailCubit>()
                                                .emailValidatorcheack
                                                .controller
                                                .text
                                                .isNotEmpty ) {
                                              context
                                                  .read<CheackemailCubit>()
                                                  .resetsentCode();
                                            } else {
                                              AppConstants.showToast(
                                                  context, "Email is Empty");
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
