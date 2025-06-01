import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/Animation/Fadeinfadeout.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/HomeCubit/home_cubit.dart';
import 'package:bpr602_cinema/clientScreens/NotificationPage.dart';
import 'package:bpr602_cinema/clientScreens/detailesPage.dart';
import 'package:bpr602_cinema/clientScreens/seeallshowing.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/models/movietempModel.dart';
import 'package:bpr602_cinema/wedgets/MovieCaed.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/searchBar.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => HomeCubit()..getmovie(),
      child: Builder(
          builder: (newContext) => BlocListener<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is MovieErrortstate) {
              if (state.message == "Session Is Done") {
                AppConstants.showToast(context, state.message);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false);
              } else {
                AppConstants.showToast(context, state.message);
              }
            }
          },
          child: Scaffold(
            backgroundColor: Kbackground,
            appBar: AppBar(
              backgroundColor: Kbackground,
              leading: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: kbutton,
                  child: Text(DataStore.instance.getUserEmail![0].toUpperCase(),
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello ${DataStore.instance.getUserEmail!.split('@')[0][0].toUpperCase()}${DataStore.instance.getUserEmail!.split('@')[0].substring(1)}",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Ktext,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Lets stream your favorite movies',
                    style: TextStyle(fontSize: 12.sp, color: Colors.white),
                  ),
                ],
              ),
              actions: [
                Padding(
                    padding: EdgeInsets.all(size.width * 0.01),
                    child: IconButton(
                        onPressed: () {
                          NavigationWidget.pushPage(context, Notificationpage());
                        },
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        )))
              ],
            ),
            body: RefreshIndicator(
              color: kbutton,
              onRefresh: () async {
               await newContext.read<HomeCubit>().getmovie();
              },
              child: SingleChildScrollView(
                 physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        final cubit = context.read<HomeCubit>();
                        // if (state is Movieloading) {
                        //   return Center(child: CircularProgressIndicator());
              
                        // }
                        if (state is Movieloading) {
                          return SizedBox(
                            height: size.height * 0.36,
                            child: CarouselSlider.builder(
                              itemCount: 3,
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                  width: size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: ksmallActionColor,
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF303030),
                                        ksmallActionColor
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: const Center(
                                    child:
                                        CircularProgressIndicator(color: kbutton),
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                height: size.height * 0.2,
                                autoPlay: false,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                              ),
                            ),
                          );
                        }
              
                        if (state is MovieAcceptstate &&
                            cubit.movieResponse?.data != null) {
                          // Filter only "Now Showing" movies for carousel
                          final nowShowingMovies = cubit.movieResponse!.data!
                              .where((movie) => movie.status == "Now Showing")
                              .toList();
              
                          return CarouselSlider(
                            items: nowShowingMovies.map((movie) {
                              final imageUrl = movie.image != null
                                  ? '${LinksUrl.baseUrl}${movie.image!.url}'
                                  : null;
                              return Builder(
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: () {
                                      NavigationWidget.pushPage(
                                          context,
                                          DetailesPage(
                                            Isshowing:
                                                true, 
                                            id: movie.id!,
                                          ));
                                    },
                                    child: Container(
                                      width: size.width,
                                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: imageUrl != null
                                            ? DecorationImage(
                                                image: NetworkImage(imageUrl),
                                                fit: BoxFit.fill,
                                              )
                                            : null,
                                        color:
                                            imageUrl == null ? Colors.grey : null,
                                      ),
                                      child: imageUrl == null
                                          ? Center(
                                              child: Text(
                                                movie.name ?? 'No image',
                                                style:
                                                    TextStyle(color: Colors.white),
                                              ),
                                            )
                                          : null,
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: size.height * 0.2,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: true,
                            ),
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Showing Now',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              NavigationWidget.pushPage(
                                  context,
                                  const SeeAllShowingNow(
                                    statustype: "Now Showing",
                                  ));
                            },
                            child: Text(
                              'see all',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Ktext,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        final cubit = context.read<HomeCubit>();
              
                        if (state is Movieloading) {
                          // return Center(
                          //   child: CircularProgressIndicator(),
                          // );
                          return SizedBox(
                            height: size.height * 0.36,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.height * 0.001,
                                        horizontal: size.height * 0.02),
                                    child: Container(
                                      width: size.width * 0.42,
                                      height: size.height * 0.4,
                                      decoration: BoxDecoration(
                                        color: ksmallActionColor,
                                        borderRadius: BorderRadius.circular(12),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(
                                                0xFF303030), // Subtle gradient for a lighting effect
                                            ksmallActionColor
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Center(
                                          child: CircularProgressIndicator(
                                        color: kbutton,
                                      )),
                                    ),
                                  );
                                }),
                          );
                        }
                        if (state is MovieAcceptstate &&
                            cubit.movieResponse?.data != null) {
                          // Filter only "Now Showing" movies
                          final nowShowingMovies = cubit.movieResponse!.data!
                              .where((movie) => movie.status == "Now Showing")
                              .toList();
              
                          return SizedBox(
                            height: size.height * 0.36,
                            width: size.width,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: nowShowingMovies.length,
                              itemBuilder: (context, index) {
                                final moviedata = nowShowingMovies[index];
              
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.001,
                                      horizontal: size.height * 0.02),
                                  child: GestureDetector(
                                    onTap: () {
                                      NavigationWidget.pushPage(
                                          context,
                                          DetailesPage(
                                            Isshowing: true,
                                            id: moviedata.id!,
                                          ));
                                    },
                                    child: MovieCard(
                                      imageUrl: moviedata.image != null
                                          ? '${LinksUrl.baseUrl}${moviedata.image!.url}'
                                          : null,
                                      title: moviedata.name,
                                      genre: moviedata.movieTypes != null
                                          ? moviedata.movieTypes!
                                              .map((type) => type.englishName ?? '')
                                              .join(', ')
                                          : '',
                                      rating: moviedata.rate,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                        return SizedBox();
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Coming Soon',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              NavigationWidget.pushPage(
                                  context,
                                  const SeeAllShowingNow(
                                    statustype: "Coming Soon",
                                  ));
                            },
                            child: Text(
                              'see all',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Ktext,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        final cubit = context.read<HomeCubit>();
              
                        if (state is Movieloading) {
                          // return Center(
                          //   child: CircularProgressIndicator(),
                          // );
                          return SizedBox(
                            height: size.height * 0.36,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.height * 0.001,
                                        horizontal: size.height * 0.02),
                                    child: Container(
                                      width: size.width * 0.42,
                                      height: size.height * 0.4,
                                      decoration: BoxDecoration(
                                        color: ksmallActionColor,
                                        borderRadius: BorderRadius.circular(12),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(
                                                0xFF303030), // Subtle gradient for a lighting effect
                                            ksmallActionColor
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Center(
                                          child: CircularProgressIndicator(
                                        color: kbutton,
                                      )),
                                    ),
                                  );
                                }),
                          );
                        }
                        if (state is MovieAcceptstate &&
                            cubit.movieResponse?.data != null) {
                          // Filter only "Coming Soon" movies
                          final comingSoonMovies = cubit.movieResponse!.data!
                              .where((movie) => movie.status == "Coming Soon")
                              .toList();
              
                          return SizedBox(
                            height: size.height * 0.36,
                            width: size.width,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: comingSoonMovies.length,
                              itemBuilder: (context, index) {
                                final moviedata = comingSoonMovies[index];
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.001,
                                      horizontal: size.height * 0.02),
                                  child: GestureDetector(
                                    onTap: () {
                                      NavigationWidget.pushPage(
                                          context,
                                          DetailesPage(
                                            Isshowing:
                                                false, // Coming soon movies are not showing yet
                                            id: moviedata.id!,
                                          ));
                                    },
                                    child: MovieCard(
                                      imageUrl: moviedata.image != null
                                          ? '${LinksUrl.baseUrl}${moviedata.image!.url}'
                                          : null,
                                      title: moviedata.name,
                                      genre: moviedata.movieTypes != null
                                          ? moviedata.movieTypes!
                                              .map((type) => type.englishName ?? '')
                                              .join(', ')
                                          : '',
                                      rating: moviedata.rate,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                        return SizedBox();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
