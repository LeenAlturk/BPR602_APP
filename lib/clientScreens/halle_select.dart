// import 'package:bpr602_cinema/Constants/colors.dart';
// import 'package:bpr602_cinema/Constants/sizer.dart';
// import 'package:bpr602_cinema/Cubits/HallSelect_cubit/hall_select_cubit.dart';
// import 'package:bpr602_cinema/clientScreens/SelectSeatScreen.dart';
// import 'package:bpr602_cinema/wedgets/Navigating.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HallSelect extends StatelessWidget {
//   const HallSelect({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return BlocProvider(
//       create: (context) => HallSelectCubit(),
//       child: BlocConsumer<HallSelectCubit, HallSelectState>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           return Scaffold(
//             backgroundColor: Kbackground,
//             appBar: AppBar(
//               backgroundColor: Kbackground,
//               title: Text(
//                 'Available Film Time ',
//                 style: TextStyle(color: Ktext, fontSize: 14.sp),
//               ),
//               leading: IconButton(
//                 icon: const Icon(Icons.arrow_back_ios, color: kbutton),
//                 onPressed: () => Navigator.of(context).pop(),
//               ),
//               automaticallyImplyLeading: true,
//             ),
//             body: ListView.builder(
//               itemCount: 4,
//               itemBuilder: (context, index) {
//                 return Card(
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   margin: const EdgeInsets.all(16),
//                   child: GestureDetector(
//                     onTap: (){
//                              NavigationWidget.pushPage(
//                                             context,
//                                             SelectSeatScreen(

//                                                 ),
//                                           );
//                     },
//                     child: Container(
//                       // decoration: BoxDecoration(
//                       //   color: ksmallActionColor,
//                       //   borderRadius: BorderRadius.circular(20),
//                       //   gradient: LinearGradient(
//                       //     colors: [
//                       //       Color.fromARGB(255, 22, 27, 54),
//                       //       ksmallActionColor,
//                       //     ],
//                       //     begin: Alignment.topLeft,
//                       //     end: Alignment.bottomRight,
//                       //   ),
//                       // ),
//                         decoration: BoxDecoration(
//                 color: ksmallActionColor,
//                 borderRadius: BorderRadius.circular(12),
//                 gradient: const LinearGradient(
//                   colors: [Color.fromARGB(255, 45, 42, 53), ksmallActionColor],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//                       child: Padding(
//                         padding: EdgeInsets.all(size.height * 0.02),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.event_seat,
//                                   color: kbutton,
//                                 ),
//                                 SizedBox(width: size.width * 0.02),
//                                 Text(
//                                   //'Bank Name: ${bank['name']}',
//                                   "Halle 1 ",
//                                   style: TextStyle(
//                                     color: Ktext,
//                                     fontSize: 18.sp,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),

//                               ],
//                             ),
//                             Divider(color: Ktext, thickness:1,),
//                             SizedBox(height: size.height * 0.02),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.movie_creation,
//                                   color: kbutton,
//                                 ),
//                                 SizedBox(width: size.width * 0.02),
//                                 Text(
//                                   'Technology : ',
//                                   style: TextStyle(
//                                     color:Ktext,
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(width: size.width * 0.02),
//                                 Text(
//                                   '3D ',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14.sp,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: size.height * 0.02),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.workspace_premium,
//                                   color: kbutton,
//                                 ),
//                                 SizedBox(width: size.width * 0.02),
//                                 Text(
//                                   "Hall Type :",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14.sp,
//                                     color: Ktext,
//                                     fontStyle: FontStyle.italic,
//                                   ),
//                                 ),
//                                 //     color:Ktext,
//                                    SizedBox(width: size.width * 0.02),
//                                 Text(
//                                   "VIP",
//                                   style: TextStyle(
//                                     fontSize: 14.sp,
//                                      color:Colors.white,
//                                     fontStyle: FontStyle.italic,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: size.height * 0.02),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.timer,
//                                   color: kbutton,
//                                 ),
//                                 SizedBox(width: size.width * 0.02),
//                                 Text(
//                                   'Time :',
//                                   style: TextStyle(
//                                     fontSize: 14.sp,
//                                     color: Ktext,
//                                     fontStyle: FontStyle.italic,
//                                   ),
//                                 ),
//                                 SizedBox(width: size.width * 0.02),
//                                 Text(
//                                   '12:00',
//                                   style: TextStyle(
//                                     fontSize: 14.sp,
//                                     color: Colors.white,
//                                     fontStyle: FontStyle.italic,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/HallSelect_cubit/hall_select_cubit.dart';
import 'package:bpr602_cinema/Cubits/bookingCubit/booking_cubit.dart';
import 'package:bpr602_cinema/clientScreens/SelectSeatScreen.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
class HallSelect extends StatelessWidget {
  
