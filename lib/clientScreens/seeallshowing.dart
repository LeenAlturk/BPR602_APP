

import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Cubits/SeeAllcubit/seeall_cubit.dart';
import 'package:bpr602_cinema/clientScreens/detailesPage.dart';
import 'package:bpr602_cinema/models/movietempModel.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/filter.dart';
import 'package:bpr602_cinema/wedgets/searchBar.dart';
import 'package:bpr602_cinema/wedgets/seeallMovieCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllShowingNow extends StatelessWidget {
  const SeeAllShowingNow({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => SeeallCubit(),
      child: BlocListener<SeeallCubit, SeeallState>(
        listener: (context, state) {},
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
                padding:  EdgeInsets.all(size.height * 0.01 ),
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
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomFilterChip(
                        label: 'All',
                        isSelected: selectedIndex == 0,
                        onSelected: () {
                          context.read<SeeallCubit>().selectFilter(0);
                        },
                      ),
                      CustomFilterChip(
                        label: 'Action',
                        isSelected: selectedIndex == 1,
                        onSelected: () {
                          context.read<SeeallCubit>().selectFilter(1);
                        },
                      ),
                      CustomFilterChip(
                        label: 'Drama',
                        isSelected: selectedIndex == 2,
                        onSelected: () {
                          context.read<SeeallCubit>().selectFilter(2);
                        },
                      ),
                      CustomFilterChip(
                        label: 'Horror',
                        isSelected: selectedIndex == 3,
                        onSelected: () {
                          context.read<SeeallCubit>().selectFilter(3);
                        },
                      ),
                    ],
                  );
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
                          onTap: (){
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
