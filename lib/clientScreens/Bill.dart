
import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Billcubit/bill_cubit.dart';
import 'package:bpr602_cinema/Cubits/Cartcubit/shopping_cart_cubit.dart';
import 'package:bpr602_cinema/Cubits/bookingCubit/booking_cubit.dart';
import 'package:bpr602_cinema/clientScreens/BnakDetailes.dart';
import 'package:bpr602_cinema/clientScreens/BookingDetailes.dart';
import 'package:bpr602_cinema/clientScreens/indexedstackclientnav.dart';
import 'package:bpr602_cinema/clientScreens/search.dart';
import 'package:bpr602_cinema/clientScreens/snackscreen.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/models/snackModel.dart';
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
  bool _areSnackListsEqual(List<snacks> list1, List<snacks> list2) {
  if (list1.length != list2.length) return false;

  for (int i = 0; i < list1.length; i++) {
    final s1 = list1[i];
    final s2 = list2.firstWhere(
      (element) => element.variantId == s1.variantId,
      orElse: () => snacks( title: '', price: 0, snackimg: '', size: '', quantity: -1, variantId: -1 , describtion: ""),
    );

    if (s1.quantity != s2.quantity) return false;
  }

  return true;
}

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
            onPressed: () => 
            Navigator.of(context).pop(),
              
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
                date: booking.selectedDate
                        ?.toIso8601String()
                        .split("T")
                        .first ??
                    '',
                Seat: booking.selectedSeats
                    .map((type) => type.id ?? '')
                    .join(', '),
              ),
      
              const SizedBox(height: 15),
      
              // Snacks Section
              _buildSnacksSection(context, size, booking),
      
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: Divider(
                  thickness: 2,
                  color: Whitconst,
                ),
              ),
      
              // Price Breakdown
              _buildPriceBreakdown(size, booking),
       BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
  builder: (context, state) {
    final cartItems = context.read<ShoppingCartCubit>().listOfCartItem;
    final bookingState = context.read<BookingCubit>().state;

    if (bookingState is BookingDataState) {
      final selectedSnacks = bookingState.selectedSnacks;

      bool isDifferent = cartItems.length != selectedSnacks.length ||
          !_areSnackListsEqual(cartItems, selectedSnacks);

      if (isDifferent) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "⚠️ Some snacks in your cart are not yet checked out",
            style: TextStyle(color: Colors.orangeAccent, fontSize: 11.sp),
          ),
        );
      }
    }
    return SizedBox.shrink();
  },
),
              // Payment Options
              _buildPaymentOptions(size),
             

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSnacksSection(
      BuildContext context, Size size, BookingDataState booking) {
    print('----- Building Snacks Section -----');
    print('Current snacks in booking: ${booking.selectedSnacks.length}');
    booking.selectedSnacks
        .forEach((s) => print(' - ${s.title} x${s.quantity}'));
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Selected Snacks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (booking.selectedSnacks.isNotEmpty)
                TextButton(
                  onPressed: () {
                    NavigationWidget.pushPage(
                      context,
                      const SnackScreen(),
                    );
                  },
                  child: Text(
                    'Manage Snacks',
                    style: TextStyle(
                      color: kbutton,
                      fontSize: 14.sp,
                      decoration: TextDecoration.underline,
                    ),
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
                    padding: const EdgeInsets.only(bottom: 10),
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
                  '$moviePrice SYP ',
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
                  '$snacksPrice SYP',
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
                  '${booking.totalPrice} SYP ',
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
    child: BlocListener<BillCubit, BillState>(
      listener: (context, state) {
        if (state is BookingAccept) {
          NavigationWidget.pushPage(
            context,
            const IndexedStackTeacherScreen(initialIndex: 2),
          );
        }
        if (state is BookingError) {
          if (state.message == "Session Is Done") {
            AppConstants.showToast(context, state.message);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          } else if(state.message == "No Internet Connection") {
            AppConstants.showToast(context, state.message);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => NoInternetScreen()),
                (route) => false);
          } else {
            AppConstants.showToast(context, state.message);
          }
        }
      },
      child: BlocBuilder<BillCubit, BillState>(
        builder: (context, state) {
          final isProcessing = state is BookingAwait;
          final currentMethod = state is PaymentState ? state.selectedMethod : '';

          return Column(
            children: [
              // Payment options
              if (state is! BookingAccept) ...[
                ListTile(
                  title: Text(
                    "Pay Cash",
                    style: TextStyle(color: Whitconst, fontSize: 12.sp),
                  ),
                  leading: Radio<String>(
                    value: "Cash",
                    groupValue: currentMethod,
                    onChanged: isProcessing
                        ? null
                        : (value) {
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
                    value: "Bank",
                    groupValue: currentMethod,
                    onChanged: isProcessing
                        ? null
                        : (value) {
                            context.read<BillCubit>().selectPaymentMethod(value!);
                          },
                    activeColor: kbutton,
                  ),
                ),
              ],

              SizedBox(
                width: size.width * 0.8,
                child: ElevatedButton(
                  onPressed: isProcessing
                      ? null
                      : () {
                          final bookingCubit = context.read<BookingCubit>();
                          final billCubit = context.read<BillCubit>();

                          if (currentMethod.isEmpty) {
                            AppConstants.showToast(
                              context,
                              "You must choose a payment method",
                            );
                          } else {
                            bookingCubit.printBookingDetails();
                            billCubit.submitBooking(context);
                          }
                        },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return kbutton.withOpacity(0.5);
                        }
                        return kbutton;
                      },
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                    ),
                  ),
                  child: isProcessing
                      ? SizedBox(
                          height: 24, 
                          width: 24, 
                          child: CircularProgressIndicator(
                            strokeWidth: 3, 
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          "Confirm Booking",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                        ),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}
}
