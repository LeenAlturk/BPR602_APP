import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Animation/Scaletransation.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/userbookincubit/userbooking_cubit.dart';
import 'package:bpr602_cinema/clientScreens/payment.dart';
import 'package:bpr602_cinema/clientScreens/ticket.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class UserBooking extends StatelessWidget {
  const UserBooking({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => UserbookingCubit()..getbookings(),
      child: BlocConsumer<UserbookingCubit, UserbookingState>(
        listener: (context, state) {
          if (state is BookingdatakeRROR) {
            if (state.message == "Session Is Done") {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            } else if (state.message == "No Internet Connection") {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => NoInternetScreen()),
                  (route) => false);
            } else {
              AppConstants.showToast(context, state.message);
            }
          }
          if (state is DeleteBookingAccept) {
            AppConstants.showToast(context, "Delete Booking Done",
                icon: Icons.done, iconcolor: Colors.green);
          } else if (state is DeleteBookingError) {
            AppConstants.showToast(context, state.message);
          }
        },
        builder: (context, state) {
          final cubit = context.read<UserbookingCubit>();
          Size size = MediaQuery.of(context).size;
          return Scaffold(
            backgroundColor: Kbackground,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Kbackground,
              title: Text('My Bookings', style: TextStyle(color: Ktext)),
              actions: [
                Padding(
                  padding: EdgeInsets.all(size.height * 0.01),
                  child: IconButton(
                    onPressed: () {
                      NavigationWidget.pushPage(context, Payments());
                    },
                    icon: Icon(Icons.payment, color: Colors.white),
                  ),
                ),
              ],
              automaticallyImplyLeading: false,
            ),
            body: Builder(
              builder: (_) {
                if (state is Bookinguserloading && cubit.userbooking.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is BookingdataAccept && cubit.userbooking.isEmpty) {
                  return RefreshIndicator(
                    onRefresh: () => cubit.refreshBookings(),
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        SizedBox(height: size.height * 0.25),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.event_busy,
                                  color: Colors.white70, size: 80),
                              SizedBox(height: 16),
                              Text(
                                "You don't have any booking yet",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => cubit.refreshBookings(),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: cubit.userbooking.length +
                              (cubit.hasMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index < cubit.userbooking.length) {
                              final booking = cubit.userbooking[index];

                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01,
                                  horizontal: size.width * 0.04,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ksmallActionColor,
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color.fromARGB(255, 22, 27, 54),
                                        ksmallActionColor,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(size.width * 0.04),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Booking Number : ${booking.id}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kbutton,
                                          fontSize: size.width * 0.045,
                                        ),
                                      ),
                                      const Divider(thickness: 1),
                                      Row(
                                        children: [
                                          Text('Hall :',
                                              style: TextStyle(
                                                  color: Ktext,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              ' ${booking.movieTime!.hall!.name}',
                                              style:
                                                  TextStyle(color: Whitconst)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Total Price : ',
                                              style: TextStyle(
                                                  color: Ktext,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold)),
                                          Text(' ${booking.totalPrice} SYP',
                                              style:
                                                  TextStyle(color: Whitconst)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Date : ',
                                              style: TextStyle(
                                                  color: Ktext,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                            DateFormat('yyyy-MM-dd').format(
                                                DateTime.parse(booking
                                                    .bookingDate!
                                                    .toString())),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Time : ',
                                              style: TextStyle(
                                                  color: Ktext,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold)),
                                          Text('${booking.movieTime!.time}',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                backgroundColor: Kbackground,
                                                title: const Text(
                                                  "Confirm Deletion",
                                                  style:
                                                      TextStyle(color: Ktext),
                                                ),
                                                content: const Text(
                                                  "Are you sure you want to delete this booking?",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(ctx),
                                                    child: const Text("Cancel",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .amberAccent)),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(ctx);
                                                      cubit.deletebooking(
                                                          booking.id!);
                                                    },
                                                    child: const Text("Delete",
                                                        style: TextStyle(
                                                            color: Colors.red)),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Delete Booking",
                                            style: TextStyle(
                                              fontSize: size.width * 0.04,
                                              color: subMain,
                                            ),
                                          ),
                                        ),
                                        
                                      ),
                                        Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {
                                             NavigationWidget.pushPage(
            context,
             Tickets(bookingid: booking.id!,),
          );
                                          },
                                          child: Text(
                                            "view ticket",
                                            style: TextStyle(
                                              fontSize: size.width * 0.04,
                                              color: kbutton,
                                            ),
                                          ),
                                        ),
                                        
                                      )
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              // تحميل المزيد
                              cubit.getbookings();
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
