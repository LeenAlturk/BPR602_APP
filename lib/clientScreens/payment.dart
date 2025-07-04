import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Animation/Fadeinfadeout.dart';
import 'package:bpr602_cinema/Animation/Scaletransation.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Paymentcubit/payment_cubit.dart';
import 'package:bpr602_cinema/clientScreens/BnakDetailes.dart';
import 'package:bpr602_cinema/clientScreens/indexedstackclientnav.dart';
import 'package:bpr602_cinema/clientScreens/paymentdetailes.dart';
import 'package:bpr602_cinema/clientScreens/uploadpayReceipts.dart';
import 'package:bpr602_cinema/clientScreens/userbooking.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/filter.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Payments extends StatelessWidget {
  final String? selectedMethod;

  const Payments({super.key, this.selectedMethod});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => PaymentCubit()..getNowShowingMovies(),
      child: BlocListener<PaymentCubit, PaymentState>(
        listener: (context, state) {
          if (state is PaymentError) {
            if (state.message == "Session Is Done") {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            } else if (state.message == "No Internet Connection") {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => NoInternetScreen()),
                  (route) => false);
            } else {
              AppConstants.showToast(context, state.message);
            }
          }
        },
        child: Scaffold(
          backgroundColor: Kbackground,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Kbackground,
            title: Text(
              'My Payments',
              style: TextStyle(color: Ktext),
            ),
            leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: kbutton,
                ),
                onPressed: () => NavigationWidget.pushPage(
                      context,
                      IndexedStackTeacherScreen(
                        initialIndex: 2,
                      ),
                    )),
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
              final cubit = context.watch<PaymentCubit>();
              final selectedIndex = cubit.selectedFilter ?? 0;

              if (state is Paymentloading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is PaymentError) {
                return Center(
                    child: Text(state.message,
                        style: const TextStyle(color: Colors.red)));
              }

              final dataList = cubit.getpayment?.data ?? [];

              return Column(
                children: [
                  // ✅ الفلاتر دائمًا ظاهرة
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomFilterChip(
                        label: 'Pending',
                        isSelected: selectedIndex == 0,
                        onSelected: () {
                          context
                              .read<PaymentCubit>()
                              .selectFilter(0, "Pending");
                        },
                      ),
                      CustomFilterChip(
                        label: 'Accepted',
                        isSelected: selectedIndex == 1,
                        onSelected: () {
                          context
                              .read<PaymentCubit>()
                              .selectFilter(1, "Accepted");
                        },
                      ),
                      CustomFilterChip(
                        label: 'Canceled',
                        isSelected: selectedIndex == 2,
                        onSelected: () {
                          context
                              .read<PaymentCubit>()
                              .selectFilter(2, "canceled");
                        },
                      ),
                    ],
                  ),

                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await context
                            .read<PaymentCubit>()
                            .getNowShowingMovies();
                      },
                      child: dataList.isEmpty
                          ? const SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(50),
                                  child: Text(
                                    'No payments found for this filter.',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : ScaleInUp(
                              child: ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: dataList.length,
                                itemBuilder: (context, index) {
                                  final item = dataList[index];
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
                                            const Color.fromARGB(
                                                255, 22, 27, 54),
                                            ksmallActionColor,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      padding:
                                          EdgeInsets.all(size.width * 0.04),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Payment Number : ${item.id}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Whitconst,
                                              fontSize: size.width * 0.045,
                                            ),
                                          ),
                                          const Divider(thickness: 1),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${item.booking!.movieTime!.movie?.name ?? "No Name"} ',
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        color: Ktext),
                                                  ),
                                                  Text(
                                                    'Total Price : ${item.booking!.totalPrice} SYP',
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        color: Whitconst),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          size.height * 0.005),
                                                  Text(
                                                    'Type : ${item.booking!.paymentType}',
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        color: Whitconst),
                                                  ),
                                                  if (item.booking
                                                              ?.hallChairs !=
                                                          null &&
                                                      item.booking!.hallChairs!
                                                          .isNotEmpty)
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: size.height *
                                                              0.005),
                                                      child: Text(
                                                        'Chairs: ${item.booking!.hallChairs!.map((e) => e.code).join(', ')}',
                                                        style: TextStyle(
                                                          fontSize: 15.sp,
                                                          color: Whitconst,
                                                        ),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  SizedBox(
                                                      height:
                                                          size.height * 0.005),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Status ',
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            color: Whitconst),
                                                      ),
                                                      SizedBox(
                                                          width: size.width *
                                                              0.01),
                                                      Text(
                                                        '${item.status}',
                                                        style: TextStyle(
                                                          fontSize: 15.sp,
                                                          color: item.status ==
                                                                  "Pending"
                                                              ? const Color
                                                                  .fromARGB(255,
                                                                  104, 97, 97)
                                                              : item.status ==
                                                                      "Accepted"
                                                                  ? Colors.green
                                                                  : Colors.red,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          if (cubit.seectedfilterString ==
                                              "canceled")
                                            Text(
                                              '${item.cancellationReason ?? "No Reason"} ',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Whitconst),
                                            ),
                                          if (item.booking?.paymentType !=
                                              "Cash")
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: size.height * 0.02),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: item.receiptImage != null
                                                    ? ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        child: Image.network(
                                                          "${LinksUrl.baseUrl}${item.receiptImage!.url}",
                                                          width:
                                                              size.width * 0.6,
                                                          height: size.height *
                                                              0.15,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      )
                                                    : Text(
                                                        "No payment receipt yet",
                                                        style: TextStyle(
                                                          color: Colors.white70,
                                                          fontSize: size.width *
                                                              0.035,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          if (item.booking?.paymentType !=
                                                  "Cash" &&
                                              (cubit.seectedfilterString ==
                                                      "Pending" ||
                                                  cubit.seectedfilterString ==
                                                      "canceled"))
                                            Align(
                                              alignment: Alignment.center,
                                              child: TextButton(
                                                onPressed: () {
                                                  NavigationWidget.pushPage(
                                                    context,
                                                    Uploadpayreceipts(
                                                        paymentid: item.id!),
                                                  );
                                                },
                                                child: Text(
                                                  "Upload Receipt",
                                                  style: TextStyle(
                                                    fontSize: size.width * 0.04,
                                                    color: kbutton,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