  final int id;
  const HallSelect({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HallSelectCubit()..getMoviedetailestimes(id),
      child: Scaffold(
        backgroundColor: Kbackground,
        appBar: AppBar(
          backgroundColor: Kbackground,
          title: Text(
            'Available Film Time',
            style: TextStyle(color: Ktext, fontSize: 14.sp),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: kbutton),
            onPressed: () => Navigator.of(context).pop(),
          ),
          automaticallyImplyLeading: true,
        ),
        body: BlocListener<HallSelectCubit, HallSelectState>(
          listener: (context, state) {
                  if (state is MovietimeError) {
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
          child: BlocBuilder<HallSelectCubit, HallSelectState>(
  builder: (context, state) {
    final cubit = context.read<HallSelectCubit>();
    final movieTimes = cubit.movieResponseById?.data?.movieTimes ?? [];

    int? selectedIndex;
    if (state is HallSelected) {
      selectedIndex = state.selectedIndex;
    }

    if (state is Movietimeloading) {
      return const Center(
        child: CircularProgressIndicator(color: kbutton),
      );
    }

    if (state is MovietimeAccept || state is HallSelected) {
      if (movieTimes.isEmpty) {
        return const Center(
          child: Text(
            "No Movie Times Available",
            style: TextStyle(color: Colors.white),
          ),
        );
      }

      return ListView.builder(
        itemCount: movieTimes.length,
        itemBuilder: (context, index) {
          final item = movieTimes[index];
          final isSelected = selectedIndex == index;

          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: isSelected
                  ? BorderSide(color: kbutton, width: 2)
                  : BorderSide.none,
            ),
            margin: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {
                context.read<HallSelectCubit>().selectHall(index);
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  color: ksmallActionColor,
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 45, 42, 53),
                      ksmallActionColor
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.event_seat, color: kbutton),
                          SizedBox(width: 8),
                          Text(
                            "Hall: ${item.hall?.name ?? 'Unknown'}",
                            style: TextStyle(
                              color: Ktext,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Ktext, thickness: 1),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.movie_creation, color: kbutton),
                          SizedBox(width: size.width * 0.01),
                          Text(
                            ' ${item.is3d == true ? '3D' : '2D'}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(width: size.width * 0.4,),
                            Icon(Icons.workspace_premium, color: kbutton),
                            SizedBox(width: size.width * 0.01),
                          Text(
                            " ${item.hall?.isVip == true ? 'VIP' : 'Standard'}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                           
                          
                        ],
                      ),
                      
                       SizedBox(height: size.height * 0.02),
                         Row(
                           children: [
                             Text(
                            'Time :',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Ktext,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(width: size.width * 0.02),
                             Text(
                                '${item.time}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                 color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                           ],
                         ),
                         SizedBox(height: size.height * 0.01),
                      Row(
                        children: [
                          Text(
                            'Subtitles: ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Ktext,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '${item.subtitle?.englishName ?? 'N/A'}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Language: ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Ktext,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '${item.language?.englishName ?? 'N/A'}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Price: ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Ktext,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '${item.price} IQD',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      if (isSelected)
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kbutton,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 12,
                                ),
                              ),
                         onPressed: () {
  final booking = context.read<BookingCubit>().state as BookingDataState;
  final date = booking.selectedDate!;
  
  context.read<BookingCubit>().selectMovieTime(item);

  NavigationWidget.pushPage(
    context,
    SelectSeatScreen(
      haleid: item.id!,
      bookingDate: date,
    ),
  );
},

                              child: Text(
                                'GO',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    
    return const Center(
      child: CircularProgressIndicator(color: kbutton),
    );
  },
),

        ),
      ),
    );
  }
}
