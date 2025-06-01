
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/clientScreens/Bill.dart';
import 'package:bpr602_cinema/clientScreens/snackscreen.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/seeallMovieCard.dart';
import 'package:flutter/material.dart';

class BookingDetailes extends StatelessWidget {
  // final String? title;
  // final String? syn;
  // final String? imgurl;
  // final int? duration;
  // final String? director;
  // final String? ar;
  // final String? genre;
  // final int? totalpriceseat;
  // final double? totalSnackPrice;
  const BookingDetailes(
      {super.key,
      //  this.syn,
      //  this.totalpriceseat,
      //  this.imgurl,
      //  this.duration,
      //  this.director,
      //  this.ar,
      //  this.genre,
      //  this.totalSnackPrice ,
      //  this.title
       });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //int mytotalpriceseat = totalpriceseat!;
    return Scaffold(
      backgroundColor: Kbackground,
      appBar: AppBar(
        backgroundColor: Kbackground,
        title: Text(
          'Minions Detailes',
          style: TextStyle(color: Ktext, fontSize: 14.sp),
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
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(size.height * 0.02),
                child: SeeallMovieCard(
                  subtitle: "En",
                  rating: 4.5,
                  Language: "EN",
                  title: "Minions",
                  imgurl: "https://m.media-amazon.com/images/M/MV5BMTQxNzY1MjI5NF5BMl5BanBnXkFtZTcwNTI0MDY1OQ@@._V1_QL75_UX380_CR0,20,380,562_.jpg",
                  genre: "Animation",
                  director: "director",
                  duration: 98,
                  ar: "+18",
                ),
              ),
              Container(
                width: size.width * 0.9,
                height: size.height * 0.4,
                decoration: BoxDecoration(
        color: ksmallActionColor,
        borderRadius: BorderRadius.circular(12),
     
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 28, 33, 72),
            ksmallActionColor
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
                child: Padding(
                  padding:  EdgeInsets.all(size.height * 0.01),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(size.width * 0.0004),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Booking Detailes',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
              
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Package',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Standard',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hail',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Hall1',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Seat(s)',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'C1 , C3 , B5',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '1/ 12 / 2025',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hour',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '12:00 AM',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.normal),
                          ),
                          
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  NavigationWidget.pushPage(context, const SnackScreen());
                },
                child: Container(
                    decoration: BoxDecoration(
        color: ksmallActionColor,
        borderRadius: BorderRadius.circular(12),
     
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 28, 33, 72),
            ksmallActionColor
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
                  width: size.width * 0.9,
                  height: size.height * 0.14,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(size.width * 0.0348),
                        child: Image.asset("assets/pobCorn.png"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Book Your ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Snack .......',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.09,
                      ),
                      IconButton(
                        onPressed: () {
                            NavigationWidget.pushPage(context, const SnackScreen());
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.all(
              size.height * 0.01,
            ),
            child: ElevatedBtn(
              backgroundColor: kbutton,
              textColor: ksmallActionColor,
              buttonText: "Continue",
              onPressed: () {
                NavigationWidget.pushPage(context, Bill(
                   //totalpriceseat: mytotalpriceseat , title: title!, imgurl: imgurl!,
                   ));
              },
            ),
          )
        ],
      ),
    );
  }
}
