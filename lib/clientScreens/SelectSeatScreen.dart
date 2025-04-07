
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/clientScreens/BookingDetailes.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:flutter/material.dart';

class SelectSeatScreen extends StatefulWidget {
  final String syn;
  final String title;
  final String imgurl;
  final int duration;
  final String director;
  final String ar;
  final String genre;
  const SelectSeatScreen(
      {super.key,
      required this.syn,
      required this.imgurl,
      required this.duration,
      required this.director,
      required this.ar,
      required this.genre,
      required this.title});
  @override
  State<SelectSeatScreen> createState() => _SelectSeatScreenState();
}

enum SeatStatus { available, taken, selected }

class Seat {
  final String id;
  SeatStatus status;

  Seat(this.id, this.status);
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
  final List<List<Seat>> seatMatrix = List.generate(
    8, // 8 rows
    (row) => List.generate(
      10, // 10 columns
      (col) => Seat(
        '${String.fromCharCode(65 + row)}${col + 1}', // A1, A2, ..., H10
        col % 3 == 0 ? SeatStatus.taken : SeatStatus.available,
      ),
    ),
  );

  List<Seat> selectedSeats = [];


  void toggleSeatSelection(Seat seat) {
    setState(() {
      if (seat.status == SeatStatus.available) {
        seat.status = SeatStatus.selected;
        selectedSeats.add(seat);
      } else if (seat.status == SeatStatus.selected) {
        seat.status = SeatStatus.available;
        selectedSeats.remove(seat);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Kbackground,
      appBar: AppBar(
        backgroundColor: Kbackground,
        title: Text(
          'Select Seat in Thieter',
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
      body: Column(
        children: [
          Image.asset(
            "assets/scre cenima.png",
            width: size.width,
            height: size.height * 0.2,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: seatMatrix.length,
              itemBuilder: (context, rowIndex) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: seatMatrix[rowIndex].map((seat) {
                    return GestureDetector(
                      onTap: () {
                        if (seat.status != SeatStatus.taken) {
                          toggleSeatSelection(seat);
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4.0),
                        width: size.width * 0.065,
                        height: size.height * 0.030,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: seat.status == SeatStatus.taken
                              ? Colors.red
                              : seat.status == SeatStatus.selected
                                  ? Colors.green
                                  : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          seat.id,
                          style:  TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4)),
                margin:  EdgeInsets.all(size.width * 0.03),
                width: size.width * 0.065,
                height: size.height * 0.030,
                alignment: Alignment.center,
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Text(
                'Selected',
                style: TextStyle(fontSize: 16.sp, color: Ktext),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(4)),
                margin:  EdgeInsets.all(size.width * 0.03),
                width: size.width * 0.065,
                height: size.height * 0.030,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                'Available',
                style: TextStyle(fontSize: 16.sp, color: Ktext),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(4)),
                margin:  EdgeInsets.all(size.width * 0.03),
                width: size.width * 0.065,
                height: size.height * 0.030,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                'Token',
                style: TextStyle(fontSize: 16.sp, color: Ktext),
              ),
            ],
          ),
        

          Column(
           
            children: [
              Text(
                'Seat(s)',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey[400]),
              ),
               SizedBox(height: size.height * 0.01),
              Wrap(
                spacing: 3.0,
                children: selectedSeats.map((seat) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      seat.id,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Total Price Section
                Column(
                  children: [
                    Text(
                      'Total Price',
                      style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                    ),
                SizedBox(height: size.height * 0.01),
                    
                    Text(
                      '${selectedSeats.length * 100}.00 SAR',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // Selected Seats Section
              ],
            ),
          ),
           SizedBox(
            height: size.height * 0.05,
          ),
          ElevatedBtn(
            backgroundColor: kbutton,
            textColor: ksmallActionColor,
            buttonText: "Continue",
            onPressed: selectedSeats.isNotEmpty
                ? () {
                    NavigationWidget.pushPage(
                        context,
                        BookingDetailes(
                          syn: widget.syn,
                          imgurl: widget.imgurl,
                          duration: widget.duration,
                       
                          totalpriceseat:selectedSeats.length * 100 ,
                          director: 'Director ',
                          ar: widget.ar,
                          genre: widget.genre,
                          title: widget.title,
                        ));
                  }
                : null,
          )
        ],
      ),
    );
  }
}
