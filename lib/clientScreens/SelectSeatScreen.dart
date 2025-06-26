import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Seatcubit/seatcubit_cubit.dart';
import 'package:bpr602_cinema/Cubits/bookingCubit/booking_cubit.dart';
import 'package:bpr602_cinema/clientScreens/BookingDetailes.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SelectSeatScreen extends StatefulWidget {
  final int haleid;
  // final String syn;
  // final String title;
  // final String imgurl;
  // final int duration;
  // final String director;
  // final String ar;
  // final String genre;
  const SelectSeatScreen(
      {super.key, required this.haleid,
      // required this.syn,
      // required this.imgurl,
      // required this.duration,
      // required this.director,
      // required this.ar,
      // required this.genre,
      // required this.title
      });
  @override
  State<SelectSeatScreen> createState() => _SelectSeatScreenState();
}

enum SeatStatus { available, taken, selected }

class Seat {
  final String id;
  SeatStatus status;

  Seat(this.id, this.status);
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
  List<Seat> selectedSeats = [];
   
  // void toggleSeatSelection(Seat seat) {
  //   setState(() {
  //     if (seat.status == SeatStatus.available) {
  //       seat.status = SeatStatus.selected;
  //       selectedSeats.add(seat);
  //     } else if (seat.status == SeatStatus.selected) {
  //       seat.status = SeatStatus.available;
  //       selectedSeats.remove(seat);
  //     }
  //   });
  // }
  void toggleSeatSelection(Seat seat) {
    setState(() {
      final existing = selectedSeats.indexWhere((s) => s.id == seat.id);
      if (existing != -1) {
        selectedSeats.removeAt(existing);
      } else {
        selectedSeats.add(seat);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     
     final booking = context.read<BookingCubit>().state as BookingDataState;
     int totalPrice = selectedSeats.length * booking.selectedMovieTime!.price!;
    return BlocProvider(
      create: (context) => SeatcubitCubit()..getMoviehall(widget.haleid),
      child: BlocConsumer<SeatcubitCubit, SeatcubitState>(
        listener: (context, state) {
          if (state is GetHallErrorState) {
            if (state.message == "Session Is Done") {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            }else if(state.message == 'No Internet Connection') {
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
          return Scaffold(
          
            backgroundColor: Kbackground,
            appBar: AppBar(
              backgroundColor: Kbackground,
              title: Text(
                'Select Seat in Thieter',
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
               actions: [
                Padding(
                    padding: EdgeInsets.all(size.width * 0.01),
                    child: IconButton(
                        onPressed: () {
                          selectedSeats = [];
                          context.read<SeatcubitCubit>().getMoviehall(9);
                        },
                        icon: Icon(
                          Icons.refresh,
                          color: kbutton,
                        )))
              ],
            ),
            body: Column(
              children: [
                Image.asset(
                  "assets/scre cenima.png",
                  width: size.width ,
                  height: size.height * 0.12,
                ),

                SizedBox(height: size.height * 0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.swipe_right, color: const Color.fromARGB(255, 236, 198, 45)),
                    Icon(Icons.swipe_down, color: const Color.fromARGB(255, 236, 198, 45)),
                    Text(
                    ' You can Scroll Cinema Hall ',
                    style: TextStyle(color: const Color.fromARGB(255, 236, 198, 45), fontSize: 12.sp),
                                  ),
                  ],
                ),
                   SizedBox(height: size.height * 0.01,),
                // Expanded(
                //   child: ListView.builder(
                //     scrollDirection: Axis.vertical,
                //     itemCount: seatMatrix.length,
                //     itemBuilder: (context, rowIndex) {
                //       return Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: seatMatrix[rowIndex].map((seat) {
                //           return GestureDetector(
                //             onTap: () {
                //               if (seat.status != SeatStatus.taken) {
                //                 toggleSeatSelection(seat);
                //               }
                //             },
                //             child: Container(
                //               margin: const EdgeInsets.all(4.0),
                //               width: size.width * 0.065,
                //               height: size.height * 0.030,
                //               alignment: Alignment.center,
                //               decoration: BoxDecoration(
                //                 color: seat.status == SeatStatus.taken
                //                     ? Colors.red
                //                     : seat.status == SeatStatus.selected
                //                         ? Colors.green
                //                         : Colors.grey,
                //                 borderRadius: BorderRadius.circular(4),
                //               ),
                //               child: Text(
                //                 seat.id,
                //                 style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 12.sp,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ),
                //           );
                //         }).toList(),
                //       );
                //     },
                //   ),
                // ),
//         Expanded(
//   child: Builder(
//     builder: (context) {
//       if (state is GetHallAwaitState) {
//         return const Center(child: CircularProgressIndicator());
//       } else if (state is GetHallErrorState) {
//         return Center(
//           child: Text(
//             'Error: ${state.message}',
//             style: const TextStyle(color: Colors.red),
//           ),
//         );
//       } else if (state is GetHallAcceptState) {
//         final data = context.read<SeatcubitCubit>().gethallid!.data!;
//         final chairs = data.hallChairs;

//         return GridView.builder(
//           padding: const EdgeInsets.all(8.0),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: data.columnCount,
//             crossAxisSpacing: 2,
//             mainAxisSpacing: 2,
//           ),
//           itemCount: chairs.length,
//           itemBuilder: (context, index) {
//             final seat = chairs[index];
//             if (!seat.isValid) {
//               return const SizedBox.shrink();
//             }
        
//             final isSelected = selectedSeats.any((s) => s.id == seat.code);
        
//             return GestureDetector(
//               onTap: () {
//                 toggleSeatSelection(Seat(
//                   seat.code,
//                   isSelected ? SeatStatus.selected : SeatStatus.available,
//                 ));
//               },
//               child: AspectRatio(
//                 aspectRatio: 1, // يجعل كل خلية مربعة
//                 child: LayoutBuilder(
//                   builder: (context, constraints) {
//                     double iconSize = constraints.maxWidth * 0.55;
//                     double fontSize = constraints.maxWidth * 0.23;
             
        
//                     return Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: isSelected ? Colors.green : Colors.grey,
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.chair_sharp,
//                             color: Colors.white,
//                             size: iconSize,
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             seat.code,
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: fontSize,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             );
//           },
//         );
//       } else {
//         return const SizedBox();
//       }
//     },
//   ),
// ),
Expanded(
  child: Builder(
    builder: (context) {
      if (state is GetHallAwaitState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is GetHallErrorState) {
        return Center(
          child: Text(
            'Error: ${state.message}',
            style: const TextStyle(color: Colors.red),
          ),
        );
      } else if (state is GetHallAcceptState) {
        final data = context.read<SeatcubitCubit>().gethallid!.data!;
        final chairs = data.hallChairs;

        return Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
             physics: const ClampingScrollPhysics(),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
               physics: const ClampingScrollPhysics(),
              child: SizedBox(
                width: data.columnCount * 42.0, // عرض ثابت لكل خلية (60 هو مثال)
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(), // تعطيل التمرير الداخلي
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: data.columnCount,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: chairs.length,
                  itemBuilder: (context, index) {
                    final seat = chairs[index];
                    if (!seat.isValid) {
                      return const SizedBox.shrink();
                    }
                
                    final isSelected = selectedSeats.any((s) => s.id == seat.code);
                
                    return GestureDetector(
                      onTap: () {
                        toggleSeatSelection(Seat(
                          seat.code,
                          isSelected ? SeatStatus.selected : SeatStatus.available,
                        ));
                      },
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            double iconSize = constraints.maxWidth * 0.55;
                            double fontSize = constraints.maxWidth * 0.23;
                     
                            return Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.green : Colors.grey,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.chair_sharp,
                                    color: Colors.white,
                                    size: iconSize,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    seat.code,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      } else {
        return const SizedBox();
      }
    },
  ),
),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4)),
                      margin: EdgeInsets.all(size.width * 0.03),
                      width: size.width * 0.065,
                      height: size.height * 0.030,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Text(
                      'Selected',
                      style: TextStyle(fontSize: 16.sp, color: Ktext),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(4)),
                      margin: EdgeInsets.all(size.width * 0.03),
                      width: size.width * 0.065,
                      height: size.height * 0.030,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'Available',
                      style: TextStyle(fontSize: 16.sp, color: Ktext),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4)),
                      margin: EdgeInsets.all(size.width * 0.03),
                      width: size.width * 0.065,
                      height: size.height * 0.030,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'Token',
                      style: TextStyle(fontSize: 16.sp, color: Ktext),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Seat(s)',
                      style:
                          TextStyle(fontSize: 14.sp, color: Colors.grey[400]),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Wrap(
                      spacing: 3.0,
                      children: selectedSeats.map((seat) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            seat.id,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Total Price Section
                      Column(
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[400]),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            
                            '$totalPrice.00 IQD',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // Selected Seats Section
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                ElevatedBtn(
                  backgroundColor: kbutton,
                  textColor: ksmallActionColor,
                  buttonText: "Continue",
                  onPressed: selectedSeats.isNotEmpty
                      ? () {
                        
                         context.read<BookingCubit>().movietotalprice(totalPrice);
                            context.read<BookingCubit>().selecthallseat(selectedSeats);
                          NavigationWidget.pushPage(
                              context,
                              BookingDetailes(
                                // syn: widget.syn,
                                // imgurl: widget.imgurl,
                                // duration: widget.duration,
                                // totalpriceseat: selectedSeats.length * 100,
                                // director: 'Director ',
                                // ar: widget.ar,
                                // genre: widget.genre,
                                // title: widget.title,
                              ));
                        }
                      : null,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
