import 'dart:async';

import 'package:bpr602_cinema/AllUserScreens/ResetPassword.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/OTPCubit/otp_cubit.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreenReset extends StatelessWidget {
  final String email ;
   OtpScreenReset({super.key , required this.email});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => OtpCubit(),
      child: BlocConsumer<OtpCubit, OtpState>(
        listener: (context, state) {
          // TODO: implement listener for different OTP states
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Kbackground,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'OTP Verify',
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
                    SizedBox(height: size.height * 0.10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Verifying your Account",
                          style: GoogleFonts.mulish(
                            textStyle: const TextStyle(color: Ktext),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          "We have just sent you a 4-digit code",
                          style: GoogleFonts.mulish(
                            textStyle: const TextStyle(color: Colors.white),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "via your email",
                          style: GoogleFonts.mulish(
                            textStyle: const TextStyle(color: Colors.white),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.08),
                    Padding(
                      padding:  EdgeInsets.all(size.height * 0.01),
                      child: TimerContainer(
                        otpCode: context.read<OtpCubit>().otp,
                        isresendsuc: context.read<OtpCubit>().resendSuc,
                        onComplateWriteotp: () {
                           final otpValue = context.read<OtpCubit>().otp.text;
                          // Call function when OTP is completed
                          // Clear the OTP field and navigate to the next screen
                          //context.read<OtpCubit>().otp.clear();
                          NavigationWidget.pushPage(
                            context,
                             ResetPasswordScreen(email: email ,otp: otpValue,),
                          );
                        },
                        onResendCodePress: () {
                           context.read<OtpCubit>().resendCode(email);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TimerContainer extends StatefulWidget {
  final TextEditingController otpCode;
  final Function onComplateWriteotp;
  final Function onResendCodePress;
  final bool isresendsuc;

  const TimerContainer({
    super.key,
    required this.otpCode,
    required this.onComplateWriteotp,
    required this.onResendCodePress,
    required this.isresendsuc,
  });

  @override
  _TimerContainerState createState() => _TimerContainerState();
}

class _TimerContainerState extends State<TimerContainer> {
  late Timer _timer;
  int _timerDuration = 30;
  String _enteredCode = '';

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerDuration > 0) {
        setState(() {
          _timerDuration--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  void resendpressed() {
    setState(() {
      _timerDuration = 30;
      _enteredCode = '';
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OtpTextField(
              keyboardType: TextInputType.text,
              cursorColor: Colors.white,
              numberOfFields: 6,
              showFieldAsBox: true,
              filled: true,
              fieldWidth: size.width * 0.12,
              borderWidth: size.height * 0.002,
              borderColor: const Color.fromARGB(255, 168, 45, 49),
              borderRadius: BorderRadius.circular(12),
              autoFocus: true,
              onSubmit: (code) {
                setState(() {
                  widget.otpCode.text = code;
                });
              },
              focusedBorderColor: Colors.white,
              enabledBorderColor: kbutton,
              fillColor: ksmallActionColor,
              textStyle: TextStyle(
                fontSize: 18.sp,
                color: Ktext,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$_timerDuration Seconds",
                  style: TextStyle(
                    color: Ktext,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 20),
                CircularProgressIndicator(
                  color: kbutton,
                  strokeWidth: 4,
                  value: (_timerDuration / 30),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Didn't receive any code?",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Ktext,
                  ),
                ),
                ElevatedButton(
                  onPressed: _timerDuration == 0
                      ? () async {
                          await widget.onResendCodePress();
                          if (widget.isresendsuc) {
                            resendpressed();
                          }
                          resendpressed();
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      _timerDuration == 0 ? kbutton : Colors.grey,
                    ),
                    textStyle: WidgetStateProperty.all(
                        const TextStyle(fontSize: 16, color: Ktext)),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    )),
                  ),
                  child: Text(
                    _timerDuration == 0 ? "Resend" : "wait seconds",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: _timerDuration == 0
                            ? ksmallActionColor
                            : const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // ElevatedBtn(
            //   // minWidth: 200.0,
            //   // minHeight: 20.0,
            //   buttonText: "Confirm",
            //   onPressed: () {
            //     widget.onComplateWriteotp();
            //   },
            //   backgroundColor: kbutton,
            //   textColor: Kbackground,
            // ),
            ElevatedBtn(
  buttonText: "Confirm",
  onPressed: () {
    if (widget.otpCode.text.length == 6) {
      widget.onComplateWriteotp();
    } else {
      AppConstants.showToast(context, "Please enter the 6-digit code", icon: Icons.warning, iconcolor: Colors.orange);
    }
  },
  backgroundColor: kbutton,
  textColor: Kbackground,
),

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    widget.otpCode.dispose();
    super.dispose();
  }
}
