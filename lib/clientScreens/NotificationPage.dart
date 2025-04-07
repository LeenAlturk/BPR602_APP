import 'package:bpr602_cinema/Animation/Fadeinfadeout.dart';
import 'package:bpr602_cinema/Animation/Scaletransation.dart';
import 'package:bpr602_cinema/Animation/flab.dart';
import 'package:bpr602_cinema/Animation/zoomin.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Nutificationcubit/notification_cubit.dart';
import 'package:bpr602_cinema/wedgets/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Notificationpage extends StatelessWidget {
  const Notificationpage({super.key});

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => NotificationCubit(),
      child: BlocConsumer<NotificationCubit, NotificationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final selectedIndex =
              (state is SeeallFilterSelected) ? state.selectindex : 0;
          return Scaffold(
            backgroundColor: Kbackground,
            appBar: AppBar(
              actions: [],
              centerTitle: true,
              title: Text(
                'Notification',
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
            body: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: size.width * 0.01),
                        CustomFilterChip(
                          label: 'ALL',
                          isSelected: selectedIndex == 0,
                          onSelected: () {
                            context.read<NotificationCubit>().selectFilter(0);
                          },
                        ),
                        SizedBox(width: size.width * 0.01),
                        CustomFilterChip(
                          label: 'booking alert',
                          isSelected: selectedIndex == 1,
                          onSelected: () {
                            context.read<NotificationCubit>().selectFilter(1);
                          },
                        ),
                        SizedBox(width: size.width * 0.01),
                        CustomFilterChip(
                          label: 'News',
                          isSelected: selectedIndex == 2,
                          onSelected: () {
                            context.read<NotificationCubit>().selectFilter(2);
                          },
                        ),
                        SizedBox(width: size.width * 0.01),
                        CustomFilterChip(
                          label: 'Cinema',
                          isSelected: selectedIndex == 3,
                          onSelected: () {
                            context.read<NotificationCubit>().selectFilter(3);
                          },
                        ),
                      ],
                    ),
                 
                ),
                SizedBox(height: size.height * 0.01),
                Expanded(
                  child: ScaleInUp(
                    child: ListView.builder(
                      itemCount: 3, 
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: size.width * 0.01, vertical:size.height * 0.01),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [
                                   Color.fromARGB(255, 22, 27, 54),
                                  ksmallActionColor,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(size.height * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 15.sp,
                                      ),
                                      Text(
                                        'Notification Title $index',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '14-11-2025',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  Text(
                                    'This is the description of notification $index. It provides more details about the alert.',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height:  size.height * 0.01),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
