import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Animation/Fadeinfadeout.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/HomeCubit/home_cubit.dart';

import 'package:bpr602_cinema/clientScreens/detailesPage.dart';
import 'package:bpr602_cinema/clientScreens/seeallshowing.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/models/movietempModel.dart';
import 'package:bpr602_cinema/models/response/movies_response_model.dart';
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
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => HomeCubit()..getNowShowingMovies()..getComingSoonMovies(),
      child: Builder(
        builder: (newContext) => BlocListener<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is MovieErrortstate) {
              if (state.message == "Session Is Done") {
                AppConstants.showToast(context, state.message);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false);
              } else if(state.message == "No Internet Connection") {
                 AppConstants.showToast(context, state.message);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => NoInternetScreen()),
                    (route) => false);
              }else{
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
                  child: Text(" ${ DataStore.instance.getUserFirstName?.substring(0, 1).toUpperCase() ?? ' ' }",
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello ${DataStore.instance.getUserFirstName ?? ' '}",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Ktext,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Lets Book your favorite movies',
                    style: TextStyle(fontSize: 12.sp, color: Colors.white),
                  ),
                ],
              ),
              //               actions: [
              //   Padding(
              //       padding: EdgeInsets.all(size.width * 0.01),
              //       child: IconButton(
              //           onPressed: () {
              //             NavigationWidget.pushPage(context, Notificationpage());
              //           },
              //           icon: Icon(
              //             Icons.notifications,
              //             color: Colors.white,
              //           )))
              // ],
                       ),
            body: RefreshIndicator(
              color: kbutton,
              onRefresh: () async {
                await newContext.read<HomeCubit>().refreshAll();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.04),
                    
                    // Now Showing Carousel
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        final cubit = context.read<HomeCubit>();
                        // if (state is Movieloading && cubit.nowShowingMovies == null) {
                        //   return _buildLoadingCarousel(size);
                        // }
                         if ((state is Movieloading && cubit.nowShowingMovies == null) || 
        (state is Movieloading && cubit.nowShowingMovies != null)) {
      return _buildLoadingCarousel(size);
    }
                        if (cubit.nowShowingMovies?.data != null) {
                          return _buildMovieCarousel(
                            size,
                            cubit.nowShowingMovies!.data!,
                            true, // isShowing
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                    
                    // Now Showing List
                    _buildSectionHeader(
                      size,
                      'Now Showing',
                      () {
                        NavigationWidget.pushPage(
                          context,
                          const SeeAllShowingNow(statustype: "Now Showing"),
                        );
                      },
                    ),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        final cubit = context.read<HomeCubit>();
                        if ((state is Movieloading && cubit.nowShowingMovies == null) || 
        (state is Movieloading && cubit.nowShowingMovies != null)) {
                          return _buildLoadingList(size);
                        }
                        if (cubit.nowShowingMovies?.data != null) {
                          return _buildMovieList(
                            size,
                            cubit.nowShowingMovies!.data!,
                            true, // isShowing
                          );
                        }
                        return SizedBox();
                      },
                    ),
                    
                    // Coming Soon List
                    _buildSectionHeader(
                      size,
                      'Coming Soon',
                      () {
                        NavigationWidget.pushPage(
                          context,
                          const SeeAllShowingNow(statustype: "Coming Soon"),
                        );
                      },
                    ),
                    BlocBuilder<HomeCubit, HomeState>(
                      //comingSoonMovies
                      builder: (context, state) {
                        final cubit = context.read<HomeCubit>();
                         if ((state is Movieloading && cubit.comingSoonMovies == null) || 
        (state is Movieloading && cubit.comingSoonMovies != null)) {
                          return _buildLoadingList(size);
                        }
                        if (cubit.comingSoonMovies?.data != null) {
                          return _buildMovieList(
                            size,
                            cubit.comingSoonMovies!.data!,
                            false, // isShowing
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

 
  Widget _buildLoadingCarousel(Size size) {
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
                colors: [Color(0xFF303030), ksmallActionColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Center(
              child: CircularProgressIndicator(color: kbutton),
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

  Widget _buildMovieCarousel(Size size, List<MovieDatum> movies, bool isShowing) {
    return CarouselSlider(
      items: movies.map((movie) {
        final imageUrl = movie.image != null
            ? '${LinksUrl.baseUrl}${movie.image!.url}'
            : null;
        return GestureDetector(
          onTap: () {
            NavigationWidget.pushPage(
              context,
              DetailesPage(
                Isshowing: isShowing,
                id: movie.id!,
              ),
            );
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
              color: imageUrl == null ? Colors.grey : null,
            ),
            child: imageUrl == null
                ? Center(
                    child: Text(
                      movie.name ?? 'No image',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : null,
          ),
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

  Widget _buildSectionHeader(Size size, String title, VoidCallback onSeeAll) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: onSeeAll,
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
    );
  }

  Widget _buildLoadingList(Size size) {
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
              horizontal: size.height * 0.02,
            ),
            child: Container(
              width: size.width * 0.42,
              height: size.height * 0.4,
              decoration: BoxDecoration(
                color: ksmallActionColor,
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Color(0xFF303030), ksmallActionColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: CircularProgressIndicator(color: kbutton),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMovieList(Size size, List<MovieDatum> movies, bool isShowing) {
    return SizedBox(
      height: size.height * 0.36,
      width: size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final moviedata = movies[index];
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.001,
              horizontal: size.height * 0.02,
            ),
            child: GestureDetector(
              onTap: () {
                NavigationWidget.pushPage(
                  context,
                  DetailesPage(
                    Isshowing: isShowing,
                    id: moviedata.id!,
                  ),
                );
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
}