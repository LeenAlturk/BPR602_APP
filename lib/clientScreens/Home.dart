import 'package:bpr602_cinema/Animation/Fadeinfadeout.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/HomeCubit/home_cubit.dart';
import 'package:bpr602_cinema/clientScreens/NotificationPage.dart';
import 'package:bpr602_cinema/clientScreens/detailesPage.dart';
import 'package:bpr602_cinema/clientScreens/seeallshowing.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/models/movietempModel.dart';
import 'package:bpr602_cinema/wedgets/MovieCaed.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/searchBar.dart';
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
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Kbackground,
            appBar: AppBar(
              backgroundColor: Kbackground,
              leading:  Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: kbutton,
                  child: Text( DataStore.instance.getUserEmail![0]
                                    .toUpperCase(), style: TextStyle(color: Colors.black)),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
"Hello ${DataStore.instance.getUserEmail!.split('@')[0][0].toUpperCase()}${DataStore.instance.getUserEmail!.split('@')[0].substring(1)}"
                    
                    ,style: TextStyle(
                        fontSize: 14.sp,
                        color: Ktext,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Lets stream your favorite movie',
                    style: TextStyle(fontSize: 12.sp, color:Colors.white),
                  ),
                ],
              ),
              actions:  [
                Padding(
                  padding: EdgeInsets.all(size.width * 0.01),
                  child: IconButton(onPressed: (){
                    NavigationWidget.pushPage(context, Notificationpage());
                  }, icon: Icon(Icons.notifications , color: Colors.white,))
                )
                //Notificationpage
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // Padding(
                  //   padding:  EdgeInsets.all(size.height * 0.01),
                  //   child: MySearchBar(
                  //     controller: context.read<HomeCubit>().SearchController,
                  //     hintText: 'Search movies...',
                  //     leading: const Icon(
                  //       Icons.search,
                  //       color: Colors.white,
                  //     ),
                  //     trailing: [
                  //       IconButton(
                  //         icon: const Icon(Icons.clear),
                  //         onPressed: () {},
                  //       ),
                  //     ],
                  //     onChanged: (value) {},
                  //     onSubmitted: (value) {},
                  //   ),
                  // ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  CarouselSlider(
                    items: movies.map((movie) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(movie.poster),
                                fit: BoxFit.fill,
                              ),
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
                      onPageChanged: (index, reason) {},
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding:  EdgeInsets.all(size.width * 0.05 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Most papular',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            NavigationWidget.pushPage(
                                context, const SeeAllShowingNow());
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
                  // Center(
                  //   child: MovieCard(
                  //     imageUrl:
                  //         'https://img-cdn.sfanytime.com/COVERM/COVERM_6c4e0994-5874-4a1b-8a81-7dd703bacefe_da.jpg?w=375&ar=0.692&fit=fill&fill=blur&fm=pjpg&s=80fbbea5ea6a26c357a849f07da6281f',
                  //     title: 'HARRY POTTER',
                  //     genre: 'Action & science fiction',
                  //     rating: 4.5,
                  //   ),
                  // )
                  SizedBox(
                    height: size.height * 0.36,
                    width: size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
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
                                    syn: movie.synopsis,
                                    title: movie.title,
                                    imgurl: movie.poster,
                                    duration: movie.duration,
                                    director: 'the director',
                                    genre: movie.genre,
                                    ar: '+18',
                                  ));
                            },
                            child: MovieCard(
                              imageUrl: movie.poster,
                              title: movie.title,
                              genre: movie.genre,
                              rating: movie.rating,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(size.width * 0.05 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'comming soon',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                             NavigationWidget.pushPage(
                                context, const SeeAllShowingNow());
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
                  SizedBox(
                    height: size.height * 0.36,
                    width: size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.001,
                              horizontal: size.height * 0.02),
                          child: GestureDetector(
                            onTap: () {
                              NavigationWidget.pushPage(
                                  context,
                                  DetailesPage(
                                    Isshowing: false,
                                    syn: movie.synopsis,
                                    title: movie.title,
                                    imgurl: movie.poster,
                                    duration: movie.duration,
                                    director: 'the director',
                                    genre: movie.genre,
                                    ar: '+18',
                                  ));
                            },
                            child: MovieCard(
                              imageUrl: movie.poster,
                              title: movie.title,
                              genre: movie.genre,
                              rating: movie.rating,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
