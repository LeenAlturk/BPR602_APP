
import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/Animation/Fadeinfadeout.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/DetailesCubit/detailes_cubit.dart';
import 'package:bpr602_cinema/clientScreens/TimaAndDateScreen.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/seeallMovieCard.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailesPage extends StatelessWidget {
  
  final bool Isshowing;
  final int id;

  const DetailesPage({
    super.key,
    required this.Isshowing,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<Map<String, String>> castList = [
      {
        "name": "Pierre Coffin",
        "photo": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFMCkoVu64f_681eRDxbyq0_JW2lX8PK6Vla5nel49I2suSRbQBpIF3DfAxOWf4lhEPVdlEZb6Sg08X6hpiprIaA"
      },
      {
        "name": "Benjamin Bratt",
        "photo": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHg015qGeq5v_rkgRNfJHvChEnxvqfAAygZc0K6sO-ZqhCM2FAwQaQ-caGXiOfJq3WiaZlDbQPtKlJmlD-EBL_bQ"
      },
      {
        "name": "Ava Benavente",
        "photo": "https://media.licdn.com/dms/image/v2/D4E03AQHHsmwaEV9biA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1703785342675?e=2147483647&v=beta&t=O4h0e5CCWYkk59F2U1ZkvifKMdUcO0ZaZOtfgDBRvwU"
      },
      {
        "name": "Michael Beattie",
        "photo": "https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/252082_v9_ba.jpg"
      },
    ];
    final List<Map<String, String>> directorList = [
      {
        "Posistion": "Director",
        "name": "Pierre Coffin",
        "photo": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFMCkoVu64f_681eRDxbyq0_JW2lX8PK6Vla5nel49I2suSRbQBpIF3DfAxOWf4lhEPVdlEZb6Sg08X6hpiprIaA"
      },
      {
        "Posistion": "Director ASS",
        "name": "Pierre Coffin",
        "photo": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFMCkoVu64f_681eRDxbyq0_JW2lX8PK6Vla5nel49I2suSRbQBpIF3DfAxOWf4lhEPVdlEZb6Sg08X6hpiprIaA"
      },
    ];

    return BlocProvider(
      create: (context) => DetailesCubit()..getMoviedetailes(id), // Only fetch movie details initially
      child: BlocListener<DetailesCubit, DetailesState>(
        listener: (context, state) {
           if (state is DetailEerorstate) {
            if (state.message == "Session Is Done") {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            } else {
              AppConstants.showToast(context, state.message);
            }
          }
          if (state is DetailesAcceptstate && context.read<DetailesCubit>().movieResponseById?.data?.trailerUrl != null) {
            // Once movie details are accepted and trailerUrl is available, initialize the video
            context.read<DetailesCubit>().intialization(context.read<DetailesCubit>().movieResponseById!.data!.trailerUrl!);
          } else if (state is VideoError) {
            print("Listener: Error in video loading - ${state.error}");
          } else if (state is DetailEerorstate) {
            // Handle movie details fetch error, maybe show a snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<DetailesCubit, DetailesState>(
          builder: (context, state) {
            final cubit = context.read<DetailesCubit>();

            if (state is Detailesloadingstate || cubit.movieResponseById?.data == null) {
              return const Scaffold(
                backgroundColor: Kbackground,
                body: Center(child: CircularProgressIndicator()),
              );
            }

            if (state is DetailesAcceptstate || state is VideoLoaded || state is VideoLoading || state is VideoError) {
              return Scaffold(
                backgroundColor: Kbackground,
                appBar: AppBar(
                  backgroundColor: Kbackground,
                  title: Text(
                    cubit.movieResponseById!.data!.name!,
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
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(size.height * 0.002),
                          child: FadeInDown(
                            child: SeeallMovieCard(
                              Language: cubit.movieResponseById!.data!.movieLanguages != null
                                  ? cubit.movieResponseById!.data!.movieLanguages!
                                      .map((type) => type.englishName ?? '')
                                      .join(', ')
                                  : '',
                              title: cubit.movieResponseById!.data!.name!,
                              imgurl: (cubit.movieResponseById?.data?.image?.url != null)
                                  ? '${LinksUrl.baseUrl}${cubit.movieResponseById!.data!.image!.url}'
                                  : 'https://ina.iq/eng/uploads/posts/2021-05/thumbs/upload_1621342522_427621977.png',
                              genre: cubit.movieResponseById!.data!.movieTypes != null
                                  ? cubit.movieResponseById!.data!.movieTypes!
                                      .map((type) => type.englishName ?? '')
                                      .join(', ')
                                  : '',
                              director: cubit.movieResponseById!.data!.director!.firstName!,
                              duration: 90, // Consider getting this from API as well
                              ar: cubit.movieResponseById!.data!.movieClassification!.englishName!,
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
                        // Video player section
                        BlocBuilder<DetailesCubit, DetailesState>(
                          buildWhen: (previous, current) => current is VideoLoading || current is VideoLoaded || current is VideoError,
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
                                child: Text("Initializing Video...",
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
                                  cubit.movieResponseById!.data!.description!,
                                  hashtagStyle: const TextStyle(
                                    color: Color(0xFF30B6F9),
                                  ),
                                  expandText: 'Read more',
                                  collapseText: 'Read less',
                                  maxLines: 3,
                                  linkColor: Ktext,
                                  style: const TextStyle(fontSize: 16.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(size.width * 0.02),
                          child: FadeInDown(
                            child: const Divider(
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
                                                height: size.height,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(size.height * 0.01),
                                                        child: Text(
                                                          "Movie Actor",
                                                          style: TextStyle(
                                                            color: beige3,
                                                            fontSize: 18.sp,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 400,
                                                        child: Padding(
                                                          padding: EdgeInsets.all(size.height * 0.01),
                                                          child: ListView.builder(
                                                            scrollDirection: Axis.vertical,
                                                            shrinkWrap: true,
                                                            itemCount: castList.length,
                                                            itemBuilder: (context, index) {
                                                              return Padding(
                                                                padding: const EdgeInsets.symmetric(
                                                                    vertical: 8.0, horizontal: 16.0),
                                                                child: Row(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(50),
                                                                          child: Image.network(
                                                                            castList[index]["photo"]!,
                                                                            height: 60,
                                                                            width: 60,
                                                                            fit: BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        const SizedBox(width: 16),
                                                                        Text(
                                                                          castList[index]["name"]!,
                                                                          style: const TextStyle(
                                                                            fontSize: 16,
                                                                            color: Colors.white,
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
                                            });
                                      },
                                      icon: const Icon(
                                        Icons.arrow_drop_down_circle,
                                        color: Colors.white,
                                      ),
                                    ),
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
                                    // You might want to pass more details to TimeAndDateScreen
                                  ),
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
