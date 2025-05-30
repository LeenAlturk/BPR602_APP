import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Searchcubit/search_cubit.dart';
import 'package:bpr602_cinema/Cubits/mycubit/mycubit_cubit.dart';
import 'package:bpr602_cinema/wedgets/seeallMovieCard.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (_) => MycubitCubit()..getmovietype(),
      child: BlocListener<MycubitCubit, MycubitState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is MovietypsearchErrorstate) {
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
              BlocBuilder<MycubitCubit, MycubitState>(
                builder: (context, state) {
                  return Padding(
                      padding: EdgeInsets.all(size.height * 0.01),
                      child: TextField(
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
                          suffixIcon: state is! MycubitInitial
                              ? IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    context.read<MycubitCubit>().clearSearch();
                                  },
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                                color: Colors.white), // Default border color
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                                color: border), // Non-focused border color
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                                color: beige), // Focused border color
                          ),
                        ),
                      ));
                },
              ),

              // Filter Selection or Search Results
              Expanded(
                child: BlocBuilder<MycubitCubit, MycubitState>(
                  builder: (context, state) {
                    if (state is Movietypsearcheinitial) {
                      return CircularProgressIndicator();
                    }

                    if (state is MycubitInitial) {
                      return GridView.builder(
                          padding: const EdgeInsets.all(8.0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: context
                              .read<MycubitCubit>()
                              .getMovieTypemodel!
                              .data!
                              .length,
                          itemBuilder: (context, index) {
                            final filter = context
                                .read<MycubitCubit>()
                                .getMovieTypemodel!
                                .data![index]
                                .englishName!;

                            return GestureDetector(
                              onTap: () {
                                context
                                    .read<MycubitCubit>()
                                    .selectFilter(filter);
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
                          });
                    } else if (state is FilterSelected) {
                      return Center(
                        child: Text(
                            style: TextStyle(color: Colors.white),
                            'Filter Selected: ${state.filter}'),
                      );
                    } else if (state is Searching) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is SearchLoaded) {
                      return ListView.builder(
                        itemCount: state.results.length,
                        itemBuilder: (context, index) {
                          return 
                          // ListTile(
                          //     title: Text(
                          //         style: TextStyle(color: Colors.white),
                          //         state.results[index]));
                          SeeallMovieCard(
                            Language: "EN",
                            title: state.results[index],
                            imgurl: "https://m.media-amazon.com/images/M/MV5BMTQxNzY1MjI5NF5BMl5BanBnXkFtZTcwNTI0MDY1OQ@@._V1_QL75_UX380_CR0,20,380,562_.jpg",
                            genre: "+18",
                            director: 'the diractor',
                            duration: 96,
                            ar: "+18",
                          );
                        },
                      );
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
}



// class FilterGrid extends StatelessWidget {
//   final List<String> filters = [
//     'Horror',
//     'Science Fiction',
//     'Adventures',
//     'Action',
//     'Imagination',
//   ];
  

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: const EdgeInsets.all(8.0),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 3,
//         crossAxisSpacing: 8.0,
//         mainAxisSpacing: 8.0,
//       ),
//       itemCount: filters.length,
//       itemBuilder: (context, index) {
//         final filter = filters[index];
//         return GestureDetector(
//           onTap: () {
//             context.read<MycubitCubit>().selectFilter(filter);
//           },
//           child: Container(
//            decoration: BoxDecoration(
//         color: ksmallActionColor,
//         borderRadius: BorderRadius.circular(12),
     
//         gradient: const LinearGradient(
//           colors: [
//             Color.fromARGB(255, 71, 71, 71), 
//             ksmallActionColor
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//             child: Center(
//               child: Text(
//                 filter,
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
