import 'package:bpr602_cinema/AllUserScreens/Cheackemail.dart';
import 'package:bpr602_cinema/AllUserScreens/Sighnup.dart';
import 'package:bpr602_cinema/Animation/Fadeinfadeout.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/loginCubit/login_cubit.dart';
import 'package:bpr602_cinema/clientScreens/indexedstackclientnav.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/employeesScreens/indexedStackEmp.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DataStore.instance.setNumOpenApp("2");
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LogInAcceptState) {
            NavigationWidget.pushPage(
                context,
                const IndexedStackTeacherScreen(
                  initialIndex: 0,
                ));
          }
          if(state is LogInscannerAcceptState){
NavigationWidget.pushPage(
                context,
                const IndexedStackEmprScreen(
                  initialIndex: 0,
                ));
          }
          if (state is LogInErrorState) {
            //AppConstants.showToast(context, state.message);
          }
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Kbackground,
              appBar: AppBar(
                automaticallyImplyLeading: false, 
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title: Text(
                  'Login Screen',
                  style: GoogleFonts.mulish(
                    textStyle: const TextStyle(color: Ktext),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              body: Form(
                key: context.read<LoginCubit>().formKeyLogin,
                child: ListView(
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
                              "Hi , Leen ",
                              style: GoogleFonts.mulish(
                                textStyle: const TextStyle(color: Ktext),
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              "Welcome back ! ",
                              style: GoogleFonts.mulish(
                                textStyle:  TextStyle(color: kbutton),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Please enter your account ",
                              style: GoogleFonts.mulish(
                                textStyle: const TextStyle(color: kbutton),
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
                          child: Column(
                            children: [
                              InputTextForm(
                                formValidator: context
                                    .read<LoginCubit>()
                                    .emailValidatorLogin,
                                prefixIcon: Icons.email,
                                prefIcon: Icons.email,
                                hintText: 'Enter your email',
                                iconData: Icons.email,
                                onChange: () {},
                              ),
                              InputTextForm(
                                formValidator: context
                                    .read<LoginCubit>()
                                    .passwordValidatorLogin,
                                hintText: 'Enter your password',
                                suffixPressed: () {
                                  context
                                      .read<LoginCubit>()
                                      .togglePasswordVisibility();
                                },
                                suffixIcon:
                                    context.read<LoginCubit>().isPasswordHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                suffIconColor: Colors.white,
                                showText: !context
                                    .read<LoginCubit>()
                                    .isPasswordHidden,
                                prefIcon: Icons.lock,
                                onChange: () {},
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(
                                    vertical: size.height * 0.002, horizontal: size.width * 0.1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        NavigationWidget.pushPage(
                                            context, const Cheackemail());
                                      },
                                      child: const Text(
                                        style: TextStyle(color: Ktext),
                                        "Forget Password ?",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              state is LogInAwaitState
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : ElevatedBtn(
                                      buttonText: "Login",
                                      onPressed: () {
                                        // NavigationWidget.pushPage(
                                        //     context,
                                        //     const IndexedStackTeacherScreen(
                                        //       initialIndex: 0,
                                        //     )
                                                
                                        //    //IndexedStackEmprScreen(initialIndex: 0,)
                                        //     );
                                        if (context
                                            .read<LoginCubit>()
                                            .emailValidatorLogin
                                            .controller
                                            .text
                                            .isEmpty) {
                                          AppConstants.showToast(
                                              context,
                                              'email empety');
                                          return;
                                        } else if (context
                                            .read<LoginCubit>()
                                            .passwordValidatorLogin
                                            .controller
                                            .text
                                            .isEmpty) {
                                          AppConstants.showToast(
                                              context,
                                              'password empety');
                                        } else if (!context
                                            .read<LoginCubit>()
                                            .formKeyLogin
                                            .currentState!
                                            .validate()) {
                                        } else {
                                          context.read<LoginCubit>().login();
                                          
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
                                height: size.height * 0.1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Do not Have Account ?',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        NavigationWidget.pushPage(
                                            context, const SighnUpScreen());

                                      },
                                      child: const Text(
                                        'Sign Up',
                                        style: TextStyle(color: Ktext),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
