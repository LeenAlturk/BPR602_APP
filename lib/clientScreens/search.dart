// import 'package:bpr602_cinema/AllUserScreens/Login.dart';
// import 'package:bpr602_cinema/Constants/colors.dart';
// import 'package:bpr602_cinema/Constants/sizer.dart';
// import 'package:bpr602_cinema/Cubits/Searchcubit/search_cubit.dart';
// import 'package:bpr602_cinema/Cubits/mycubit/mycubit_cubit.dart';
// import 'package:bpr602_cinema/wedgets/seeallMovieCard.dart';
// import 'package:bpr602_cinema/wedgets/toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lottie/lottie.dart';

// class SearchScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return BlocProvider(
//       create: (_) => MycubitCubit()..getmovietype(),
//       child: BlocListener<MycubitCubit, MycubitState>(
//         listener: (context, state) {
//           // TODO: implement listener
//           if (state is MovietypsearchErrorstate) {
//             if (state.message == "Session Is Done") {
//               AppConstants.showToast(context, state.message);
//               Navigator.of(context).pushAndRemoveUntil(
//                   MaterialPageRoute(builder: (context) => LoginScreen()),
//                   (route) => false);
//             } else {
//               AppConstants.showToast(context, state.message);
//             }
//           }
//         },
//         child: Scaffold(
//           backgroundColor: Kbackground,
//           appBar: AppBar(
//             automaticallyImplyLeading: false,
//             centerTitle: true,
//             title: const Text(
//                 style: TextStyle(
//                   color: Ktext,
//                 ),
//                 'Search'),
//             backgroundColor: Kbackground,
//           ),
//           body: Column(
//             children: [
//               BlocBuilder<MycubitCubit, MycubitState>(
//                 builder: (context, state) {
//                   return Padding(
//                       padding: EdgeInsets.all(size.height * 0.01),
//                       child: TextField(
//                         style: TextStyle(color: Colors.white),
//                         onChanged: (query) {
//                           if (query.isEmpty) {
//                             context.read<MycubitCubit>().clearSearch();
//                           } else {
//                             context.read<MycubitCubit>().search(query);
//                           }
//                         },
//                         decoration: InputDecoration(
//                           hintText: 'Search',
//                           prefixIcon: const Icon(Icons.search),
//                           suffixIcon: state is! MycubitInitial
//                               ? IconButton(
//                                   icon: const Icon(Icons.close),
//                                   onPressed: () {
//                                     context.read<MycubitCubit>().clearSearch();
//                                   },
//                                 )
//                               : null,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20.0),
//                             borderSide: const BorderSide(
//                                 color: Colors.white), // Default border color
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20.0),
//                             borderSide: const BorderSide(
//                                 color: border), // Non-focused border color
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20.0),
//                             borderSide: const BorderSide(
//                                 color: beige), // Focused border color
//                           ),
//                         ),
//                       ));
//                 },
//               ),

//               // Filter Selection or Search Results
//               Expanded(
//                 child: BlocBuilder<MycubitCubit, MycubitState>(
//                   builder: (context, state) {
//                     if (state is Movietypsearcheinitial) {
//                       return CircularProgressIndicator();
//                     }

//                     if (state is MycubitInitial) {
//                       return GridView.builder(
//                           padding: const EdgeInsets.all(8.0),
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             childAspectRatio: 3,
//                             crossAxisSpacing: 8.0,
//                             mainAxisSpacing: 8.0,
//                           ),
//                           itemCount: context
//                               .read<MycubitCubit>()
//                               .getMovieTypemodel!
//                               .data!
//                               .length,
//                           itemBuilder: (context, index) {
//                             final filter = context
//                                 .read<MycubitCubit>()
//                                 .getMovieTypemodel!
//                                 .data![index]
//                                 .englishName!;

