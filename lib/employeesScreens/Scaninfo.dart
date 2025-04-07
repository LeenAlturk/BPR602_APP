import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Scaninfo extends StatelessWidget {
  final String result;
  const Scaninfo({super.key , required this.result});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
       backgroundColor: Kbackground,
      appBar: AppBar(
        backgroundColor: Kbackground,
        centerTitle: true,
        title: Text('QR Scan Result' , style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: true,
         leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kbutton,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
                   width: size.width * 0.8,
                   height: size.height * 0.4,
      decoration: BoxDecoration(
        color: ksmallActionColor,
        borderRadius: BorderRadius.circular(12),
     
        gradient: const LinearGradient(
          colors: [
            Color(0xFF303030), 
            ksmallActionColor
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                            'assets/svg/scan.json',
                            width: size.width * 0.5,
                            height: size.height * 0.2,
                          ),
                            SizedBox(height: size.height * 0.02,),
                  Text("Client Ticket Information" ,   style: TextStyle(
                      color: const Color.fromARGB(255, 216, 207, 168),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: size.height * 0.05,),
                  Center(
                    child: Text(result , style: TextStyle(
                      color: Ktext,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}