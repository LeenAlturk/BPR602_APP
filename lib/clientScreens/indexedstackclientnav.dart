
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Cubits/indexedStackClientAppCubit/indexedstackclientapp_cubit.dart';
import 'package:bpr602_cinema/clientScreens/Home.dart';
import 'package:bpr602_cinema/clientScreens/payment.dart';
import 'package:bpr602_cinema/clientScreens/profile.dart';
import 'package:bpr602_cinema/clientScreens/search.dart';
import 'package:bpr602_cinema/clientScreens/ticket.dart';
import 'package:bpr602_cinema/clientScreens/userbooking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class IndexedStackTeacherScreen extends StatefulWidget {
  final int initialIndex;
  const IndexedStackTeacherScreen({
    super.key,
    required this.initialIndex,
  });

  // const IndexedStackTeacherScreen({Key? key}) : super(key: key);

  @override
  State<IndexedStackTeacherScreen> createState() =>
      _IndexedStackTeacherScreenState();
}

class _IndexedStackTeacherScreenState extends State<IndexedStackTeacherScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) =>
          IndexedstackclientappCubit()..changeIndex(widget.initialIndex),
      child:
          BlocBuilder<IndexedstackclientappCubit, IndexedstackclientappState>(
        builder: (context, currentIndex) {
          // ignore: deprecated_member_use
          return WillPopScope(
            onWillPop: () async {
              if (currentIndex != 0) {
                context.read<IndexedstackclientappCubit>().changeIndex(0);
                return false;
              } else {
                return true;
              }
            },
            child: Scaffold(
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  color: Kbackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.01,
                      horizontal: size.width * 0.02),
                  child: GNav(
                    gap: 7,
                    tabs: [
                      GButton(
                        iconActiveColor: Colors.black,
                        icon: PhosphorIconsBold.house,
                        text: 'Home',
                        iconColor: Colors.white,
                        textColor: Colors.black,
                        backgroundColor: kbutton,
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.008,
                            horizontal: size.width * 0.03),
                      ),
                      GButton(
                        iconActiveColor: Colors.black,
                        icon: PhosphorIconsRegular.magnifyingGlass,
                        text: 'Search',
                        iconColor: Colors.white,
                        textColor: Colors.black,
                        backgroundColor: kbutton,
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.008,
                            horizontal: size.width * 0.03),
                      ),
                      GButton(
                        iconActiveColor: Colors.black,
                        icon: Icons.payment,
                        text: 'bookings',
                        iconColor: Colors.white,
                        textColor: Colors.black,
                        backgroundColor: kbutton,
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.008,
                            horizontal: size.width * 0.03),
                      ),
                      GButton(
                        iconActiveColor: Colors.black,
                        icon: PhosphorIconsBold.ticket,
                        text: 'ticket',
                        iconColor: Colors.white,
                        textColor: Colors.black,
                        backgroundColor: kbutton,
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.008,
                            horizontal: size.width * 0.03),
                      ),
                      GButton(
                        iconActiveColor: Colors.black,
                        icon: PhosphorIconsBold.user,
                        text: 'profile',
                        iconColor: Colors.white,
                        textColor: Colors.black,
                        backgroundColor: kbutton,
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.008,
                            horizontal: size.width * 0.03),
                      ),
                    ],
                    selectedIndex:
                        context.read<IndexedstackclientappCubit>().currentIndex,
                    onTabChange: (index) {
                      context
                          .read<IndexedstackclientappCubit>()
                          .changeIndex(index);
                    },
                  ),
                ),
              ),
              body: IndexedStack(
                index: context.read<IndexedstackclientappCubit>().currentIndex,
                children:  [
                  HomeScreen(),
                  SearchScreen(),
                  UserBooking(),
                  Tickets(),
                  Clientprofile()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
