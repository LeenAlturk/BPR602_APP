// import 'package:bpr602_cinema/Constants/colors.dart';
// import 'package:bpr602_cinema/Constants/sizer.dart';
// import 'package:bpr602_cinema/Cubits/Billcubit/bill_cubit.dart';
// import 'package:bpr602_cinema/Cubits/bookingCubit/booking_cubit.dart';
// import 'package:bpr602_cinema/clientScreens/indexedstackclientnav.dart';
// import 'package:bpr602_cinema/clientScreens/payment.dart';
// import 'package:bpr602_cinema/data/link.dart';
// import 'package:bpr602_cinema/wedgets/Navigating.dart';
// import 'package:bpr602_cinema/wedgets/itembill.dart';
// import 'package:bpr602_cinema/wedgets/itembillassets.dart';
// import 'package:bpr602_cinema/wedgets/itemsnakcsbill.dart';
// import 'package:bpr602_cinema/wedgets/toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';

// /// Bill Screen
// class Bill extends StatelessWidget {
//   // final String title;
//   // final String imgurl;
//   // final int totalpriceseat;

//   const Bill({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final booking = context.watch<BookingCubit>().state as BookingDataState;

//     return BlocProvider(
//       create: (_) => BillCubit(),
//       child: Scaffold(
//         backgroundColor: Kbackground,
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             'My Bill',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 15.sp,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           backgroundColor: Kbackground,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios, color: kbutton),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//         ),
//         body: ListView(
//           children: [
//             Column(
//               children: [
//                 // itemBookingSeatbill(
//                 //   size: size,
//                 //   imgurl: "https://m.media-amazon.com/images/M/MV5BMTQxNzY1MjI5NF5BMl5BanBnXkFtZTcwNTI0MDY1OQ@@._V1_QL75_UX380_CR0,20,380,562_.jpg",
//                 //   title: "Minions",
//                 //   price: 100,
//                 //   date: '12-10-2024',
//                 //   Seat: 'C7 , C8 , C9 ,',
//                 // ),

//                 itemBookingSeatbill(
//                   size: size,
//                   imgurl: booking.selectedMovie?.image?.url != null
//                       ? '${LinksUrl.baseUrl}${booking.selectedMovie!.image!.url}'
//                       : 'https://ina.iq/eng/uploads/posts/2021-05/thumbs/upload_1621342522_427621977.png',

//                   title: booking.selectedMovie?.name ?? 'No Movie Selected',
//                   price: booking.movietotalprice!,
//                   date: booking.selectedDate
//                           ?.toIso8601String()
//                           .split("T")
//                           .first ??
//                       '',
//                   Seat: booking.selectedSeats.map((type) => type.id ?? '').join(
//                       ', '), // يمكن لاحقًا تخزينها أيضًا داخل BookingCubit
//                 ),

//                 SizedBox(
//                   height: 15,
//                 ),
//                 // itemSnacksbill(
//                 //   size: size,
//                 //   imgurl:
//                 //       'https://pbs.twimg.com/media/E6Zx776XoAM-1i5?format=jpg&name=4096x4096',
//                 //   title: "Nachose",
//                 //   price: 100,
//                 //   quantity: "2",
//                 // ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Selected Snacks',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 10),

