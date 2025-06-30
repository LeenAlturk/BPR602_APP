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

  const TimeAndDateScreen({super.key, required this.id});

  @override
  State<TimeAndDateScreen> createState() => _TimeAndDateScreenState();
}

class _TimeAndDateScreenState extends State<TimeAndDateScreen> {
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
                'Date of Booking',
                style: TextStyle(color: Ktext, fontSize: 14.sp),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: kbutton),
                onPressed: () => Navigator.of(context).pop(),
              ),
              automaticallyImplyLeading: true,
            ),
            body: ListView(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Select your favorate ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.sp),
                          ),
                          Text(
                            'booking Date',
                            style:
                                TextStyle(color: Colors.amber, fontSize: 16.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
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
                                      todayTextStyle:
                                          TextStyle(color: Colors.white),
                                    ),
                                    daysOfWeekStyle: const DaysOfWeekStyle(
                                      weekdayStyle:
                                          TextStyle(color: Colors.white),
                                      weekendStyle:
                                          TextStyle(color: Colors.white),
                                    ),
                                    headerStyle: const HeaderStyle(
                                      leftChevronIcon: Icon(Icons.chevron_left,
                                          color: Colors.white),
                                      rightChevronIcon: Icon(
                                          Icons.chevron_right,
                                          color: Colors.white),
                                      formatButtonVisible: false,
                                      titleCentered: true,
                                      titleTextStyle: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    selectedDayPredicate: (day) => isSameDay(
                                        day,
                                        context
                                            .read<TimaAndDateScreenCubit>()
                                            .today),
                                    // Ensure focusedDay is within the range
                                    focusedDay: _getValidFocusedDay(
                                      context
                                          .read<TimaAndDateScreenCubit>()
                                          .today,
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
                      BlocBuilder<TimaAndDateScreenCubit,
                          TimaAndDateScreenState>(
                        builder: (context, state) {
                          final cubit = context.read<TimaAndDateScreenCubit>();

                          return ElevatedBtn(
                            backgroundColor: cubit.isDateSelected == true
                                ? kbutton
                                : Colors.grey,
                            textColor: ksmallActionColor,
                            buttonText: "Submit",
                            onPressed: cubit.isDateSelected == true
                                ? () {
                                    final selectedDate = cubit.today;
                                    context
                                        .read<BookingCubit>()
                                        .selectDate(selectedDate);

                                    NavigationWidget.pushPage(
                                      context,
                                      HallSelect(id: widget.id),
                                    );
                                  }
                                : null,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
