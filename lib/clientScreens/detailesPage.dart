import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Animation/Fadeinfadeout.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Cartcubit/shopping_cart_cubit.dart';
import 'package:bpr602_cinema/Cubits/DetailesCubit/detailes_cubit.dart';
import 'package:bpr602_cinema/Cubits/bookingCubit/booking_cubit.dart';
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


    return BlocProvider(
      create: (context) => DetailesCubit()
        ..getMoviedetailes(id), 
      child: BlocListener<DetailesCubit, DetailesState>(
        listener: (context, state) {
          if (state is DetailEerorstate) {
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
          if (state is DetailesAcceptstate &&
              context
                      .read<DetailesCubit>()
                      .movieResponseById
                      ?.data
                      ?.trailerUrl !=
                  null) {
           
            context.read<DetailesCubit>().intialization(context
                .read<DetailesCubit>()
                .movieResponseById!
                .data!
                .trailerUrl!);
          } else if (state is VideoError) {
            print("Listener: Error in video loading - ${state.error}");
          } else if (state is DetailEerorstate) {
           
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<DetailesCubit, DetailesState>(
          builder: (context, state) {
            final cubit = context.read<DetailesCubit>();

            if (state is Detailesloadingstate ||
                cubit.movieResponseById?.data == null) {
              return const Scaffold(
                backgroundColor: Kbackground,
                body: Center(child: CircularProgressIndicator( color: kbutton,)),
              );
            }

            if (state is DetailesAcceptstate ||
                state is VideoLoaded ||
                state is VideoLoading ||
                state is VideoError) {
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
                              status: cubit.movieResponseById!.data!.status,
                              subtitle: cubit.movieResponseById!.data!
                                          .movieSubtitles !=
                                      null
                                  ? cubit
                                      .movieResponseById!.data!.movieSubtitles!
                                      .map((type) => type.englishName ?? '')
                                      .join(', ')
                                  : '',
                              rating: cubit.movieResponseById!.data!.rate!,
                              Language: cubit.movieResponseById!.data!
                                          .movieLanguages !=
                                      null
                                  ? cubit
                                      .movieResponseById!.data!.movieLanguages!
                                      .map((type) => type.englishName ?? '')
                                      .join(', ')
                                  : '',
                              title: cubit.movieResponseById!.data!.name!,
                              imgurl: (cubit.movieResponseById?.data?.image
                                          ?.url !=
                                      null)
                                  ? '${LinksUrl.baseUrl}${cubit.movieResponseById!.data!.image!.url}'
                                  : 'https://ina.iq/eng/uploads/posts/2021-05/thumbs/upload_1621342522_427621977.png',
                              genre: cubit.movieResponseById!.data!
                                          .movieTypes !=
                                      null
                                  ? cubit.movieResponseById!.data!.movieTypes!
                                      .map((type) => type.englishName ?? '')
                                      .join(', ')
                                  : '',
                              director: "${cubit.movieResponseById!.data!.director!.firstName!} ${cubit.movieResponseById!.data!.director!.lastName!}  " ,
                              duration:
                                  cubit.movieResponseById!.data!.durationInMinutes!, 
                              ar: cubit.movieResponseById!.data!
                                  .movieClassification!.englishName!,
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
                          buildWhen: (previous, current) =>
                              current is VideoLoading ||
                              current is VideoLoaded ||
                              current is VideoError,
                          builder: (context, state) {
                            if (state is VideoLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (state is VideoError) {
                              return Center(
                                child: Text(state.error,
                                    style: const TextStyle(color: Colors.red)),
                              );
                            } else if (state is VideoLoaded) {
                              return Column(
                                children: [
                                  FadeInDown(
                                    child: Padding(
                                      padding:  EdgeInsets.all(size.width * 0.03),
                                      child: YoutubePlayer(
                                        bottomActions: [
                                          CurrentPosition(),
                                          ProgressBar(isExpanded: true),
                                          RemainingDuration(),
                                        ],
                                        controller: state.controller,
                                        showVideoProgressIndicator: true,
                                        onReady: () {
                                          //                                        state.controller.unMute();
                                          // state.controller.play();
                                          print("YouTube Player Ready");
                                        },
                                      ),
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
                                          isScrollControlled: true,
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(16.0),
                                                    child: Text(
                                                      "Movie Cast",
                                                      style: TextStyle(
                                                        color: beige3,
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      itemCount: cubit
                                                          .movieResponseById!
                                                          .data!
                                                          .movieCasts!
                                                          .length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        final actor = cubit
                                                            .movieResponseById!
                                                            .data!
                                                            .movieCasts![index];
                                                        return Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            vertical: 8.0,
                                                            horizontal: 16.0,
                                                          ),
                                                          child: ListTile(
                                                            leading: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                              child: actor.image
                                                                          ?.url !=
                                                                      null
                                                                  ? Image
                                                                      .network(
                                                                      '${LinksUrl.baseUrl}${actor.image!.url}',
                                                                      height:
                                                                          60,
                                                                      width: 60,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      errorBuilder: (context, error, stackTrace) => Icon(
                                                                          Icons
                                                                              .person,
                                                                          size:
                                                                              60,
                                                                          color:
                                                                              Colors.grey),
                                                                    )
                                                                  : Icon(
                                                                      Icons
                                                                          .person,
                                                                      size: 60,
                                                                      color: Colors
                                                                          .grey),
                                                            ),
                                                            title: Text(
                                                              '${actor.firstName} ${actor.lastName}',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16.sp,
                                                              ),
                                                            ),
                                                            subtitle:
                                                                actor.castType !=
                                                                        null
                                                                    ? Text(
                                                                        'as ${actor.castType}',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.grey,
                                                                          fontSize:
                                                                              14.sp,
                                                                        ),
                                                                      )
                                                                    : null,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
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
                                  final movie = context.read<DetailesCubit>().movieResponseById!.data!;
  context.read<BookingCubit>().selectMovie(movie);
                                cubit.pauseVideo();
                                  context.read<ShoppingCartCubit>().clearCart();
                                  context.read<BookingCubit>().selectSnacks([]);
                                NavigationWidget.pushPage(
                                  context,
                                  TimeAndDateScreen(
                                    id: id,
                                     
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
