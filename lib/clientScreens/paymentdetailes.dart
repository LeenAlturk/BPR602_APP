import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/wedgets/itembill.dart';
import 'package:bpr602_cinema/wedgets/itembillassets.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Paymentdetailes extends StatelessWidget {
  const Paymentdetailes({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Kbackground,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Kbackground,
        title: const Text(
          'Payment Detailes',
          style: TextStyle(color: Ktext),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kbutton,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              itembillassets(
                size: size,
                imgurl:
                    'https://m.media-amazon.com/images/M/MV5BMTQxNzY1MjI5NF5BMl5BanBnXkFtZTcwNTI0MDY1OQ@@._V1_QL75_UX380_CR0,20,380,562_.jpg',
                title: "Minions",
                price: 100,
                date: '12-10-2024',
                Seat: 'C7 , C8 , C9 , C10',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.all(size.width * 0.02),
                child: Divider(
                  thickness: 1,
                  color: Whitconst,
                ),
              ),
           Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Total :',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${100 + 100} .IQD',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: size.width * 0.03),
                        PhosphorIcon(
                          Icons.price_check_rounded,
                          color: Colors.green,
                        )
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
