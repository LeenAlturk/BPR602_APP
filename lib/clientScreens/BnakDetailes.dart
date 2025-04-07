import 'package:bpr602_cinema/Animation/Fadeinfadeout.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:flutter/material.dart';

class BankDetails extends StatelessWidget {
  const BankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Sample data for banks
    final List<Map<String, String>> banks = [
      {
        'name': 'National Bank',
        'location': '123 Main Street, City Center',
        'account': '1234567890',
      },
      {
        'name': 'Global Bank',
        'location': '456 Elm Street, Uptown',
        'account': '9876543210',
      },
      {
        'name': 'City Bank',
        'location': '789 Oak Avenue, Downtown',
        'account': '1122334455',
      },
    ];

    return Scaffold(
      backgroundColor: Kbackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kbutton,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Kbackground,
        title: const Text(style: TextStyle(color: Ktext), 'Bank Details'),
        centerTitle: true,
      ),
      body: FadeInDown(
        child: ListView.builder(
          itemCount: banks.length,
          itemBuilder: (context, index) {
            final bank = banks[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.all(16),
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
                child: Padding(
                  padding:  EdgeInsets.all( size.height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bank Name: ${bank['name']}',
                        style: TextStyle(
                          color:Ktext,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(

                        children: [
                          
                          Icon(Icons.location_pin , color: Ktext,),
                            SizedBox(width: size.width * 0.02),
                          Text(
                            'Location: ${bank['location']}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: size.height * 0.02),
                      Row(
                        children: [
                          Icon(Icons.numbers, color: Ktext,),
                            SizedBox(width: size.width * 0.02),
                          Text(
                            'Account Number: ${bank['account']}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