//                       // ListView لعرض السناكات
//                       if (booking.selectedSnacks.isNotEmpty)
//                         Container(
//                           height: booking.selectedSnacks.length *
//                               90.0, // ارتفاع ديناميكي حسب عدد السناكات
//                           child: ListView.builder(
//                             physics:
//                                 NeverScrollableScrollPhysics(), // لمنع التمرير الداخلي
//                             itemCount: booking.selectedSnacks.length,
//                             itemBuilder: (context, index) {
//                               final snack = booking.selectedSnacks[index];
//                               return Column(
//                                 children: [
//                                   itemSnacksbill(
//                                     size: size,
//                                     imgurl: snack.snackimg,
//                                     title: snack.title,
//                                     price: snack.price,
//                                     quantity: snack.quantity.toString(),
//                                   ),
//                                   SizedBox(height: 8),
//                                 ],
//                               );
//                             },
//                           ),
//                         )
//                       else
//                         Text(
//                           'No snacks selected',
//                           style: TextStyle(color: Colors.grey),
//                         )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: Divider(
//                     thickness: 2,
//                     color: Whitconst,
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(
//                       'Total :',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           '${booking.totalPrice} .IQD',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 15.sp,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(width: size.width * 0.03),
//                         PhosphorIcon(
//                           Icons.price_check_rounded,
//                           color: Colors.green,
//                         )
//                       ],
//                     ),
//                   ],
//                 ),

//                 _buildPaymentOptions(size),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPaymentOptions(Size size) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
//       child: BlocBuilder<BillCubit, BillState>(
//         builder: (context, state) {
//           if (state is PaymentState) {
//             return Column(
//               children: [
//                 ListTile(
//                   title: Text(
//                     "Pay Cash",
//                     style: TextStyle(color: Whitconst, fontSize: 12.sp),
//                   ),
//                   leading: Radio<String>(
//                     value: "Pay Cash",
//                     groupValue:
//                         state.selectedMethod, // Access selectedMethod here
//                     onChanged: (value) {
//                       context.read<BillCubit>().selectPaymentMethod(value!);
//                     },
//                     activeColor: kbutton,
//                   ),
//                 ),
//                 ListTile(
//                   title: Text(
//                     "Pay By Bank",
//                     style: TextStyle(color: Whitconst, fontSize: 12.sp),
//                   ),
//                   leading: Radio<String>(
//                     value: "Pay By Bank",
//                     groupValue:
//                         state.selectedMethod, // Access selectedMethod here
//                     onChanged: (value) {
//                       context.read<BillCubit>().selectPaymentMethod(value!);
//                     },
//                     activeColor: kbutton,
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     final selectedMethod = state.selectedMethod;
//                     final bookingCubit = context.read<BookingCubit>();

//                     if (selectedMethod.isEmpty) {
//                       AppConstants.showToast(
//                         context,
//                         "You must choose a payment method",
//                       );
//                     } else {
//                       // طباعة تفاصيل الحجز
//                       bookingCubit.printBookingDetails();

//                       // طباعة إضافية للتأكد من البيانات
//                       print('\n----- Additional Debug Info -----');
//                       final bookingState =
//                           bookingCubit.state as BookingDataState;
//                       print('Full Booking State: ${bookingState.toString()}');

//                       NavigationWidget.pushPage(
//                         context,
//                         const IndexedStackTeacherScreen(
//                           initialIndex: 2,
//                         ),
//                       );
//                     }
//                   },
//                   style: ButtonStyle(
//                     backgroundColor: WidgetStateProperty.all<Color>(kbutton),
//                     padding: WidgetStateProperty.all<EdgeInsets>(
//                       EdgeInsets.symmetric(
//                         vertical: size.height * 0.015,
//                         horizontal: size.width * 0.3,
//                       ),
//                     ),
//                   ),
//                   child: Text(
//                     " Move to payments",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 12.sp,
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           } else {
//             // Handle the initial state or other states
//             return Center(child: Text("Loading..."));
//           }
//         },
//       ),
//     );
//   }
// }
// import 'package:bpr602_cinema/Constants/colors.dart';
// import 'package:bpr602_cinema/Constants/sizer.dart';
// import 'package:bpr602_cinema/Cubits/Billcubit/bill_cubit.dart';
// import 'package:bpr602_cinema/Cubits/bookingCubit/booking_cubit.dart';
// import 'package:bpr602_cinema/clientScreens/indexedstackclientnav.dart';
// import 'package:bpr602_cinema/data/link.dart';
// import 'package:bpr602_cinema/wedgets/Navigating.dart';
// import 'package:bpr602_cinema/wedgets/itembill.dart';
// import 'package:bpr602_cinema/wedgets/itemsnakcsbill.dart';
// import 'package:bpr602_cinema/wedgets/toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';

// class Bill extends StatelessWidget {
//   const Bill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final booking = context.watch<BookingCubit>().state as BookingDataState;

//     return BlocProvider(
//       create: (_) => BillCubit(),
//       child: Scaffold(
//         backgroundColor: Kbackground,
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             'My Bill',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 15.sp,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           backgroundColor: Kbackground,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios, color: kbutton),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               // Movie Booking Details
//               itemBookingSeatbill(
//                 size: size,
//                 imgurl: booking.selectedMovie?.image?.url != null
//                     ? '${LinksUrl.baseUrl}${booking.selectedMovie!.image!.url}'
//                     : 'https://ina.iq/eng/uploads/posts/2021-05/thumbs/upload_1621342522_427621977.png',
//                 title: booking.selectedMovie?.name ?? 'No Movie Selected',
//                 price: booking.movietotalprice!,
//                 date: booking.selectedDate?.toIso8601String().split("T").first ?? '',
//                 Seat: booking.selectedSeats.map((type) => type.id ?? '').join(', '),
//               ),

