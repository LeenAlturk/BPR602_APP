import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Cubits/SeeAllcubit/seeall_cubit.dart';
import 'package:bpr602_cinema/clientScreens/detailesPage.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/models/movietempModel.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/filter.dart';
import 'package:bpr602_cinema/wedgets/searchBar.dart';
import 'package:bpr602_cinema/wedgets/seeallMovieCard.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllShowingNow extends StatelessWidget {
  const SeeAllShowingNow({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => SeeallCubit()..getmovietype(),
      child: BlocListener<SeeallCubit, SeeallState>(
        listener: (context, state) {
          if (state is MovietypErrorstate) {
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
            title: const Text(
              'Showing Now',
              style: TextStyle(color: Ktext),
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
              Padding(
                padding: EdgeInsets.all(size.height * 0.01),
                child: Builder(
                  builder: (searchContext) {
                    return MySearchBar(
                      controller: searchController,
                      hintText: 'Search movies...',
                      leading: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      trailing: [
                        IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            searchController.clear();
                            BlocProvider.of<SeeallCubit>(searchContext)
                                .searchMovies('');
                          },
                        ),
                      ],
                      onChanged: (value) {
                        BlocProvider.of<SeeallCubit>(searchContext)
                            .searchMovies(value);
                      },
                      onSubmitted: (value) {
                        BlocProvider.of<SeeallCubit>(searchContext)
                            .searchMovies(value);
                      },
                    );
                  },
                ),
              ),
              BlocBuilder<SeeallCubit, SeeallState>(
                builder: (context, state) {
                  final cubit = context.read<SeeallCubit>();
                  // استخدم الحالة الحالية لتحديد الفلتر المحدد
                  final selectedIndex = cubit.selectedFilter;

                  if (cubit.getMovieTypemodel == null) {
                    return SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: CustomFilterChip(
                                label: "....",
                                isSelected: false,
                                onSelected: () {},
                              ),
                            );
                          }),
                    );
                  }

                  return SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.getMovieTypemodel!.data!.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: CustomFilterChip(
                              label: 'All',
                              isSelected: selectedIndex == 0,
                              onSelected: () {
                                cubit.selectFilter(0);
                              },
                            ),
                          );
                        }

                        final movieType =
                            cubit.getMovieTypemodel!.data![index - 1];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomFilterChip(
                            label: movieType.englishName ?? 'Unknown',
                            isSelected: selectedIndex == index,
                            onSelected: () {
                              cubit.selectFilter(index);
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              BlocBuilder<SeeallCubit, SeeallState>(
                builder: (context, state) {
                  final cubit = context.read<SeeallCubit>();
                  return Expanded(
                    // child: ListView.builder(
                    //   shrinkWrap: true,
                    //   scrollDirection: Axis.vertical,
                    //   itemCount: movies.length,
                    //   itemBuilder: (context, index) {
                    //     final movie = movies[index];
                    //     return Padding(
                    //         padding: const EdgeInsets.symmetric(
                    //             vertical: 10.0, horizontal: 13.0),
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             // NavigationWidget.pushPage(
                    //             //     context,
                    //             //     DetailesPage(
                    //             //       Isshowing: true,
                    //             //       syn: movie.synopsis,
                    //             //       title: movie.title,
                    //             //       imgurl: movie.poster,
                    //             //       duration: movie.duration,
                    //             //       director: 'the director',
                    //             //       genre: movie.genre,
                    //             //       ar: '+18',
                    //             //     ));
                    //           },
                    //           child: SeeallMovieCard(
                    //             Language: "EN",
                    //             title: movie.title,
                    //             imgurl: movie.poster,
                    //             genre: movie.genre,
                    //             director: 'the diractor',
                    //             duration: movie.duration,
                    //             ar: "+18",
                    //           ),
                    //         ));
                    //   },
                    // ),
                    child: ListView.builder(
                      itemCount: cubit.movies.length + 1,
                      itemBuilder: (context, index) {
                        if (index < cubit.movies.length) {
                          final movie = cubit.movies[index];
                          return SeeallMovieCard(
                            //  imageUrl: moviedata.image != null
                            //                 ? '${LinksUrl.baseUrl}${moviedata.image!.url}'
                            //                 : null,
                            imgurl: movie.image != null
                                ? '${LinksUrl.baseUrl}${movie.image!.url}'
                                : 'https://ina.iq/eng/uploads/posts/2021-05/thumbs/upload_1621342522_427621977.png',
                            title: movie.name!,

                            genre: movie.movieTypes != null
                                ? movie.movieTypes!
                                    .map((type) => type.englishName ?? '')
                                    .join(', ')
                                : '',
                            director: movie.director!.firstName!,
                            duration:
                                90, // Consider getting this from API as well
                            ar: movie.movieClassification!.englishName!,
                            Language: movie.movieLanguages != null
                                ? movie.movieLanguages!
                                    .map((type) => type.englishName ?? '')
                                    .join(', ')
                                : '',
                          );
                        } else {
                          if (cubit.hasMore) {
                            cubit.getmovie();
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
