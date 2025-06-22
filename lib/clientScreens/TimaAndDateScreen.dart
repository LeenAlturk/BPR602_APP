import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/TimaAndDateScreenCubit/tima_and_date_screen_cubit.dart';
import 'package:bpr602_cinema/Cubits/bookingCubit/booking_cubit.dart';
import 'package:bpr602_cinema/clientScreens/SelectSeatScreen.dart';
import 'package:bpr602_cinema/clientScreens/halle_select.dart';
import 'package:bpr602_cinema/models/response/movie_respone_id.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';

class TimeAndDateScreen extends StatefulWidget {

  final int id;

  const TimeAndDateScreen({super.key, required this.id
   
      });

  @override
  State<TimeAndDateScreen> createState() => _TimeAndDateScreenState();
}

class _TimeAndDateScreenState extends State<TimeAndDateScreen> {
  bool isVip = true; // Default: VIP
  bool is3D = true; // Default: 3D
  DateTime _getValidFocusedDay(
      DateTime preferredDay, DateTime firstDay, DateTime lastDay) {
    if (preferredDay.isBefore(firstDay)) {
      return firstDay;
    } else if (preferredDay.isAfter(lastDay)) {
      return lastDay;
    }
    return preferredDay;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          TimaAndDateScreenCubit()..getMoviedetailesTAndD(widget.id),
      child: BlocConsumer<TimaAndDateScreenCubit, TimaAndDateScreenState>(
        listener: (context, state) {
          if (state is TimeAndDateEroorSttae) {
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
          return Scaffold(
            backgroundColor: Kbackground,
            appBar: AppBar(
              backgroundColor: Kbackground,
              title: Text(
                'Booking settings ',
                style: TextStyle(color: Ktext, fontSize: 14.sp),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: kbutton),
                onPressed: () => Navigator.of(context).pop(),
              ),
              automaticallyImplyLeading: true,
            ),
            body: ListView(
              //shrinkWrap: true,

              children: [
                Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      'Select your favorate booking settings',
                      style: TextStyle(color: Ktext, fontSize: 16.sp),
                    ),
                    // Calendar Section
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.05),
                      child: BlocBuilder<TimaAndDateScreenCubit,
                          TimaAndDateScreenState>(
                        buildWhen: (previous, current) =>
                            current is TimaAndDateScreenDateSelected,
                        builder: (context, state) {
                          return Container(
                            width: size.width,
                            height: size.height * 0.41,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ksmallActionColor,
                            ),
                            child: TableCalendar(
                              calendarStyle: const CalendarStyle(
                                selectedDecoration: BoxDecoration(
                                  color: kbutton,
                                  shape: BoxShape.circle,
                                ),
                                todayDecoration: BoxDecoration(
                                  color: Color.fromARGB(255, 28, 58, 82),
                                  shape: BoxShape.circle,
                                ),
                                weekendTextStyle:
                                    TextStyle(color: Colors.amber),
                                defaultTextStyle:
                                    TextStyle(color: Colors.amber),
                                selectedTextStyle:
                                    TextStyle(color: Colors.white),
                                todayTextStyle: TextStyle(color: Colors.white),
                              ),
                              daysOfWeekStyle: const DaysOfWeekStyle(
                                weekdayStyle: TextStyle(color: Colors.white),
                                weekendStyle: TextStyle(color: Colors.white),
                              ),
                              headerStyle: const HeaderStyle(
                                leftChevronIcon: Icon(Icons.chevron_left,
                                    color: Colors.white),
                                rightChevronIcon: Icon(Icons.chevron_right,
                                    color: Colors.white),
                                formatButtonVisible: false,
                                titleCentered: true,
                                titleTextStyle: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              selectedDayPredicate: (day) => isSameDay(day,
                                  context.read<TimaAndDateScreenCubit>().today),
                              // Ensure focusedDay is within the range
                              focusedDay: _getValidFocusedDay(
                                context.read<TimaAndDateScreenCubit>().today,
                                context
                                        .read<TimaAndDateScreenCubit>()
                                        .startDate ??
                                    DateTime.utc(2025, 4, 16),
                                context
                                        .read<TimaAndDateScreenCubit>()
                                        .endDate ??
                                    DateTime.utc(2025, 7, 1),
                              ),
                              firstDay: context
                                      .read<TimaAndDateScreenCubit>()
                                      .startDate ??
                                  DateTime.utc(2025, 4, 16),
                              lastDay: context
                                      .read<TimaAndDateScreenCubit>()
                                      .endDate ??
                                  DateTime.utc(2025, 7, 1),
                              availableGestures: AvailableGestures.all,
                              locale: "en_US",
                              rowHeight: 35,
                              onDaySelected: (day, focusedDay) {
                                context
                                    .read<TimaAndDateScreenCubit>()
                                    .onDateSelected(day, focusedDay);
                              },
                            ),
                          );
                        },
                      ),
                    ),

                    //choose Hale
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //     vertical: size.height * 0.01,
                    //     horizontal: size.width * 0.03,
                    //   ),
                    //   child: BlocBuilder<TimaAndDateScreenCubit,
                    //       TimaAndDateScreenState>(
                    //     builder: (context, state) {
                    //       return Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text(
                    //               style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontSize: 14.sp,
                    //                 fontWeight: FontWeight.bold,
                    //               ),
                    //               "Hall Type: ${context.read<TimaAndDateScreenCubit>().isVip ? "VIP" : "Standard"}"),
                    //           Switch(
                    //             activeColor: kbutton,
                    //             inactiveThumbColor: kbutton,
                    //             // ignore: deprecated_member_use
                    //             activeTrackColor: kbutton.withOpacity(
                    //                 0.5), // Border-like effect when active
                    //             inactiveTrackColor: Colors.grey
                    //                 .shade400, // Border-like effect when inactive

                    //             value: context
                    //                 .read<TimaAndDateScreenCubit>()
                    //                 .isVip,
                    //             onChanged: (value) {
                    //               context
                    //                   .read<TimaAndDateScreenCubit>()
                    //                   .SwitchHale(value);
                    //             },
                    //           ),
                    //         ],
                    //       );
                    //     },
                    //   ),
                    // ),
                    //choose technology
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //     vertical: size.height * 0.01,
                    //     horizontal: size.width * 0.03,
                    //   ),
                    //   child: BlocBuilder<TimaAndDateScreenCubit,
                    //       TimaAndDateScreenState>(
                    //     builder: (context, state) {
                    //       return Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text(
                    //               style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontSize: 14.sp,
                    //                 fontWeight: FontWeight.bold,
                    //               ),
                    //               "Technology Type: ${context.read<TimaAndDateScreenCubit>().is3D ? "3D" : "2D"}"),
                    //           Switch(
                    //             activeColor: kbutton,
                    //             inactiveThumbColor: kbutton,
                    //             // ignore: deprecated_member_use
                    //             activeTrackColor: kbutton.withOpacity(
                    //                 0.5), // Border-like effect when active
                    //             inactiveTrackColor: Colors.grey
                    //                 .shade400, // Border-like effect when inactive

                    //             value:
                    //                 context.read<TimaAndDateScreenCubit>().is3D,
                    //             onChanged: (value) {
                    //               context
                    //                   .read<TimaAndDateScreenCubit>()
                    //                   .SwitchTech(value);
                    //             },
                    //           ),
                    //         ],
                    //       );
                    //     },
                    //   ),
                    // ),
                    // Subtitle Dropdown Section
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.01,
                        horizontal: size.width * 0.03,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Subtitle:",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          BlocBuilder<TimaAndDateScreenCubit,
                              TimaAndDateScreenState>(
                            buildWhen: (previous, current) =>
                                current is TimaAndDateScreenSubtitleSelected ||
                                current is TimeAndDateAcceptState,
                            builder: (context, state) {
                              // final subtitles =
                              //     context.read<TimaAndDateScreenCubit>().subtitles;
                              final subtitles = context
                                  .read<TimaAndDateScreenCubit>()
                                  .availableSubtitles;
                              final selectedSubtitle = context
                                  .read<TimaAndDateScreenCubit>()
                                  .selectedSubtitle;

                              return SizedBox(
                                  width: size.width *
                                      0.4, // Set the desired width here
                                  child: DropdownButton<Movie>(
                                    value: context
                                        .read<TimaAndDateScreenCubit>()
                                        .selectedSubtitle,
                                    dropdownColor: ksmallActionColor,
                                    iconEnabledColor: Colors.white,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp),
                                    items: context
                                        .read<TimaAndDateScreenCubit>()
                                        .availableSubtitles
                                        .map<DropdownMenuItem<Movie>>(
                                          (Movie movie) =>
                                              DropdownMenuItem<Movie>(
                                            value: movie,
                                            child: Text(
                                              movie.englishName ??
                                                  movie.code ??
                                                  'Unknown',
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (Movie? newValue) {
                                      if (newValue != null) {
                                        context
                                            .read<TimaAndDateScreenCubit>()
                                            .selectSubtitle(newValue);
                                      }
                                    },
                                  ));
                            },
                          )
                        ],
                      ),
                    ),
                    // Subtitle Dropdown Section
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.01,
                        horizontal: size.width * 0.03,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Language:",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          BlocBuilder<TimaAndDateScreenCubit,
                              TimaAndDateScreenState>(
                            buildWhen: (previous, current) => true,
                            builder: (context, state) {
                              // final lang =
                              //     context.read<TimaAndDateScreenCubit>().Language;
                              final lang = context
                                  .read<TimaAndDateScreenCubit>()
                                  .availableLanguages;
                              final selectedlang = context
                                  .read<TimaAndDateScreenCubit>()
                                  .selectedlang;

                              return SizedBox(
                                  width: size.width *
                                      0.4, // Set the desired width here
                                  child: DropdownButton<Movie>(
                                    value: context
                                        .read<TimaAndDateScreenCubit>()
                                        .selectedLanguage,
                                    dropdownColor: ksmallActionColor,
                                    iconEnabledColor: Colors.white,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp),
                                    items: context
                                        .read<TimaAndDateScreenCubit>()
                                        .availableLanguages
                                        .map<DropdownMenuItem<Movie>>(
                                          (Movie movie) =>
                                              DropdownMenuItem<Movie>(
                                            value: movie,
                                            child: Text(
                                              movie.englishName ??
                                                  movie.code ??
                                                  'Unknown',
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (Movie? newValue) {
                                      if (newValue != null) {
                                        context
                                            .read<TimaAndDateScreenCubit>()
                                            .selectLang(newValue);
                                      }
                                    },
                                  ));
                            },
                          )
                        ],
                      ),
                    ),

                    ElevatedBtn(
                      backgroundColor: kbutton,
                      textColor: ksmallActionColor,
                      buttonText: "Submet",
                      onPressed: () {
                        //                         int? selectedLanguageId = context.read<TimaAndDateScreenCubit>().selectedLanguage?.id;

                        // // الحصول على الـ id الخاص بالترجمة المحددة
                        // int? selectedSubtitleId = context.read<TimaAndDateScreenCubit>().selectedSubtitle?.id;
                         final cubit = context.read<TimaAndDateScreenCubit>();

                        // // الحصول على البيانات المطلوبة
                         DateTime selectedDate = cubit.today;
                        Movie language = cubit.selectedLanguage!;
                         //int? subtitleId = cubit.selectedSubtitle?.id;
                        // bool isVip = cubit.isVip;
                        // bool is3D = cubit.is3D;
                         
  context.read<BookingCubit>().selectDate(selectedDate);
  context.read<BookingCubit>().selectLangmo(language);
                        NavigationWidget.pushPage(
                          context,
                          HallSelect(),
                        );
                        // showModalBottomSheet(
                        //   backgroundColor: Kbackground,
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return BlocProvider(
                        //       create: (context) => TimaAndDateScreenCubit(),
                        //       child: SizedBox(
                        //         width: 400,
                        //         height: 200,
                        //         child: SingleChildScrollView(
                        //           child: Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.center,
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               SizedBox(
                        //                 height: 20,
                        //               ),
                        //               Text(
                        //                 "Avalible Time",
                        //                 style: TextStyle(
                        //                   color: Colors.white,
                        //                   fontSize: 14.sp,
                        //                   fontWeight: FontWeight.bold,
                        //                 ),
                        //               ),
                        //               // IMAX Time Chips Section at the start of the Column
                        //               Padding(
                        //                 padding:
                        //                     EdgeInsets.all(size.width * 0.01),
                        //                 child: BlocBuilder<
                        //                     TimaAndDateScreenCubit,
                        //                     TimaAndDateScreenState>(
                        //                   buildWhen: (previous, current) =>
                        //                       current is TimeHaleIMAX ||
                        //                       current is TimeHaleStandard,
                        //                   builder: (context, state) {
                        //                     final imaxTimes = context
                        //                         .read<TimaAndDateScreenCubit>()
                        //                         .imaxTimes;
                        //                     final selectedIMAXTime = context
                        //                         .read<TimaAndDateScreenCubit>()
                        //                         .selectedIMAXTime;

                        //                     return SizedBox(
                        //                       height:
                        //                           100, // Adjust the height to fit the ChoiceChip
                        //                       child: ListView.builder(
                        //                         scrollDirection:
                        //                             Axis.horizontal,
                        //                         itemCount: imaxTimes.length,
                        //                         itemBuilder: (context, index) {
                        //                           final isSelected =
                        //                               imaxTimes[index] ==
                        //                                   selectedIMAXTime;
                        //                           return Padding(
                        //                             padding: const EdgeInsets
                        //                                 .symmetric(
                        //                                 horizontal: 4.0),
                        //                             child: ChoiceChip(
                        //                               backgroundColor:
                        //                                   ksmallActionColor,
                        //                               selectedColor: kbutton,
                        //                               label: Text(
                        //                                 imaxTimes[index],
                        //                                 style: TextStyle(
                        //                                   color: isSelected
                        //                                       ? Colors.black
                        //                                       : Colors.white,
                        //                                 ),
                        //                               ),
                        //                               selected: isSelected,
                        //                               onSelected:
                        //                                   (bool selected) {
                        //                                 context
                        //                                     .read<
                        //                                         TimaAndDateScreenCubit>()
                        //                                     .selectIMAXTime(
                        //                                         selected
                        //                                             ? index
                        //                                             : null);
                        //                               },
                        //                             ),
                        //                           );
                        //                         },
                        //                       ),
                        //                     );
                        //                   },
                        //                 ),
                        //               ),
                        //               // Continue button below the IMAX Time Chips section
                        //               ElevatedBtn(
                        //                 backgroundColor: kbutton,
                        //                 textColor: ksmallActionColor,
                        //                 buttonText: "continue",
                        //                 onPressed: () {
                        //                   NavigationWidget.pushPage(
                        //                     context,
                        //                     SelectSeatScreen(
                        //                         // title: widget.title,
                        //                         // syn: widget.syn,
                        //                         // imgurl: widget.imgurl,
                        //                         // duration: widget.duration,
                        //                         // director: "DIRECTOR",
                        //                         // ar: widget.ar,
                        //                         // genre: widget.genre,
                        //                         ),
                        //                   );
                        //                 },
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
