
import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Searchcubit/search_cubit.dart';
import 'package:bpr602_cinema/Cubits/mycubit/mycubit_cubit.dart';
import 'package:bpr602_cinema/clientScreens/detailesPage.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/seeallMovieCard.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (_) => MycubitCubit()..getmovietype(),
      child: BlocListener<MycubitCubit, MycubitState>(
        listener: (context, state) {
          if (state is MovietypsearchErrorstate) {
            if (state.message == "Session Is Done") {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            }if (state.message == "No Internet Connection") {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => NoInternetScreen()),
                  (route) => false);
            } else {
              AppConstants.showToast(context, state.message);
            }
          }
            if (state is MoviesearchErrortstate) {
            if (state.message == "Session Is Done") {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            }if (state.message == "No Internet Connection") {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => NoInternetScreen()),
                  (route) => false);
            } else {
              
              print("nothing");
            }
          }
        },
        child: Scaffold(
          backgroundColor: Kbackground,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
                style: TextStyle(
                  color: Ktext,
                ),
                'Search'),
            backgroundColor: Kbackground,
          ),
          body: Column(
            children: [
              // حقل البحث
              Padding(
                padding: EdgeInsets.all(size.height * 0.01),
                child: BlocBuilder<MycubitCubit, MycubitState>(
                  builder: (context, state) {
                    return TextField(
                      focusNode: context.read<MycubitCubit>().searchFocusNode,
                      controller: context.read<MycubitCubit>().searchController,
                      style: TextStyle(color: Colors.white),
                      onChanged: (query) {
                        //for spaces
                         final trimmed = query.trim();
                        if (trimmed.isEmpty) {
                          context.read<MycubitCubit>().clearSearch();
                        
                          
                        } else {
                          context.read<MycubitCubit>().search(trimmed);
                        }
                      },
                      onSubmitted: (query) {
                         final trimmed = query.trim();
                        if (trimmed.isEmpty) {
                          context.read<MycubitCubit>().clearSearch();
                        
                          
                        } else {
                          context.read<MycubitCubit>().search(trimmed);
                        }
                      },
                       
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: state is SearchLoaded || state is SearchError
                            ? IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  context.read<MycubitCubit>().searchController.clear();
                                  context.read<MycubitCubit>().searchFocusNode.unfocus();
                                  context.read<MycubitCubit>().clearSearch();
                                  //context.read<MycubitCubit>().clearFilter();
                                },
                              )
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: border),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: beige),
                        ),
                      ),
                    );
                  },
                ),
              ),

      
BlocBuilder<MycubitCubit, MycubitState>(
  builder: (context, state) {
    final cubit = context.read<MycubitCubit>();
    
    if (cubit.selectedMovieTypeId != null) {
      final movieType = cubit.getMovieTypemodel!.data!
          .firstWhere((type) => type.id == cubit.selectedMovieTypeId);
      
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                Chip(
                  label: Text(
                    movieType.englishName!,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: kbutton,
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    
                    cubit.searchController.clear();
                    cubit.clearFilter();
                  },
                ),
              ],
            ),
          ],
        ),
      );
    }
    return SizedBox.shrink();
  },
),

           
              Expanded(
                child: BlocBuilder<MycubitCubit, MycubitState>(
                  builder: (context, state) {
                    final cubit = context.read<MycubitCubit>();

                    if (state is Movietypsearcheinitial) {
                      return Center(child: CircularProgressIndicator());
                    }

                    
                    if ((state is MycubitInitial || state is FilterCleared) && 
          cubit.selectedMovieTypeId == null) {
                      return GridView.builder(
                        padding: const EdgeInsets.all(8.0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: cubit.getMovieTypemodel?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final movieType = cubit.getMovieTypemodel!.data![index];
                          final filter = movieType.englishName!;
                          final movieTypeId = movieType.id!;

                          return GestureDetector(
                            onTap: () {
                              cubit.selectFilter(filter, movieTypeId);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: ksmallActionColor,
                                borderRadius: BorderRadius.circular(12),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 71, 71, 71),
                                    ksmallActionColor
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  filter,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    // حالات البحث
                    else if (state is Searching) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is SearchLoaded) {
                      return _buildMovieList(cubit);
                    } else if (state is SearchError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              state.message),
                            Lottie.asset(
                              'assets/svg/empty search.json',
                              width: size.width * 0.5,
                              height: size.height * 0.25,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMovieList(MycubitCubit cubit) {
   
    return NotificationListener<ScrollNotification>(
  onNotification: (ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 100 &&
        cubit.hasMore &&
        !cubit.isLoadingMore) {
      cubit.loadMoreMovies();
    }
    return false;
  },
  
      child: ListView.builder(
        controller: _scrollController,
        itemCount: (cubit.movieResponse?.data?.length ?? 0) + (cubit.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < (cubit.movieResponse?.data?.length ?? 0)) {
            final movie = cubit.movieResponse!.data![index];
            return Padding(
               padding: const EdgeInsets.symmetric(vertical: 10.0), 
              child: GestureDetector(
                onTap: (){
                  final isNowShowing = movie.status == "Now Showing";
                  NavigationWidget.pushPage(
                                      context,
                                      DetailesPage(
                                        Isshowing:
                                            isNowShowing, 
                                        id: movie.id!,
                                      ));
                },
                child: SeeallMovieCard(
                  status: movie.status,
                  subtitle: movie.movieSubtitles != null
                      ? movie.movieLanguages!
                          .map((type) => type.englishName ?? '')
                          .join(', ')
                      : '',
                  rating: movie.rate!,
                  imgurl: movie.image != null
                      ? '${LinksUrl.baseUrl}${movie.image!.url}'
                      : 'https://ina.iq/eng/uploads/posts/2021-05/thumbs/upload_1621342522_427621977.png',
                  title: movie.name!,
                  genre: movie.movieTypes != null
                      ? movie.movieTypes!
                          .map((type) => type.englishName ?? '')
                          .join(', ')
                      : '',
                  director: "${movie.director!.firstName!} ${movie.director!.lastName!}",
                  duration: movie.durationInMinutes!,
                  ar: movie.movieClassification!.englishName!,
                  Language: movie.movieLanguages != null
                      ? movie.movieLanguages!
                          .map((type) => type.englishName ?? '')
                          .join(', ')
                      : '',
                ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}