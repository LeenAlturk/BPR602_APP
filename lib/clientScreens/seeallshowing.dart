import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
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
  final String statustype;
  const SeeAllShowingNow({super.key, required this.statustype});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => SeeallCubit(statustype: statustype)..getmovietype(),
      child: BlocListener<SeeallCubit, SeeallState>(
        listener: (context, state) {
          if (state is MovietypErrorstate) {
            if (state.message == "Session Is Done") {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            }else if(state.message == "No Internet Connection"){
                   AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => NoInternetScreen()),
                  (route) => false);
            } else {
              AppConstants.showToast(context, state.message);
            }
          }

          if (state is MovieallErrortstate) {
            if (state.message == "Session Is Done") {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            }else if(state.message == "No Internet Connection"){
                   AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => NoInternetScreen()),
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
            title: Text(
              statustype,
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
                    searchController.text =
                        BlocProvider.of<SeeallCubit>(searchContext).searchQuery;
                    return MySearchBar(
                      controller: searchController,
                      hintText: 'Search movies...',
                      leading: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      // trailing: [
                      //   IconButton(
                      //     icon: const Icon(Icons.clear),
                      //     onPressed: () {
                      //       BlocProvider.of<SeeallCubit>(searchContext)
                      //           .searchMovies('');

                      //       searchController.clear();
                      //     },
                      //   ),
                      // ],
                      trailing: [
  BlocBuilder<SeeallCubit, SeeallState>(
    builder: (context, state) {
      final cubit = context.read<SeeallCubit>();
      return cubit.searchQuery.isNotEmpty
          ? IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                cubit.searchMovies('');
                searchController.clear();
              },
            )
          : const SizedBox.shrink();
    },
  ),
],
                      onChanged: (value) {
                        BlocProvider.of<SeeallCubit>(searchContext)
                            .searchMovies(value.trim());
                      },
                      onSubmitted: (value) {
                        BlocProvider.of<SeeallCubit>(searchContext)
                            .searchMovies(value.trim());
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

                  // تصفية الأفلام حسب statustype
                  final filteredMovies = cubit.movies
                      .where((movie) => movie.status == statustype)
                      .toList();

                  // التحقق من أن القائمة المصفاة فارغة، وليس هناك جلب للبيانات حالياً
                  // if (filteredMovies.isEmpty && !cubit.isFetching) {
                  //   return Center(
                  //     child: Text(
                  //       'No Movies available',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //   );
                  // }
                       

                    if (state is Movieallloading && cubit.movies.isEmpty) {
      // عرض مؤشر تحميل عند الدخول لأول مرة أو أثناء تحميل الصفحة الأولى
      return const Expanded(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (filteredMovies.isEmpty && cubit.loadedOnce && !cubit.isFetching) {
      return Expanded(
        child: Center(
          child: Text(
            cubit.searchQuery.isNotEmpty
                ? 'No result found'
                : 'No Movie Available',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      );
    }

                  return Expanded(
                    child: ListView.builder(
                      itemCount:
                          filteredMovies.length + (cubit.hasMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < filteredMovies.length) {
                          final movie = filteredMovies[index];
                          return GestureDetector(
                            onTap: () {
                              NavigationWidget.pushPage(
                                context,
                                DetailesPage(
                                  Isshowing: movie.status!.contains(
                                      "Showing"), // true إذا كانت تحتوي على "Showing"
                                  id: movie.id!,
                                ),
                              );
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
                              director: movie.director!.firstName!,
                              duration: movie.durationInMinutes!,
                              ar: movie.movieClassification!.englishName!,
                              Language: movie.movieLanguages != null
                                  ? movie.movieLanguages!
                                      .map((type) => type.englishName ?? '')
                                      .join(', ')
                                  : '',
                            ),
                          );
                        } else if (cubit.hasMore) {
                          cubit.getmovie();
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        } else {
                          return const SizedBox.shrink();
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