//                             return GestureDetector(
//                               onTap: () {
//                                 context
//                                     .read<MycubitCubit>()
//                                     .selectFilter(filter);
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: ksmallActionColor,
//                                   borderRadius: BorderRadius.circular(12),
//                                   gradient: const LinearGradient(
//                                     colors: [
//                                       Color.fromARGB(255, 71, 71, 71),
//                                       ksmallActionColor
//                                     ],
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.bottomRight,
//                                   ),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     filter,
//                                     style: const TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           });
//                     } else if (state is FilterSelected) {
//                       return Center(
//                         child: Text(
//                             style: TextStyle(color: Colors.white),
//                             'Filter Selected: ${state.filter}'),
//                       );
//                     } else if (state is Searching) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (state is SearchLoaded) {
//                       return ListView.builder(
//                         itemCount: state.results.length,
//                         itemBuilder: (context, index) {
//                           return
//                           // ListTile(
//                           //     title: Text(
//                           //         style: TextStyle(color: Colors.white),
//                           //         state.results[index]));
//                           SeeallMovieCard(
//                             Language: "EN",
//                             title: state.results[index],
//                             imgurl: "https://m.media-amazon.com/images/M/MV5BMTQxNzY1MjI5NF5BMl5BanBnXkFtZTcwNTI0MDY1OQ@@._V1_QL75_UX380_CR0,20,380,562_.jpg",
//                             genre: "+18",
//                             director: 'the diractor',
//                             duration: 96,
//                             ar: "+18",
//                           );
//                         },
//                       );
//                     } else if (state is SearchError) {
//                       return Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                                 style: TextStyle(
//                                     fontSize: 18.sp,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                                 state.message),
//                             Lottie.asset(
//                               'assets/svg/empty search.json',
//                               width: size.width * 0.5,
//                               height: size.height * 0.25,
//                             ),
//                           ],
//                         ),
//                       );
//                     } else {
//                       return SizedBox.shrink();
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:bpr602_cinema/AllUserScreens/Login.dart';
// import 'package:bpr602_cinema/Constants/colors.dart';
// import 'package:bpr602_cinema/Constants/sizer.dart';
// import 'package:bpr602_cinema/Cubits/Searchcubit/search_cubit.dart';
// import 'package:bpr602_cinema/Cubits/mycubit/mycubit_cubit.dart';
// import 'package:bpr602_cinema/data/link.dart';
// import 'package:bpr602_cinema/wedgets/seeallMovieCard.dart';
// import 'package:bpr602_cinema/wedgets/toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lottie/lottie.dart';

// class SearchScreen extends StatelessWidget {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return BlocProvider(
//       create: (_) => MycubitCubit()..getmovietype(),
//       child: BlocListener<MycubitCubit, MycubitState>(
//         listener: (context, state) {
//           if (state is MovietypsearchErrorstate) {
//             if (state.message == "Session Is Done") {
//               AppConstants.showToast(context, state.message);
//               Navigator.of(context).pushAndRemoveUntil(
//                   MaterialPageRoute(builder: (context) => LoginScreen()),
//                   (route) => false);
//             } else {
//               AppConstants.showToast(context, state.message);
//             }
//           }
//         },
//         child: Scaffold(
//           backgroundColor: Kbackground,
//           appBar: AppBar(
//             automaticallyImplyLeading: false,
//             centerTitle: true,
//             title: const Text(
//                 style: TextStyle(
//                   color: Ktext,
//                 ),
//                 'Search'),
//             backgroundColor: Kbackground,
//           ),
//           body: Column(
//             children: [
//               BlocBuilder<MycubitCubit, MycubitState>(
//                 builder: (context, state) {
//                   return Padding(
//                       padding: EdgeInsets.all(size.height * 0.01),
//                       child: TextField(
//                         style: TextStyle(color: Colors.white),
//                         onChanged: (query) {
//                           if (query.isEmpty) {
//                             context.read<MycubitCubit>().clearSearch();
//                           } else {
//                             context.read<MycubitCubit>().search(query);
//                           }
//                         },
//                         decoration: InputDecoration(
//                           hintText: 'Search',
//                           prefixIcon: const Icon(Icons.search),
//                           suffixIcon: state is! MycubitInitial
//                               ? IconButton(
//                                   icon: const Icon(Icons.close),
//                                   onPressed: () {
//                                     context.read<MycubitCubit>().clearSearch();
//                                   },
//                                 )
//                               : null,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20.0),
//                             borderSide: const BorderSide(
//                                 color: Colors.white),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20.0),
//                             borderSide: const BorderSide(
//                                 color: border),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20.0),
//                             borderSide: const BorderSide(
//                                 color: beige),
//                           ),
//                         ),
//                       ));
//                 },
//               ),

