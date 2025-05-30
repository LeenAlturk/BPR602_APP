import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/TimaAndDateScreenCubit/tima_and_date_screen_cubit.dart';
import 'package:bpr602_cinema/clientScreens/SelectSeatScreen.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class TimeAndDateScreen extends StatefulWidget {
  // final String title;
  // final String syn;
  // final String imgurl;
  // final int duration;
  // final String director;
  // final String ar;
  // final String genre;

  const TimeAndDateScreen({
    super.key,
    // required this.title,
    // required this.syn,
    // required this.imgurl,
    // required this.duration,
    // required this.director,
    // required this.ar,
    // required this.genre,
  });

  @override
  State<TimeAndDateScreen> createState() => _TimeAndDateScreenState();
}

class _TimeAndDateScreenState extends State<TimeAndDateScreen> {
  bool isVip = true; // Default: VIP
  bool is3D = true; // Default: 3D

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => TimaAndDateScreenCubit(),
      child: Scaffold(
        backgroundColor: Kbackground,
        appBar: AppBar(
          backgroundColor: Kbackground,
          title: Text(
            'Film time & subtitle',
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
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            todayDecoration: BoxDecoration(
                              color: kbutton,
                              shape: BoxShape.circle,
                            ),
                            defaultTextStyle: TextStyle(color: Colors.white),
                            selectedTextStyle: TextStyle(color: Colors.white),
                            todayTextStyle: TextStyle(color: Colors.white),
                          ),
                          daysOfWeekStyle: const DaysOfWeekStyle(
                            weekdayStyle: TextStyle(color: Colors.white),
                            weekendStyle: TextStyle(color: Colors.white),
                          ),
                          headerStyle: const HeaderStyle(
                            leftChevronIcon:
                                Icon(Icons.chevron_left, color: Colors.white),
                            rightChevronIcon:
                                Icon(Icons.chevron_right, color: Colors.white),
                            formatButtonVisible: false,
                            titleCentered: true,
                            titleTextStyle:
                                TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          selectedDayPredicate: (day) => isSameDay(day,
                              context.read<TimaAndDateScreenCubit>().today),
                          focusedDay:
                              context.read<TimaAndDateScreenCubit>().today,
                          firstDay: DateTime.utc(2025, 4, 16),
                          lastDay: DateTime.utc(2025, 7, 1),
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

                // // Standard Time Chips Section
                // Padding(
                //   padding: EdgeInsets.all(size.height * 0.01),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.all(size.width * 0.01),
                //         child: Row(
                //           children: [
                //             Text(
                //               'Standard ',
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 18.sp,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //             Text(
                //               ' ( 80 SAR)',
                //               style: TextStyle(
                //                 color: Ktext,
                //                 fontSize: 12.sp,
                //                 fontWeight: FontWeight.normal,
                //               ),
                //             ),
                //             Spacer(),
                //             Text(
                //               'Hale 1',
                //               style: TextStyle(
                //                 color: Ktext,
                //                 fontSize: 12.sp,
                //                 fontWeight: FontWeight.normal,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       BlocBuilder<TimaAndDateScreenCubit,
                //           TimaAndDateScreenState>(
                //         buildWhen: (previous, current) =>
                //             current is TimeHaleStandard ||
                //             current is TimeHaleIMAX,
                //         builder: (context, state) {
                //           final standardTimes = context
                //               .read<TimaAndDateScreenCubit>()
                //               .standardTimes;
                //           final selectedStandardTime = context
                //               .read<TimaAndDateScreenCubit>()
                //               .selectedStandardTime;

                //           return SizedBox(
                //             height: 50, // Adjust height to fit the ChoiceChip
                //             child: ListView.builder(
                //               scrollDirection: Axis.horizontal,
                //               itemCount: standardTimes.length,
                //               itemBuilder: (context, index) {
                //                 final isSelected = standardTimes[index] ==
                //                     selectedStandardTime;
                //                 return Padding(
                //                   padding: const EdgeInsets.symmetric(
                //                       horizontal: 3.0),
                //                   child: ChoiceChip(
                //                     backgroundColor: ksmallActionColor,
                //                     selectedColor: kbutton,
                //                     label: Text(
                //                       standardTimes[index],
                //                       style: TextStyle(
                //                         color: isSelected
                //                             ? Colors.black
                //                             : Colors.white,
                //                       ),
                //                     ),
                //                     selected: isSelected,
                //                     onSelected: (bool selected) {
                //                       context
                //                           .read<TimaAndDateScreenCubit>()
                //                           .selectStandardTime(
                //                               selected ? index : null);
                //                     },
                //                   ),
                //                 );
                //               },
                //             ),
                //           );
                //         },
                //       )
                //     ],
                //   ),
                // ),

                // // IMAX Time Chips Section
                // Padding(
                //   padding: EdgeInsets.all(size.width * 0.01),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.all(size.width * 0.01),
                //         child: Row(
                //           children: [
                //             Text(
                //               'IMAX ',
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 18.sp,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //             Text(
                //               ' ( 120 SAR)',
                //               style: TextStyle(
                //                 color: Ktext,
                //                 fontSize: 12.sp,
                //                 fontWeight: FontWeight.normal,
                //               ),
                //             ),
                //             Spacer(),
                //             Text(
                //               'Hale 2',
                //               style: TextStyle(
                //                 color: Ktext,
                //                 fontSize: 12.sp,
                //                 fontWeight: FontWeight.normal,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       BlocBuilder<TimaAndDateScreenCubit,
                //           TimaAndDateScreenState>(
                //         buildWhen: (previous, current) =>
                //             current is TimeHaleIMAX ||
                //             current is TimeHaleStandard,
                //         builder: (context, state) {
                //           final imaxTimes =
                //               context.read<TimaAndDateScreenCubit>().imaxTimes;
                //           final selectedIMAXTime = context
                //               .read<TimaAndDateScreenCubit>()
                //               .selectedIMAXTime;

                //           return SizedBox(
                //             height:
                //                 50, // Adjust the height to fit the ChoiceChip
                //             child: ListView.builder(
                //               scrollDirection: Axis.horizontal,
                //               itemCount: imaxTimes.length,
                //               itemBuilder: (context, index) {
                //                 final isSelected =
                //                     imaxTimes[index] == selectedIMAXTime;
                //                 return Padding(
                //                   padding: const EdgeInsets.symmetric(
                //                       horizontal: 4.0),
                //                   child: ChoiceChip(
                //                     backgroundColor: ksmallActionColor,
                //                     selectedColor: kbutton,
                //                     label: Text(
                //                       imaxTimes[index],
                //                       style: TextStyle(
                //                         color: isSelected
                //                             ? Colors.black
                //                             : Colors.white,
                //                       ),
                //                     ),
                //                     selected: isSelected,
                //                     onSelected: (bool selected) {
                //                       context
                //                           .read<TimaAndDateScreenCubit>()
                //                           .selectIMAXTime(
                //                               selected ? index : null);
                //                     },
                //                   ),
                //                 );
                //               },
                //             ),
                //           );
                //         },
                //       )
                //     ],
                //   ),
                // ),
                //choose Hale
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.01,
                    horizontal: size.width * 0.03,
                  ),
                  child: BlocBuilder<TimaAndDateScreenCubit,
                      TimaAndDateScreenState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              "Hall Type: ${context.read<TimaAndDateScreenCubit>().isVip ? "VIP" : "Standard"}"),
                          Switch(
                            activeColor: kbutton,
                            inactiveThumbColor: kbutton,
                            // ignore: deprecated_member_use
                            activeTrackColor: kbutton.withOpacity(
                                0.5), // Border-like effect when active
                            inactiveTrackColor: Colors.grey
                                .shade400, // Border-like effect when inactive

                            value: context.read<TimaAndDateScreenCubit>().isVip,
                            onChanged: (value) {
                              context
                                  .read<TimaAndDateScreenCubit>()
                                  .SwitchHale(value);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
                //choose technology
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.01,
                    horizontal: size.width * 0.03,
                  ),
                  child: BlocBuilder<TimaAndDateScreenCubit,
                      TimaAndDateScreenState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              "Technology Type: ${context.read<TimaAndDateScreenCubit>().is3D ? "3D" : "2D"}"),
                          Switch(
                            activeColor: kbutton,
                            inactiveThumbColor: kbutton,
                            // ignore: deprecated_member_use
                            activeTrackColor: kbutton.withOpacity(
                                0.5), // Border-like effect when active
                            inactiveTrackColor: Colors.grey
                                .shade400, // Border-like effect when inactive

                            value: context.read<TimaAndDateScreenCubit>().is3D,
                            onChanged: (value) {
                              context
                                  .read<TimaAndDateScreenCubit>()
                                  .SwitchTech(value);
                            },
                          ),
                        ],
                      );
                    },
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
                            current is TimaAndDateScreenSubtitleSelected,
                        builder: (context, state) {
                          final subtitles =
                              context.read<TimaAndDateScreenCubit>().subtitles;
                          final selectedSubtitle = context
                              .read<TimaAndDateScreenCubit>()
                              .selectedSubtitle;

                          return SizedBox(
                            width:
                                size.width * 0.4, // Set the desired width here
                            child: DropdownButton<String>(
                              value: selectedSubtitle,
                              dropdownColor: ksmallActionColor,
                              iconEnabledColor: Colors.white,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.sp),
                              items: subtitles
                                  .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  context
                                      .read<TimaAndDateScreenCubit>()
                                      .selectSubtitle(newValue);
                                }
                              },
                            ),
                          );
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
                          final lang =
                              context.read<TimaAndDateScreenCubit>().Language;
                          final selectedlang = context
                              .read<TimaAndDateScreenCubit>()
                              .selectedlang;

                          return SizedBox(
                            width:
                                size.width * 0.4, // Set the desired width here
                            child: DropdownButton<String>(
                              value: selectedlang,
                              dropdownColor: ksmallActionColor,
                              iconEnabledColor: Colors.white,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.sp),
                              items: lang
                                  .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  context
                                      .read<TimaAndDateScreenCubit>()
                                      .selectLang(newValue);
                                }
                              },
                            ),
                          );
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
                    showModalBottomSheet(
                      backgroundColor: Kbackground,
                      context: context,
                      builder: (BuildContext context) {
                        return BlocProvider(
                          create: (context) => TimaAndDateScreenCubit(),
                          child: SizedBox(
                            width: 400
                            ,
                            height: 200,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 20,),
                                  Text(
                                    "Avalible Time",
                                     style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                                  ),
                                  // IMAX Time Chips Section at the start of the Column
                                  Padding(
                                    padding:
                                        EdgeInsets.all(size.width * 0.01),
                                    child: BlocBuilder<TimaAndDateScreenCubit,
                                        TimaAndDateScreenState>(
                                      buildWhen: (previous, current) =>
                                          current is TimeHaleIMAX ||
                                          current is TimeHaleStandard,
                                      builder: (context, state) {
                                        final imaxTimes = context
                                            .read<TimaAndDateScreenCubit>()
                                            .imaxTimes;
                                        final selectedIMAXTime = context
                                            .read<TimaAndDateScreenCubit>()
                                            .selectedIMAXTime;
                              
                                        return SizedBox(
                                          height:
                                              100, // Adjust the height to fit the ChoiceChip
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: imaxTimes.length,
                                            itemBuilder: (context, index) {
                                              final isSelected =
                                                  imaxTimes[index] ==
                                                      selectedIMAXTime;
                                              return Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 4.0),
                                                child: ChoiceChip(
                                                  backgroundColor:
                                                      ksmallActionColor,
                                                  selectedColor: kbutton,
                                                  label: Text(
                                                    imaxTimes[index],
                                                    style: TextStyle(
                                                      color: isSelected
                                                          ? Colors.black
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                  selected: isSelected,
                                                  onSelected:
                                                      (bool selected) {
                                                    context
                                                        .read<
                                                            TimaAndDateScreenCubit>()
                                                        .selectIMAXTime(
                                                            selected
                                                                ? index
                                                                : null);
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  // Continue button below the IMAX Time Chips section
                                  ElevatedBtn(
                                    backgroundColor: kbutton,
                                    textColor: ksmallActionColor,
                                    buttonText: "continue",
                                    onPressed: () {
                                      NavigationWidget.pushPage(
                                        context,
                                        SelectSeatScreen(
                                          // title: widget.title,
                                          // syn: widget.syn,
                                          // imgurl: widget.imgurl,
                                          // duration: widget.duration,
                                          // director: "DIRECTOR",
                                          // ar: widget.ar,
                                          // genre: widget.genre,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
