import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/AllUserScreens/WellcomeScreen.dart';
import 'package:bpr602_cinema/AllUserScreens/onboardingScreens/onboardingScreens.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Cubits/splashcubit/splash_cubit.dart';
import 'package:bpr602_cinema/clientScreens/Home.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()
        ..checkFirstOpen()
        ..onInit(),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          final splashCubit = context.read<SplashCubit>();
          Widget nextScreen;

          if (splashCubit.isInternet == false) {
            nextScreen = const NoInternetScreen();
          } else if (splashCubit.isFirstOpen == null) {
            nextScreen = const Onboarding();
            print(splashCubit.isFirstOpen);
          } else if (splashCubit.isFirstOpen == '1') {
            nextScreen = const WellcomeScreen();
             print(splashCubit.isFirstOpen);
          } else if (splashCubit.isFirstOpen == '2') {
            nextScreen = const LoginScreen();
                  print(splashCubit.isFirstOpen);
          }else {
            nextScreen = const Onboarding();
          }
           

          return SafeArea(
            child: Scaffold(
              backgroundColor: Kbackground,
              body: AnimatedSplashScreen(
                duration: 2000,
                splash: Center(
                    child: Lottie.asset(
                  'assets/svg/LmLM4VhriI.json',
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.3,
                )),
                nextScreen: nextScreen,
                splashTransition: SplashTransition.fadeTransition,
                splashIconSize: double.infinity,
                backgroundColor: Kbackground,
              ),
            ),
          );
        },
      ),
    );
  }
}
