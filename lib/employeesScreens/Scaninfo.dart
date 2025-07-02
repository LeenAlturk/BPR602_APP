import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/scaninfcubit/scaninfo_cubit.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';
class Scaninfo extends StatelessWidget {
  final String result;
  const Scaninfo({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) {
        final id = int.tryParse(result);
        final cubit = ScaninfoCubit();

        if (id != null) {
          cubit.getscanedinfo(id);
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              AppConstants.showToast(context, "Qr code not valid");
              Navigator.of(context).pop();
            }
          });
        }

        return cubit;
      },
      child: BlocConsumer<ScaninfoCubit, ScaninfoState>(
        listener: (context, state) {
          if (state is ScaneddetailesError) {
            if (state.message == "Session Is Done") {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            } else if (state.message == 'No Internet Connection') {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => NoInternetScreen()),
                  (route) => false);
            } else {
              AppConstants.showToast(context, state.message);
            }
          }
        },
        builder: (context, state) {
          final cubit = context.read<ScaninfoCubit>();
          if (state is Scaneddetailesloading) {
            return Scaffold(
              backgroundColor: Kbackground,
              body: Center(
                  child: CircularProgressIndicator(
                color: kbutton,
              )),
            );
          }
          if (cubit.getbookingbyidResponse!.data == null) {
            return Scaffold(
              backgroundColor: Kbackground,
              body: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: size.width * 0.3,
                      height: size.height * 0.4,
                      decoration: BoxDecoration(
                        color: ksmallActionColor,
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF303030), ksmallActionColor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/svg/scan.json',
                            width: size.width * 0.2,
                            height: size.height * 0.1,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            "Client Ticket Information",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 216, 207, 168),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // SizedBox(
                          //   height: size.height * 0.01,
                          // ),
                          Center(
                            child: Text(
                              "No info available",
                              style: TextStyle(
                                color: Ktext,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          if (state is ScaneddetailesAcceppt) {
            return Scaffold(
              backgroundColor: Kbackground,
              appBar: AppBar(
                backgroundColor: Kbackground,
                centerTitle: true,
                title: Text('QR Scan Result',
                    style: TextStyle(color: Colors.white)),
                automaticallyImplyLeading: true,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: kbutton,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: size.width * 0.9,
                      height: size.height * 0.6,
                      decoration: BoxDecoration(
                        color: ksmallActionColor,
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF303030), ksmallActionColor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/svg/scan.json',
                            width: size.width * 0.5,
                            height: size.height * 0.2,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            "Client Ticket Information",
                            style: TextStyle(
                              color:Colors.amber,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               Text(
                                " Booking Number: ${cubit.getbookingbyidResponse!.data!.id}",
                                style: TextStyle(
                                  color: Ktext,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                " Movie :${cubit.getbookingbyidResponse!.data!.movieTime!.movie!.name}",
                                style: TextStyle(
                                  color: Ktext,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                " Number of person ${cubit.getbookingbyidResponse!.data!.hallChairs!.length}",
                                style: TextStyle(
                                  color: Ktext,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                               
                              Text(
                                ' ${ DateFormat('yyyy-MM-dd').format(
                                                DateTime.parse(cubit.getbookingbyidResponse!.data!.bookingDate
                                                    .toString()))}   |   ${cubit.getbookingbyidResponse!.data!.movieTime!.time!}',
                                style: TextStyle(
                                  color: Ktext,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                " Chaires ${cubit.getbookingbyidResponse!.data!.hallChairs!.map((e) => e.code).join(', ')}",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                ),
                              ),
                               Text(
                                " Hall: ${cubit.getbookingbyidResponse!.data!.movieTime!.hall!.name}",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