//               const SizedBox(height: 15),
              
//               // Snacks Section
//               _buildSnacksSection(size, booking),
              
//               const Padding(
//                 padding: EdgeInsets.all(2.0),
//                 child: Divider(
//                   thickness: 1,
//                   color: Whitconst,
//                 ),
//               ),

//               // Total Price
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     'Total :',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '${booking.totalPrice} .IQD',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 15.sp,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(width: size.width * 0.03),
//                       // const PhosphorIcon(
//                       //   PhosphorIcons.priceCheck,
//                       //   color: Colors.green,
//                       // )
//                     ],
//                   ),
//                 ],
//               ),

//               // Payment Options
//               _buildPaymentOptions(size),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSnacksSection(Size size, BookingDataState booking) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Selected Snacks (${booking.selectedSnacks.length})',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16.sp,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),
          
//           if (booking.selectedSnacks.isNotEmpty)
//             ConstrainedBox(
//               constraints: BoxConstraints(
//                 maxHeight: 300, // Maximum height before scrolling
//               ),
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 physics: const ClampingScrollPhysics(),
//                 itemCount: booking.selectedSnacks.length,
//                 itemBuilder: (context, index) {
//                   final snack = booking.selectedSnacks[index];
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 8),
//                     child: itemSnacksbill(
//                       size: size,
//                       imgurl: snack.snackimg,
//                       title: snack.title,
//                       price: snack.price,
//                       quantity: snack.quantity.toString(),
                      
//                     ),
//                   );
//                 },
//               ),
//             )
//           else
//             Text(
//               'No snacks selected',
//               style: TextStyle(color: Colors.grey),
//             ),
          
//           const SizedBox(height: 10),
         
//         ],
//       ),
//     );
//   }

//   Widget _buildPaymentOptions(Size size) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
//       child: BlocBuilder<BillCubit, BillState>(
//         builder: (context, state) {
//           if (state is PaymentState) {
//             return Column(
//               children: [
//                 ListTile(
//                   title: Text(
//                     "Pay Cash",
//                     style: TextStyle(color: Whitconst, fontSize: 12.sp),
//                   ),
//                   leading: Radio<String>(
//                     value: "Pay Cash",
//                     groupValue: state.selectedMethod,
//                     onChanged: (value) {
//                       context.read<BillCubit>().selectPaymentMethod(value!);
//                     },
//                     activeColor: kbutton,
//                   ),
//                 ),
//                 ListTile(
//                   title: Text(
//                     "Pay By Bank",
//                     style: TextStyle(color: Whitconst, fontSize: 12.sp),
//                   ),
//                   leading: Radio<String>(
//                     value: "Pay By Bank",
//                     groupValue: state.selectedMethod,
//                     onChanged: (value) {
//                       context.read<BillCubit>().selectPaymentMethod(value!);
//                     },
//                     activeColor: kbutton,
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     final selectedMethod = state.selectedMethod;
//                     final bookingCubit = context.read<BookingCubit>();

//                     if (selectedMethod.isEmpty) {
//                       AppConstants.showToast(
//                         context,
//                         "You must choose a payment method",
//                       );
//                     } else {
//                       bookingCubit.printBookingDetails();
//                       print('\n----- Additional Debug Info -----');
//                       final bookingState = bookingCubit.state as BookingDataState;
//                       print('Full Booking State: ${bookingState.toString()}');
                      
