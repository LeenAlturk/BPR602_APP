import 'package:bpr602_cinema/Animation/Fadeinleft.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticket_widget/ticket_widget.dart';

class Tickets extends StatelessWidget {
  const Tickets({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Kbackground,
      appBar: AppBar(
        backgroundColor: Kbackground,
        automaticallyImplyLeading: false,
        title: const Text(
          "View Ticket",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Center(
            child: FadeInLeft(
              child: Padding(
                padding:  EdgeInsets.all(20 ),
                child: TicketWidget(
                  width: size.width * 0.95,
                  height: size.height * 0.8,
                  isCornerRounded: true,
                  padding: EdgeInsets.all(size.height * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "HARRY POTTER",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        "128 Minutes . R17+",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey,
                        ),
                      ),
                      Divider(color: Colors.grey, height: size.height * 0.03),
                      Text(
                        "The Esplanade – Riyadh",
                        style: TextStyle(
                          fontSize: 18.sp,
                        ),
                      ),
                      Text(
                        "Hall 1",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        "Standard",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        "Oct 13, 2024    9:00 - 11:30 PM",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "C6, C7, C8, C9, C10",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "5 Person",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Divider(color: Colors.grey, height: size.height * 0.03,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TicketDetailRow(label: "Booking ID", value: "BKD123YIX"),
                          TicketDetailRow(
                              label: "Transaction ID", value: "TRA456PAY"),
                          TicketDetailRow(label: "Reference ID", value: "REF789RES"),
                        ],
                      ),
                      
                      Divider(color: Colors.grey, height: size.height * 0.03),
                      Text(
                        
                        "Scan this barcode at the entrance to Hall 1",
                        style: TextStyle(color: Colors.grey , fontSize: 12.sp),
                      ),
                      QrImageView(
                        data: "New ticket",
                        version: QrVersions.auto,
                        size: 130.0.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TicketDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const TicketDetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
       Size size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: size.width * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center
        ,
        children: [
          Text(
            label,
            style:  TextStyle(
              fontSize: 16.sp,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style:  TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
