import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Cubits/SeeAllcubit/seeall_cubit.dart';
import 'package:bpr602_cinema/clientScreens/detailesPage.dart';
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
                child: MySearchBar(
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
                      },
                    ),
                  ],
                  onChanged: (value) {},
                  onSubmitted: (value) {},
                ),
              ),
              BlocBuilder<SeeallCubit, SeeallState>(
                builder: (context, state) {
                  final selectedIndex =
                      (state is SeeallFilterSelected) ? state.selectindex : 0;
                  final cubit = context.read<SeeallCubit>();
                  if (state is Movietypeinitial) {
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
                                label:"....",
                                isSelected: selectedIndex == index,
                                onSelected: () {
                                  context.read<SeeallCubit>().selectFilter(index);
                                },
                              ),
                            );
                          }),
                     );
                  }

                  // if (state is MovietypErrorstate) {
                  //   return Center(child: Text(state.message));
                  // }

                  if (cubit.getMovieTypemodel?.data == null) {
                    return const SizedBox();
                  }
                  if (state is MovietypeAcceptstate &&
                      cubit.getMovieTypemodel?.data != null) {
                    return SizedBox(
                        height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: context
                              .read<SeeallCubit>()
                              .getMovieTypemodel!
                              .data!
                              .length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: CustomFilterChip(
                                label: context
                                    .read<SeeallCubit>()
                                    .getMovieTypemodel!
                                    .data![index]
                                    .englishName!,
                                isSelected: selectedIndex == index,
                                onSelected: () {
                                  context.read<SeeallCubit>().selectFilter(index);
                                },
                              ),
                            );
                          }),
                    );
                  }
                  return const SizedBox.shrink();

                  // return Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     CustomFilterChip(
                  //       label: 'All',
                  //       isSelected: selectedIndex == 0,
                  //       onSelected: () {
                  //         context.read<SeeallCubit>().selectFilter(0);
                  //       },
                  //     ),
                  //     CustomFilterChip(
                  //       label: 'Action',
                  //       isSelected: selectedIndex == 1,
                  //       onSelected: () {
                  //         context.read<SeeallCubit>().selectFilter(1);
                  //       },
                  //     ),
                  //     CustomFilterChip(
                  //       label: 'Drama',
                  //       isSelected: selectedIndex == 2,
                  //       onSelected: () {
                  //         context.read<SeeallCubit>().selectFilter(2);
                  //       },
                  //     ),
                  //     CustomFilterChip(
                  //       label: 'Horror',
                  //       isSelected: selectedIndex == 3,
                  //       onSelected: () {
                  //         context.read<SeeallCubit>().selectFilter(3);
                  //       },
                  //     ),
                  //   ],
                  // );
                },
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 13.0),
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
                          child: SeeallMovieCard(
                            Language: "EN",
                            title: movie.title,
                            imgurl: movie.poster,
                            genre: movie.genre,
                            director: 'the diractor',
                            duration: movie.duration,
                            ar: "+18",
                          ),
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
