import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Searchcubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (_) => SearchCubit(),
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
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return Padding(
                    padding: EdgeInsets.all(size.height * 0.01),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      onChanged: (query) {
                        if (query.isEmpty) {
                          context.read<SearchCubit>().clearSearch();
                        } else {
                          context.read<SearchCubit>().search(query);
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: state is! SearchInitial
                            ? IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  context.read<SearchCubit>().clearSearch();
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
                              color:beige), // Focused border color
                        ),
                      ),
                    ));
              },
            ),

            // Filter Selection or Search Results
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return FilterGrid();
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
                        return ListTile(
                            title: Text(
                                style: TextStyle(color: Colors.white),
                                state.results[index]));
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
    );
  }
}

class FilterGrid extends StatelessWidget {
  final List<String> filters = [
    'Horror',
    'Science Fiction',
    'Adventures',
    'Action',
    'Imagination',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: filters.length,
      itemBuilder: (context, index) {
        final filter = filters[index];
        return GestureDetector(
          onTap: () {
            context.read<SearchCubit>().selectFilter(filter);
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
}
