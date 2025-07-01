import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Animation/Fadeinleft.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/ticket_cubit/ticket_cubit.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:intl/intl.dart';
class Tickets extends StatelessWidget {
  final int bookingid;
  Tickets({super.key, required this.bookingid});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => TicketCubit()..getticket(bookingid),
      child: BlocConsumer<TicketCubit, TicketState>(
        listener: (context, state) {
          // TODO: implement listener
                if (state is TicketERROR) {
            if (state.message == "Session Is Done") {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            }else if(state.message == 'No Internet Connection') {
                 AppConstants.showToast(context, state.message);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => NoInternetScreen()),
                    (route) => false);
              } else {
              AppConstants.showToast(context, state.message);
            }
          }
        },
        builder: (context, state) {
          final cubit = context.read<TicketCubit>();
              if (state is Ticketloading 
                ) {
              return const Scaffold(
                backgroundColor: Kbackground,
                body: Center(child: CircularProgressIndicator( color: kbutton,)),
              );
              
            }
              if (state is TicketERROR 
                ) {
              return  Scaffold(
                backgroundColor: Kbackground,
               appBar: AppBar(
              backgroundColor: Kbackground,
              automaticallyImplyLeading: false,
              title: const Text(
                "View Ticket",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
               leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: kbutton),
            onPressed: () => 
            Navigator.of(context).pop(),
              
          ),
            ),
                body: Center(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 240,),
                    Icon(Icons.sentiment_dissatisfied, color: Colors.amber , size: 100,),
                    Text("No ticket info available yet" ,style: TextStyle(color: Ktext , fontSize: 14.sp), ),
                  ],
                )),
              );
              
            }
            if(cubit.getbookingbyidResponse?.data == null){
                return const Scaffold(
                backgroundColor: Kbackground,
                body: Center(child: Text(" Your ticket Not Actove Yet "))
              );
            }
          if(state is TicketAcceptstate){
            return Scaffold(
            backgroundColor: Kbackground,
            appBar: AppBar(
              backgroundColor: Kbackground,
              automaticallyImplyLeading: false,
              title: const Text(
                "View Ticket",
                style: TextStyle(color: Colors.white),
              ),
               leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: kbutton),
            onPressed: () => 
            Navigator.of(context).pop(),
              
          ),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                Center(
                  child: FadeInLeft(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: TicketWidget(
                        width: size.width * 0.95,
                        height: size.height * 0.8,
                        isCornerRounded: true,
                        padding: EdgeInsets.all(size.height * 0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                             "${cubit.getbookingbyidResponse!.data!.movieTime!.movie!.name}",
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  " Language : ${cubit.getbookingbyidResponse!.data!.movieTime!.language?.englishName ?? 'No language info' } ",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "| ",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  " Subtitles : ${cubit.getbookingbyidResponse!.data!.movieTime!.subtitle?.englishName ?? 'No Subtitles info' } ",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),


                            Divider(
                                color: Colors.grey, height: size.height * 0.03),
                            Text(
                              "Cinemata",
                              style: TextStyle(
                                fontSize: 18.sp,
                              ),
                            ),
                              Text(
                              "${cubit.getbookingbyidResponse!.data!.movieTime!.hall!.name}",
                              style: TextStyle(
                                fontSize: 18.sp,
                              ),
                            ),
                            Text(
                              " Chaires ${ cubit.getbookingbyidResponse!.data!.hallChairs!.map((e) => e.code).join(', ')}",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${cubit.getbookingbyidResponse!.data!.movieTime!.hall!.isVip == true ? "ViP"  : "STANDARD" }  &  ${cubit.getbookingbyidResponse!.data!.movieTime!.is3D == true ? "3D"  : "2D" } ",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                                
                              ],
                            ),
                             
                            SizedBox(height: 15),
                            
                            Text(
                              "Number of persons : ${cubit.getbookingbyidResponse!.data!.hallChairs!.length}",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                                DateFormat('yyyy-MM-dd').format(
                                                    DateTime.parse(cubit.getbookingbyidResponse!.data!.bookingDate
                                                        .toString())),
                                                style:
                                                    TextStyle(color: Colors.grey),
                                              ),
                                               Text(
                                  " | ",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                                                             Text(
                                 '${cubit.getbookingbyidResponse!.data!.movieTime!.time!}',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.grey,
                                  ),
                                                             ),
                               ],
                             ),
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            Divider(
                              color: Colors.grey,
                              height: size.height * 0.03,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TicketDetailRow(
                                    label: "Booking ID", value: "${cubit.getbookingbyidResponse!.data!.id}"),
                                SizedBox(
                              height: size.height * 0.04,
                            ),
                              ],
                            ),
                         
                            Text(
                              "Scan this barcode at the entrance to ${cubit.getbookingbyidResponse!.data!.movieTime!.hall!.name}",
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 12.sp),
                            ),
                            QrImageView(
                              data: "${cubit.getbookingbyidResponse!.data!.id}",
                              version: QrVersions.auto,
                              size: 130.0.sp,
                            ),
                            Text("Enjoy your Watching" ,  style: TextStyle(
                                  color: Colors.grey, fontSize: 12.sp))
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
          return SizedBox();
        },
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
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