//               Expanded(
//                 child: BlocBuilder<MycubitCubit, MycubitState>(
//                   builder: (context, state) {
//                     final cubit = context.read<MycubitCubit>();

//                     if (state is Movietypsearcheinitial) {
//                       return Center(child: CircularProgressIndicator());
//                     }

//                     if (state is MycubitInitial) {
//                       return GridView.builder(
//                           padding: const EdgeInsets.all(8.0),
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             childAspectRatio: 3,
//                             crossAxisSpacing: 8.0,
//                             mainAxisSpacing: 8.0,
//                           ),
//                           itemCount: cubit.getMovieTypemodel?.data?.length ?? 0,
//                           itemBuilder: (context, index) {
//                             final movieType = cubit.getMovieTypemodel!.data![index];
//                             final filter = movieType.englishName!;
//                             final movieTypeId = movieType.id!;

//                             return GestureDetector(
//                               onTap: () {
//                                 cubit.selectFilter(filter, movieTypeId);
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: ksmallActionColor,
//                                   borderRadius: BorderRadius.circular(12),
//                                   gradient: const LinearGradient(
//                                     colors: [
//                                       Color.fromARGB(255, 71, 71, 71),
//                                       ksmallActionColor
//                                     ],
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.bottomRight,
//                                   ),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     filter,
//                                     style: const TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           });
//                     } else if (state is FilterSelected) {
//                       return Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               style: TextStyle(color: Colors.white),
//                               'Filter: ${state.filterName}',
//                             ),
//                           ),
//                           Expanded(child: _buildMovieList(cubit)),
//                         ],
//                       );
//                     } else if (state is Searching) {
//                       return Center(child: CircularProgressIndicator());
//                     } else if (state is SearchLoaded) {
//                       return _buildMovieList(cubit);
//                     } else if (state is SearchError) {
//                       return Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                                 style: TextStyle(
//                                     fontSize: 18.sp,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                                 state.message),
//                             Lottie.asset(
//                               'assets/svg/empty search.json',
//                               width: size.width * 0.5,
//                               height: size.height * 0.25,
//                             ),
//                           ],
//                         ),
//                       );
//                     } else {
//                       return SizedBox.shrink();
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMovieList(MycubitCubit cubit) {
//     return NotificationListener<ScrollNotification>(
//       onNotification: (ScrollNotification scrollInfo) {
//         if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
//             cubit.hasMore) {
//           cubit.loadMoreMovies();
//         }
//         return false;
//       },
//       child: ListView.builder(
//         controller: _scrollController,
//         itemCount: (cubit.movieResponse?.data?.length ?? 0) + (cubit.hasMore ? 1 : 0),
//         itemBuilder: (context, index) {
//           if (index < (cubit.movieResponse?.data?.length ?? 0)) {
//             final movie = cubit.movieResponse!.data![index];
//             return
//            SeeallMovieCard(
//                             imgurl: movie.image != null
//                                 ? '${LinksUrl.baseUrl}${movie.image!.url}'
//                                 : 'https://ina.iq/eng/uploads/posts/2021-05/thumbs/upload_1621342522_427621977.png',
//                             title: movie.name!,
//                             genre: movie.movieTypes != null
//                                 ? movie.movieTypes!
//                                     .map((type) => type.englishName ?? '')
//                                     .join(', ')
//                                 : '',
//                             director: movie.director!.firstName!,
//                             duration: 90,
//                             ar: movie.movieClassification!.englishName!,
//                             Language: movie.movieLanguages != null
//                                 ? movie.movieLanguages!
//                                     .map((type) => type.englishName ?? '')
//                                     .join(', ')
//                                 : '',
//                           );
//           } else {
//             return Padding(
//               padding: EdgeInsets.symmetric(vertical: 20),
//               child: Center(child: CircularProgressIndicator()),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
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
              //AppConstants.showToast(context, state.message);
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
                        if (query.isEmpty) {
                          context.read<MycubitCubit>().clearSearch();
                        } else {
                          context.read<MycubitCubit>().search(query);
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
                                  context.read<MycubitCubit>().clearFilter();
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

        //       // عرض الفلتر المختار (إذا وجد)
        //       BlocBuilder<MycubitCubit, MycubitState>(
        //         builder: (context, state) {
        //           if (state is FilterSelected || 
        // (state is Searching && context.read<MycubitCubit>().selectedMovieTypeId != null) ||
        // (state is SearchLoaded && context.read<MycubitCubit>().selectedMovieTypeId != null )|| context.read<MycubitCubit>().selectedMovieTypeId != null) {
        //             return Padding(
        //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //               child: Column(
        //                 children: [
        //                   Row(
        //                     children: [
        //                       Chip(
        //                         label: Text(
        //                           //state.filterName,
        //                            state is FilterSelected ? state.filterName : 
        //             context.read<MycubitCubit>().getMovieTypemodel!.data!
        //               .firstWhere((type) => type.id == context.read<MycubitCubit>().selectedMovieTypeId).englishName!,

        //                           style: TextStyle(color: Colors.white),
        //                         ),
        //                         backgroundColor: kbutton,
        //                       ),
        //                       IconButton(
        //                         icon: Icon(Icons.close, color: Colors.white),
        //                         onPressed: () {
        //                           context.read<MycubitCubit>().searchController.clear();
        //                           context.read<MycubitCubit>().clearFilter();
        //                         },
        //                       ),
        //                     ],
        //                   ),
        //                   // SizedBox(height: size.height *0.3,),
        //                   // Row(
        //                   //   mainAxisAlignment: MainAxisAlignment.center,
        //                   //   children: [
        //                   //     Text("Start Typing To Search  ", style: TextStyle(
        //                   //       color: Ktext , fontSize: 15.sp , fontWeight: FontWeight.bold
        //                   //     ),),
        //                   //     SizedBox(height: size.height *0.01,),
        //                   //      Icon(Icons.search , color:  Ktext, size: 15.sp,)
        //                   //   ],
        //                   // )
        //                 ],
        //               ),
        //             );
        //           }
        //           return SizedBox.shrink();
        //         },
        //       ),
        //new
        // عرض الفلتر المختار (إذا وجد)
BlocBuilder<MycubitCubit, MycubitState>(
  builder: (context, state) {
    final cubit = context.read<MycubitCubit>();
    
    // عرض الفلتر إذا كان هناك فلتر محدد، بغض النظر عن حالة البحث
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

              //  الجزء الرئيسي من الواجهة
              //قديم
              Expanded(
                child: BlocBuilder<MycubitCubit, MycubitState>(
                  builder: (context, state) {
                    final cubit = context.read<MycubitCubit>();

                    if (state is Movietypsearcheinitial) {
                      return Center(child: CircularProgressIndicator());
                    }

                    // عرض أزرار الفلتر في الحالة الأولية
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
    // return NotificationListener<ScrollNotification>(
    //   onNotification: (ScrollNotification scrollInfo) {
    //     if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
    //         cubit.hasMore) {
    //       cubit.loadMoreMovies();
    //     }
    //     return false;
    //   },
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
                  director: movie.director!.firstName!,
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