import 'package:bpr602_cinema/Animation/Fadeinfadeout.dart';
import 'package:bpr602_cinema/Animation/Scaletransation.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Paymentcubit/payment_cubit.dart';
import 'package:bpr602_cinema/clientScreens/BnakDetailes.dart';
import 'package:bpr602_cinema/clientScreens/paymentdetailes.dart';
import 'package:bpr602_cinema/clientScreens/uploadpayReceipts.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Payments extends StatelessWidget {
  final String? selectedMethod;

  const Payments({super.key, this.selectedMethod});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: Scaffold(
        backgroundColor: Kbackground,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Kbackground,
          title: Text(
            'My Payments',
            style: TextStyle(color: Ktext),
          ),
          actions: [
            Padding(
                padding: EdgeInsets.all(size.height * 0.01),
                child: IconButton(
                    onPressed: () {
                      NavigationWidget.pushPage(context, BankDetails());
                    },
                    icon: Icon(
                      Icons.info,
                      color: Colors.white,
                    )))
            //Notificationpage
          ],
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) {
            final selectedIndex =
                (state is SeeallFilterSelected) ? state.selectindex : 0;

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomFilterChip(
                      label: 'Upcoming',
                      isSelected: selectedIndex == 0,
                      onSelected: () {
                        context.read<PaymentCubit>().selectFilter(0);
                      },
                    ),
                    CustomFilterChip(
                      label: 'Passed',
                      isSelected: selectedIndex == 1,
                      onSelected: () {
                        context.read<PaymentCubit>().selectFilter(1);
                      },
                    ),
                    CustomFilterChip(
                      label: 'Canceled',
                      isSelected: selectedIndex == 2,
                      onSelected: () {
                        context.read<PaymentCubit>().selectFilter(2);
                      },
                    ),
                  ],
                ),
                Expanded(
  child: ScaleInUp(
    child: ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.01,
            horizontal: size.width * 0.04,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: ksmallActionColor,
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 22, 27, 54),
                  ksmallActionColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: EdgeInsets.all(size.width * 0.04),
            child: Column(
            
              children: [
                Text(
                  'Bill Number : $index',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Whitconst,
                    fontSize: size.width * 0.045, 
                  ),
                ),
                Divider(thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total : 500 iQD',
                          style: TextStyle(
                            fontSize: size.width * 0.04, 
                            color: Whitconst,
                          ),
                        ),
                        SizedBox(height: size.height * 0.005),
                        Text(
                          'Type : Bank',
                          style: TextStyle(
                            fontSize: size.width * 0.04,
                            color: Whitconst,
                          ),
                        ),
                        SizedBox(height: size.height * 0.005),
                        Row(
                          children: [
                            Text(
                              'Status ',
                              style: TextStyle(
                                fontSize: size.width * 0.04,
                                color: Whitconst,
                              ),
                            ),
                            SizedBox(width: size.width * 0.01),
                            Text(
                              'Waiting',
                              style: TextStyle(
                                fontSize: size.width * 0.04,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            NavigationWidget.pushPage(
                              context,
                              Uploadpayreceipts(),
                            );
                          },
                          child: Text(
                            "Upload Recipt",
                            style: TextStyle(
                              fontSize: size.width * 0.04,
                              color: kbutton,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            NavigationWidget.pushPage(
                              context,
                              Paymentdetailes(),
                            );
                          },
                          child: Text(
                            "See Detailes",
                            style: TextStyle(
                              fontSize: size.width * 0.04,
                              color: kbutton,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
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
