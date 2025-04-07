
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Cubits/IndexedStackEmpcubit/indexed_stack_emp_cubit.dart';
import 'package:bpr602_cinema/employeesScreens/Profile.dart';
import 'package:bpr602_cinema/employeesScreens/ScannerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class IndexedStackEmprScreen extends StatefulWidget {
  final int initialIndex;
  const IndexedStackEmprScreen({
    super.key,
    required this.initialIndex,
  });

  // const IndexedStackTeacherScreen({Key? key}) : super(key: key);

  @override
  State<IndexedStackEmprScreen> createState() =>
      _IndexedStackEmprScreenState();
}

class _IndexedStackEmprScreenState extends State<IndexedStackEmprScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) =>
          IndexedStackEmpCubit()..changeIndex(widget.initialIndex),
      child:
          BlocBuilder<IndexedStackEmpCubit, IndexedStackEmpState>(
        builder: (context, currentIndex) {
          // ignore: deprecated_member_use
          return WillPopScope(
            onWillPop: () async {
              if (currentIndex != 0) {
                context.read<IndexedStackEmpCubit>().changeIndex(0);
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
                      horizontal: size.width * 0.15),
                  child: GNav(
                    gap: 5,
                    tabs: [
                      GButton(
                        iconActiveColor: Colors.black,
                        icon: PhosphorIconsBold.scan,
                        text: 'Scanner',
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
                        context.read<IndexedStackEmpCubit>().currentIndex,
                    onTabChange: (index) {
                      context
                          .read<IndexedStackEmpCubit>()
                          .changeIndex(index);
                    },
                  ),
                ),
              ),
              body: IndexedStack(
                index: context.read<IndexedStackEmpCubit>().currentIndex,
                children: const [
                  Scanner(),
                  EmployeeProfile()
                ],
              ),
            ),
          );
        },
      ),
    );
  }}