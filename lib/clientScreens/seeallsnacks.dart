
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/seeallsnackscubit/seeallsnacks_cubit.dart';
import 'package:bpr602_cinema/clientScreens/detailesPage.dart';
import 'package:bpr602_cinema/clientScreens/snackdetailescreen.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/searchBar.dart';
import 'package:bpr602_cinema/wedgets/seeallMovieCard.dart';
import 'package:bpr602_cinema/wedgets/seeallsnacksCard.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';

class SeeAllSnacksScreen extends StatelessWidget {
  final String type ;
  const SeeAllSnacksScreen({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => SeeallsnacksCubit(type: type)..getsnacks(),
      child: BlocListener<SeeallsnacksCubit, SeeallsnacksState>(
        listener: (context, state) {
          if (state is Seeallsnacklerror) {
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
              'All Snacks',
              style: TextStyle(color: Ktext),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kbutton,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Column(
            children: [
              // شريط البحث
              Padding(
                padding: EdgeInsets.all(size.height * 0.01),
                child: Builder(
                  builder: (searchContext) {
                    searchController.text =
                        BlocProvider.of<SeeallsnacksCubit>(searchContext).searchQuery;
                    return MySearchBar(
                      controller: searchController,
                      hintText: 'Search snacks...',
                      leading: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      trailing: [
                        BlocBuilder<SeeallsnacksCubit, SeeallsnacksState>(
                          builder: (context, state) {
                            final cubit = context.read<SeeallsnacksCubit>();
                            return cubit.searchQuery.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () {
                                      cubit.searchsnacks('');
                                      searchController.clear();
                                    },
                                  )
                                : const SizedBox.shrink();
                          },
                        ),
                      ],
                      onChanged: (value) {
                        BlocProvider.of<SeeallsnacksCubit>(searchContext)
                            .searchsnacks(value.trim());
                      },
                      onSubmitted: (value) {
                        BlocProvider.of<SeeallsnacksCubit>(searchContext)
                            .searchsnacks(value.trim());
                      },
                    );
                  },
                ),
              ),

              // قائمة الوجبات الخفيفة
              Expanded(
                child: BlocBuilder<SeeallsnacksCubit, SeeallsnacksState>(
                  builder: (context, state) {
                    final cubit = context.read<SeeallsnacksCubit>();

                    if (state is Seeallsnackloading && cubit.snacks.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (cubit.snacks.isEmpty && cubit.loadedOnce && !cubit.isFetching) {
                      return Center(
                        child: Text(
                          cubit.searchQuery.isNotEmpty
                              ? 'No snacks found'
                              : 'No snacks available',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: cubit.snacks.length + (cubit.hasMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < cubit.snacks.length) {
                          final snack = cubit.snacks[index];
                          return GestureDetector(
                            onTap: () {
                              NavigationWidget.pushPage(
                                context,
                                SnackDetails(
                                  snackId: snack.id!,
                                  
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(size.width * 0.02),
                              child: SeeallSnacksCard(
                                imgurl: snack.image != null
                                    ? '${LinksUrl.baseUrl}${snack.image!.url}'
                                    : 'https://example.com/default-snack.png',
                                title: snack.englishName ?? 'Unnamed Snack',
                                 variants:snack.variants! , 
                                 desc: snack.description!,
                              
                              
                              ),
                            ),
                          );
                        } else {
                          cubit.getsnacks();
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      },
                    );
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
