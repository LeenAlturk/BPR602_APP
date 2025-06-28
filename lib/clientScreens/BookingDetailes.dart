import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Cartcubit/shopping_cart_cubit.dart';
import 'package:bpr602_cinema/Cubits/bookingCubit/booking_cubit.dart';
import 'package:bpr602_cinema/clientScreens/Bill.dart';
import 'package:bpr602_cinema/clientScreens/snackscreen.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/seeallMovieCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingDetailes extends StatelessWidget {
  // final String? title;
  // final String? syn;
  // final String? imgurl;
  // final int? duration;
  // final String? director;
  // final String? ar;
  // final String? genre;
  // final int? totalpriceseat;
  // final double? totalSnackPrice;
  const BookingDetailes({
    super.key,
    //  this.syn,
    //  this.totalpriceseat,
    //  this.imgurl,
    //  this.duration,
    //  this.director,
    //  this.ar,
    //  this.genre,
    //  this.totalSnackPrice ,
    //  this.title
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //int mytotalpriceseat = totalpriceseat!;
    final booking = context.watch<BookingCubit>().state as BookingDataState;

    return Scaffold(
      backgroundColor: Kbackground,
      appBar: AppBar(
        backgroundColor: Kbackground,
        title: Text(
          '${booking.selectedMovie!.name}',
          style: TextStyle(color: Ktext, fontSize: 14.sp),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kbutton,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(size.height * 0.002),
                child: SeeallMovieCard(
                  status: "${booking.selectedMovie!.status}",
                  subtitle:
                      "${booking.selectedMovieTime!.subtitle!.englishName}",
                  rating: booking.selectedMovie!.rate!,
                  Language:
                      "${booking.selectedMovieTime!.language!.englishName}",
                  title: "${booking.selectedMovie!.name}",
                  imgurl: booking.selectedMovie?.image?.url != null
                      ? '${LinksUrl.baseUrl}${booking.selectedMovie!.image!.url}'
                      : 'https://ina.iq/eng/uploads/posts/2021-05/thumbs/upload_1621342522_427621977.png',
                  genre: booking.selectedMovie?.movieTypes != null
                      ? booking.selectedMovie!.movieTypes!
                          .map((type) => type.englishName ?? '')
                          .join(', ')
                      : '',
                  director: booking.selectedMovie!.director!.firstName!,
                  duration: booking.selectedMovie!.durationInMinutes!,
                  ar: booking.selectedMovie!.movieClassification!.englishName!,
                ),
              ),
              SizedBox(height:  size.height * 0.01,),
              Container(
                width: size.width * 0.96,
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  color: ksmallActionColor,
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 28, 33, 72),
                      ksmallActionColor
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(size.height * 0.01),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(size.width * 0.0004),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Booking Detailes',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hall Type',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${booking.selectedMovieTime!.hall?.isVip == true ? 'VIP' : 'Standard'}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'tecnology ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' ${booking.selectedMovieTime!.is3d == true ? '3D' : '2D'}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hall',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${booking.selectedMovieTime!.hall!.name}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Seat(s)',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Flexible(
                            child: Text(
                              booking.selectedSeats
                                  .map((type) => type.id ?? '')
                                  .join(', '),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.normal,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            booking.selectedDate
                                    ?.toIso8601String()
                                    .split("T")
                                    .first ??
                                '',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hour',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${booking.selectedMovieTime!.time}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      'Num OF Booking Snacks',
      style: TextStyle(
        color: Ktext,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    Builder(
      builder: (context) {
        final bookingState = context.watch<BookingCubit>().state;
        if (bookingState is BookingDataState) {
          final snackCount = bookingState.selectedSnacks.fold(
            0,
            (sum, item) => sum + item.quantity,
          );

          return Text(
            snackCount == 0 ? '0 snack' : '$snackCount snacks',
            style: TextStyle(
              color: Ktext,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          );
        } else {
          return Text(
            '0 snack',
            style: TextStyle(
              color: Ktext,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          );
        }
      },
    ),
  ],
),

                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              GestureDetector(
  onTap: () {
    NavigationWidget.pushPage(context, const SnackScreen());
  },
  child: Container(
    decoration: BoxDecoration(
      color: ksmallActionColor,
      borderRadius: BorderRadius.circular(12),
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 28, 33, 72),
          ksmallActionColor
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    width: size.width * 0.96,
    height: size.height * 0.14,
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.all(size.width * 0.0323),
          child: Image.asset("assets/pobCorn.png"),
        ),
        Builder(
          builder: (context) {
            final bookingState = context.watch<BookingCubit>().state;
            int snackCount = 0;
            if (bookingState is BookingDataState) {
              snackCount = bookingState.selectedSnacks.fold(
                0,
                (sum, item) => sum + item.quantity,
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  snackCount == 0 ? 'Book Your' : 'Change Your',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Snack .......',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            NavigationWidget.pushPage(context, const SnackScreen());
          },
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),
      ],
    ),
  ),
)

            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.all(
              size.height * 0.01,
            ),
            child: ElevatedBtn(
              backgroundColor: kbutton,
              textColor: ksmallActionColor,
              buttonText: "Continue",
              onPressed: () {
//                  context.read<ShoppingCartCubit>().clearCart();
//                  context.read<BookingCubit>().selectSnacks(null);

// Future.microtask(() {
//   final booking = context.read<BookingCubit>().state as BookingDataState;
//   print("Snacks saved to BookingCubit:");
//   if (booking.selectedSnacks.isEmpty) {
//     print("=> Snack list is now empty ");
//   } else {
//     for (var snack in booking.selectedSnacks) {
//       print(" - ${snack.title}, price: ${snack.price}");
//     }
//   }
// });

                NavigationWidget.pushPage(
                    context,
                    Bill(
                        //totalpriceseat: mytotalpriceseat , title: title!, imgurl: imgurl!,
                        ));
              },
            ),
          )
        ],
      ),
    );
  }
}
