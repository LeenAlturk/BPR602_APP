import 'package:bpr602_cinema/Animation/Fadeinfadeout.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/DetailesCubit/detailes_cubit.dart';
import 'package:bpr602_cinema/clientScreens/TimaAndDateScreen.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/seeallMovieCard.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailesPage extends StatelessWidget {
  final String videoUrl =
      "https://youtu.be/TbiPcMCz0Ek?si=j5Aq9qRnAHLZOWuD"; // Your video URL
  final String title;
  final bool Isshowing;
  final String syn;
  final String imgurl;
  final int duration;
  final String director;
  final String ar;
  final String genre;

  const DetailesPage({
    super.key,
    required this.imgurl,
    required this.Isshowing,
    required this.syn,
    required this.title,
    required this.duration,
    required this.director,
    required this.ar,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Sample cast data
    final List<Map<String, String>> castList = [
      {
        "name": "Pierre Coffin",
        "photo":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFMCkoVu64f_681eRDxbyq0_JW2lX8PK6Vla5nel49I2suSRbQBpIF3DfAxOWf4lhEPVdlEZb6Sg08X6hpiprIaA"
      },
      {
        "name": "Benjamin Bratt",
        "photo":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHg015qGeq5v_rkgRNfJHvChEnxvqfAAygZc0K6sO-ZqhCM2FAwQaQ-caGXiOfJq3WiaZlDbQPtKlJmlD-EBL_bQ"
      },
      {
        "name": "Ava Benavente",
        "photo":
            "https://media.licdn.com/dms/image/v2/D4E03AQHHsmwaEV9biA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1703785342675?e=2147483647&v=beta&t=O4h0e5CCWYkk59F2U1ZkvifKMdUcO0ZaZOtfgDBRvwU"
      },
      {
        "name": "Michael Beattie",
        "photo":
            "https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/252082_v9_ba.jpg"
      },
    
    ];
    final List<Map<String, String>> directorList = [
      {
        "Posistion":"Director",
        "name": "Pierre Coffin",
        "photo":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFMCkoVu64f_681eRDxbyq0_JW2lX8PK6Vla5nel49I2suSRbQBpIF3DfAxOWf4lhEPVdlEZb6Sg08X6hpiprIaA"
      },
      {
        "Posistion":"Director ASS",
        "name": "Pierre Coffin",
        "photo":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFMCkoVu64f_681eRDxbyq0_JW2lX8PK6Vla5nel49I2suSRbQBpIF3DfAxOWf4lhEPVdlEZb6Sg08X6hpiprIaA"
      },
     
    ];
    return BlocProvider(
      create: (context) => DetailesCubit()..intialization(videoUrl),
      child: Scaffold(
        backgroundColor: Kbackground,
        appBar: AppBar(
          backgroundColor: Kbackground,
          title: Text(
            '$title Detailes',
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
        body: BlocListener<DetailesCubit, DetailesState>(
          listener: (context, state) {
            if (state is VideoError) {
              print("Listener: Error in video loading - ${state.error}");
            }
          },
          child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.002),
                    child: FadeInDown(
                      child: SeeallMovieCard(
                        Language: "EN",
                        title: title,
                        imgurl: imgurl,
                        genre: genre,
                        director: director,
                        duration: duration,
                        ar: ar,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: FadeInDown(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Watch Trailer',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: Ktext,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<DetailesCubit, DetailesState>(
                    builder: (context, state) {
                      if (state is VideoLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is VideoError) {
                        return Center(
                          child: Text(state.error,
                              style: const TextStyle(color: Colors.red)),
                        );
                      } else if (state is VideoLoaded) {
                        return Column(
                          children: [
                            FadeInDown(
                              child: YoutubePlayer(
                                bottomActions: [
                                  
                                  CurrentPosition(),
                                  ProgressBar(isExpanded: true),
                                  RemainingDuration(),
                                 
                                ],
                                
                                controller: state.controller,
                                showVideoProgressIndicator: true,
                                onReady: () {
                                  print("YouTube Player Ready");
                                },
                              ),
                            ),
                          ],
                        );
                      }
                      return const Center(
                          child: Text("Initializing...",
                              style: TextStyle(color: Colors.grey)));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FadeInDown(
                          child: Text(
                            "Synopsis",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: Ktext,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.01),
                    child: FadeInDown(
                      child: Column(
                        children: [
                          ExpandableText(
                            syn,
                            hashtagStyle: const TextStyle(
                              color: Color(0xFF30B6F9),
                            ),
                            expandText: 'Read more',
                            collapseText: 'Read less',
                            maxLines: 3,
                            linkColor: Ktext,
                            style: const TextStyle(
                                fontSize: 16.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: FadeInDown(
                      child: Divider(
                        thickness: 2,
                        color: Colors.white10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FadeInDown(
                          child: Row(
                            children: [
                              Text(
                                "Cast",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        backgroundColor: Kbackground,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SizedBox(
                                            width: 400,
                                            height: size.height ,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                   Padding(
                                                     padding: EdgeInsets.all(
                                                        size.height * 0.01),
                                                     child: Text("Movie Actor", style: TextStyle(
                                                              color: beige3,
                                                              fontSize: 18.sp,
                                                              fontWeight: FontWeight.bold,
                                                              
                                                            ),),
                                                   ),
                                                  SizedBox(
                                                     height: 400, 
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          size.height * 0.01),
                                                      child: ListView.builder(
                                                        scrollDirection: Axis.vertical,
                                                        shrinkWrap: true,
                                                       
                                                        itemCount: castList.length,
                                                        itemBuilder: (context, index) {
                                                          return Padding(
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8.0,
                                                                horizontal: 16.0),
                                                                
                                                            child: Row(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  50),
                                                                      child:
                                                                          Image.network(
                                                                        castList[index]
                                                                            ["photo"]!,
                                                                        height: 60,
                                                                        width: 60,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        width: 16),
                                                                    Text(
                                                                      castList[index]
                                                                          ["name"]!,
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize: 16,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                 
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                        );
                                  },
                                  icon: Icon(
                                    Icons.arrow_drop_down_circle,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (Isshowing == true)
                    FadeInDown(
                      child: ElevatedBtn(
                        backgroundColor: kbutton,
                        textColor: ksmallActionColor,
                        buttonText: "Booking Now",
                        onPressed: () {
                          NavigationWidget.pushPage(
                              context,
                              TimeAndDateScreen(
                                title: title,
                                imgurl: imgurl,
                                syn: syn,
                                duration: duration,
                                director: 'the director',
                                ar: ar,
                                genre: genre,
                              ));
                        },
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
