import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/HallSelect_cubit/hall_select_cubit.dart';
import 'package:bpr602_cinema/clientScreens/SelectSeatScreen.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HallSelect extends StatelessWidget {
  const HallSelect({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HallSelectCubit(),
      child: BlocConsumer<HallSelectCubit, HallSelectState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Kbackground,
            appBar: AppBar(
              backgroundColor: Kbackground,
              title: Text(
                'Available Film Time ',
                style: TextStyle(color: Ktext, fontSize: 14.sp),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: kbutton),
                onPressed: () => Navigator.of(context).pop(),
              ),
              automaticallyImplyLeading: true,
            ),
            body: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: (){
                             NavigationWidget.pushPage(
                                            context,
                                            SelectSeatScreen(
                                              
                                                ),
                                          );
                    },
                    child: Container(
                      // decoration: BoxDecoration(
                      //   color: ksmallActionColor,
                      //   borderRadius: BorderRadius.circular(20),
                      //   gradient: LinearGradient(
                      //     colors: [
                      //       Color.fromARGB(255, 22, 27, 54),
                      //       ksmallActionColor,
                      //     ],
                      //     begin: Alignment.topLeft,
                      //     end: Alignment.bottomRight,
                      //   ),
                      // ),
                        decoration: BoxDecoration(
                color: ksmallActionColor,
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Color.fromARGB(255, 45, 42, 53), ksmallActionColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
                      child: Padding(
                        padding: EdgeInsets.all(size.height * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.event_seat,
                                  color: kbutton,
                                ),
                                SizedBox(width: size.width * 0.02),
                                Text(
                                  //'Bank Name: ${bank['name']}',
                                  "Halle 1 ",
                                  style: TextStyle(
                                    color: Ktext,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                
                               
                              ],
                            ),
                            Divider(color: Ktext, thickness:1,),
                            SizedBox(height: size.height * 0.02),
                            Row(
                              children: [
                                Icon(
                                  Icons.movie_creation,
                                  color: kbutton,
                                ),
                                SizedBox(width: size.width * 0.02),
                                Text(
                                  'Technology : ',
                                  style: TextStyle(
                                    color:Ktext,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: size.width * 0.02),
                                Text(
                                  '3D ',
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
                                Icon(
                                  Icons.workspace_premium,
                                  color: kbutton,
                                ),
                                SizedBox(width: size.width * 0.02),
                                Text(
                                  "Hall Type :",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                    color: Ktext,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                //     color:Ktext,
                                   SizedBox(width: size.width * 0.02),
                                Text(
                                  "VIP",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                     color:Colors.white,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.02),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: kbutton,
                                ),
                                SizedBox(width: size.width * 0.02),
                                Text(
                                  'Time :',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Ktext,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(width: size.width * 0.02),
                                Text(
                                  '12:00',
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
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