//                       NavigationWidget.pushPage(
//                         context,
//                         const IndexedStackTeacherScreen(
//                           initialIndex: 2,
//                         ),
//                       );
//                     }
//                   },
//                   style: ButtonStyle(
//                     backgroundColor: WidgetStateProperty.all<Color>(kbutton),
//                     padding: WidgetStateProperty.all<EdgeInsets>(
//                       EdgeInsets.symmetric(
//                         vertical: size.height * 0.015,
//                         horizontal: size.width * 0.3,
//                       ),
//                     ),
//                   ),
//                   child: Text(
//                     "Move to payments",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 12.sp,
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           } else {
//             return const Center(child: Text("Loading..."));
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Billcubit/bill_cubit.dart';
import 'package:bpr602_cinema/Cubits/bookingCubit/booking_cubit.dart';
import 'package:bpr602_cinema/clientScreens/indexedstackclientnav.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/itembill.dart';
import 'package:bpr602_cinema/wedgets/itemsnakcsbill.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Bill extends StatelessWidget {
  const Bill({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final booking = context.watch<BookingCubit>().state as BookingDataState;

    return BlocProvider(
      create: (_) => BillCubit(),
      child: Scaffold(
        backgroundColor: Kbackground,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Bill',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Kbackground,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: kbutton),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Movie Booking Details
              itemBookingSeatbill(
                size: size,
                imgurl: booking.selectedMovie?.image?.url != null
                    ? '${LinksUrl.baseUrl}${booking.selectedMovie!.image!.url}'
                    : 'https://ina.iq/eng/uploads/posts/2021-05/thumbs/upload_1621342522_427621977.png',
                title: booking.selectedMovie?.name ?? 'No Movie Selected',
                price: booking.movietotalprice!,
                date: booking.selectedDate?.toIso8601String().split("T").first ?? '',
                Seat: booking.selectedSeats.map((type) => type.id ?? '').join(', '),
              ),

              const SizedBox(height: 15),
              
              // Snacks Section
              _buildSnacksSection(size, booking),
              
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: Divider(
                  thickness: 2,
                  color: Whitconst,
                ),
              ),

              // Price Breakdown
              _buildPriceBreakdown(size, booking),

              // Payment Options
              _buildPaymentOptions(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSnacksSection(Size size, BookingDataState booking) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            
              Text(
                'Selected Snacks (${booking.selectedSnacks.length})',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          
          if (booking.selectedSnacks.isNotEmpty)
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 300,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: booking.selectedSnacks.length,
                itemBuilder: (context, index) {
                  final snack = booking.selectedSnacks[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: itemSnacksbill(
                      size: size,
                      imgurl: snack.snackimg,
                      title: snack.title,
                      price: snack.price,
                      quantity: snack.quantity.toString(),
                    ),
                  );
                },
              ),
            )
          else
            Text(
              'No snacks selected',
              style: TextStyle(color: Colors.grey),
            ),
          
          const SizedBox(height: 10),
        ],
      ),
    );
  }
Widget _buildPriceBreakdown(Size size, BookingDataState booking) {
  final moviePrice = booking.movietotalprice ?? 0;
  final snacksPrice = booking.totalPrice - moviePrice;

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
    child: Column(
      children: [
        // Movie Price
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Movie Tickets:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
              Text(
                '$moviePrice IQD',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        
        // Snacks Price
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Snacks:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
              Text(
                '$snacksPrice IQD',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        
        // Divider
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Divider(
            color: Colors.white.withOpacity(0.3),
            thickness: 1,
          ),
        ),
        
        // Total Price
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${booking.totalPrice} IQD',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

  Widget _buildPaymentOptions(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
      child: BlocBuilder<BillCubit, BillState>(
        builder: (context, state) {
          if (state is PaymentState) {
            return Column(
              children: [
                ListTile(
                  title: Text(
                    "Pay Cash",
                    style: TextStyle(color: Whitconst, fontSize: 12.sp),
                  ),
                  leading: Radio<String>(
                    value: "Pay Cash",
                    groupValue: state.selectedMethod,
                    onChanged: (value) {
                      context.read<BillCubit>().selectPaymentMethod(value!);
                    },
                    activeColor: kbutton,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Pay By Bank",
                    style: TextStyle(color: Whitconst, fontSize: 12.sp),
                  ),
                  leading: Radio<String>(
                    value: "Pay By Bank",
                    groupValue: state.selectedMethod,
                    onChanged: (value) {
                      context.read<BillCubit>().selectPaymentMethod(value!);
                    },
                    activeColor: kbutton,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final selectedMethod = state.selectedMethod;
                    final bookingCubit = context.read<BookingCubit>();

                    if (selectedMethod.isEmpty) {
                      AppConstants.showToast(
                        context,
                        "You must choose a payment method",
                      );
                    } else {
                      bookingCubit.printBookingDetails();
                      print('\n----- Additional Debug Info -----');
                      final bookingState = bookingCubit.state as BookingDataState;
                      print('Full Booking State: ${bookingState.toString()}');
                      
                      NavigationWidget.pushPage(
                        context,
                        const IndexedStackTeacherScreen(
                          initialIndex: 2,
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(kbutton),
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(
                        vertical: size.height * 0.015,
                        horizontal: size.width * 0.3,
                      ),
                    ),
                  ),
                  child: Text(
                    "Move to payments",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text("Loading..."));
          }
        },
      ),
    );
  }
}
