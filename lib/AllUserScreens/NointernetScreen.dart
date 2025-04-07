
import 'package:bpr602_cinema/AllUserScreens/spalshscreen.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/NoInternetcubit/no_internet_cubit.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lottie/lottie.dart';
class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Kbackground,
      body: BlocProvider(
        create: (context) => NoInternetCubit(),
        child: BlocConsumer<NoInternetCubit, NoInternetState>(
            listener: (context, state) {
          if (state is ConnectWithInternet) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const SplashScreen()),
                (route) => false);

            // AppConstants.showToast(
            //   context,
            //   'Connected Succses',
            // );
          }
        }, builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: size.height * 0.21),
                child: Lottie.asset(
                  'assets/svg/empty.json',
                  width: 350.sp,
                  height: 340.sp,
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Text(
                  'Please Cheake Your Connection ',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: size.height * 0.02),
                child: ElevatedBtn(
                  buttonText: 'Try Again',
                  backgroundColor: kbutton,
                  
                  onPressed: () {
                    context.read<NoInternetCubit>().onInit();
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}