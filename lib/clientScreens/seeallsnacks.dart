import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Cubits/SeeAllcubit/seeall_cubit.dart';
import 'package:bpr602_cinema/Cubits/seeallsnackscubit/seeallsnacks_cubit.dart';
import 'package:bpr602_cinema/clientScreens/snackdetailescreen.dart';
import 'package:bpr602_cinema/models/snackModel.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/filter.dart';
import 'package:bpr602_cinema/wedgets/searchBar.dart';
import 'package:bpr602_cinema/wedgets/seeallsnacksCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllSnacksScreen extends StatelessWidget {
  const SeeAllSnacksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => SeeallsnacksCubit(),
      child: BlocListener<SeeallsnacksCubit, SeeallsnacksState>(
        listener: (context, state) {},
        child: Scaffold(
          backgroundColor: Kbackground,
          appBar: AppBar(
            backgroundColor: Kbackground,
            title: const Text(
              ' Our Snacks',
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
                  hintText: 'Search Snacks...',
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
              BlocBuilder<SeeallsnacksCubit, SeeallsnacksState>(
                builder: (context, state) {
                  final selectedIndex =
                      (state is SeeallSnacksFilterSelected) ? state.selectindex : 0;
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
                        label: 'bescuit',
                        isSelected: selectedIndex == 1,
                        onSelected: () {
                          context.read<SeeallCubit>().selectFilter(1);
                        },
                      ),
                      CustomFilterChip(
                        label: 'Chips',
                        isSelected: selectedIndex == 2,
                        onSelected: () {
                          context.read<SeeallCubit>().selectFilter(2);
                        },
                      ),
                      CustomFilterChip(
                        label: 'Fastfood',
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
                  itemCount: snack.length,
                  itemBuilder: (context, index) {
                    final Snack = snack[index];
                    return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 13.0),
                        child: GestureDetector(
                          onTap: () {
                            NavigationWidget.pushPage(
                                context,
                                SnackDetails(
                                  description: Snack.describtion,
                                  snackimg: Snack.snackimg,
                                  title: Snack.title,
                                  price: Snack.price,
                                ));
                          },
                          child: SeeallSnacksCard(
                            desc: "“JUMPO POPCORN” Is A large size popcorn served in movie Theaters. It Is usually larger than regular popcorn and can hold A serving That is large Enough for several people to share." ,
                            price: Snack.price,
                            title: Snack.title,
                            imgurl: Snack.snackimg,
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
