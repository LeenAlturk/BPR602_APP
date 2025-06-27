import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Cartcubit/shopping_cart_cubit.dart';
import 'package:bpr602_cinema/Cubits/snackcubit/snackcubit_cubit.dart';
import 'package:bpr602_cinema/clientScreens/NotificationPage.dart';
import 'package:bpr602_cinema/clientScreens/seeallsnacks.dart';
import 'package:bpr602_cinema/clientScreens/snackcart.dart';
import 'package:bpr602_cinema/clientScreens/snackdetailescreen.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/Snack_card.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/models/response/snacks_response.dart';

import 'package:carousel_slider/carousel_slider.dart';

class SnackScreen extends StatefulWidget {
  const SnackScreen({super.key});

  @override
  State<SnackScreen> createState() => _SnackScreenState();
}

class _SnackScreenState extends State<SnackScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => SnackcubitCubit()..getsnakfood()..getsnakdrinks(),
      child: Builder(
        builder: (newContext) => BlocListener<SnackcubitCubit, SnackcubitState>(
          listener: (context, state) {
            if (state is snackerror) {
                if (state.message == "Session Is Done") {
              AppConstants.showToast(context, state.message);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            } else if (state.message == "No Internet Connection") {
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
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: kbutton,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enjoy our delicious snacks',
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.all(size.width * 0.01),
                  child: BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
                    builder: (context, state) {
                        final cartItems = context.read<ShoppingCartCubit>().listOfCartItem;
        final itemCount = cartItems.fold(0, (sum, item) => sum + item.quantity);
        
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const CartScreen()),
                              );
                            },
                            icon: const Icon(Icons.shopping_cart,
                                color: Colors.white),
                          ),
                          if (itemCount > 0)
                            Positioned(
                              right: -2,
                              top: -2,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 210, 26, 13),
                                  shape: BoxShape.circle,
                                ),
                                constraints: const BoxConstraints(
                                    minWidth: 16, minHeight: 16),
                                child: Center(
                                  child: Text(
                                    itemCount.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
            body: RefreshIndicator(
              color: kbutton,
              onRefresh: () async {
                await newContext.read<SnackcubitCubit>().refreshAll();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    BlocBuilder<SnackcubitCubit, SnackcubitState>(
                      builder: (context, state) {
                        final cubit = context.read<SnackcubitCubit>();
                        if (state is Snackloading) {
                          return SizedBox(
                            height: size.height * 0.36,
                            child: CarouselSlider.builder(
                              itemCount: 3,
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                  width: size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: ksmallActionColor,
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF303030),
                                        ksmallActionColor
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                        color: kbutton),
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                height: size.height * 0.2,
                                autoPlay: false,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                              ),
                            ),
                          );
                        }

                        if (state is Snacksloaded &&
                            cubit.snackResponsefood?.data != null) {
                          // Filter only "Food" snacks for carousel
                          final foodSnacks = cubit.snackResponsefood!.data;
                              

                          return CarouselSlider(
                            items: foodSnacks!.map((snack) {
                              final imageUrl = snack.image != null
                                  ? '${LinksUrl.baseUrl}${snack.image!.url}'
                                  : null;
                              return Builder(
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Navigate to snack details if needed
                                    },
                                    child: Container(
                                      width: size.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: imageUrl != null
                                            ? DecorationImage(
                                                image: NetworkImage(imageUrl),
                                                fit: BoxFit.fill,
                                              )
                                            : null,
                                        color: imageUrl == null
                                            ? Colors.grey
                                            : null,
                                      ),
                                      child: imageUrl == null
                                          ? Center(
                                              child: Text(
                                                snack.englishName ?? 'No image',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )
                                          : null,
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: size.height * 0.2,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: true,
                            ),
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Snaks',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              //SeeAllSnacksScreen
                              NavigationWidget.pushPage(
                                context,
                                const SeeAllSnacksScreen(type:"Snak"),
                              );
                            },
                            child: Text(
                              'see all',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Ktext,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<SnackcubitCubit, SnackcubitState>(
                      builder: (context, state) {
                        final cubit = context.read<SnackcubitCubit>();

                        if (state is Snackloading) {
                          return SizedBox(
                            height: size.height * 0.36,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.height * 0.001,
                                        horizontal: size.height * 0.02),
                                    child: Container(
                                      width: size.width * 0.42,
                                      height: size.height * 0.4,
                                      decoration: BoxDecoration(
                                        color: ksmallActionColor,
                                        borderRadius: BorderRadius.circular(12),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF303030),
                                            ksmallActionColor
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Center(
                                          child: CircularProgressIndicator(
                                        color: kbutton,
                                      )),
                                    ),
                                  );
                                }),
                          );
                        }
                        if (state is Snacksloaded &&
                            cubit.snackResponsefood?.data != null) {
                          // Filter only "Food" snacks
                          final foodSnacks = cubit.snackResponsefood!.data!
                        ;

                          return SizedBox(
                            height: size.height * 0.36,
                            width: size.width,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: foodSnacks.length,
                              itemBuilder: (context, index) {
                                final snackData = foodSnacks[index];

                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.001,
                                      horizontal: size.height * 0.02),
                                  child: GestureDetector(
                                    onTap: () {
                                      NavigationWidget.pushPage(
                                        context,
                                        SnackDetails(snackId: snackData.id!),
                                      );
                                    },
                                    child: SnackCard(
                                      imageUrl: snackData.image != null
                                          ? '${LinksUrl.baseUrl}${snackData.image!.url}'
                                          : null,
                                      title: snackData.englishName,
                                      variants: snackData.variants,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                        return SizedBox();
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Drinks',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              NavigationWidget.pushPage(
                                context,
                                const SeeAllSnacksScreen(type:"Drink"),
                              );
                            },
                            child: Text(
                              'see all',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Ktext,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<SnackcubitCubit, SnackcubitState>(
                      builder: (context, state) {
                        final cubit = context.read<SnackcubitCubit>();

                        if (state is Snackloading) {
                          return SizedBox(
                            height: size.height * 0.36,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.height * 0.001,
                                        horizontal: size.height * 0.02),
                                    child: Container(
                                      width: size.width * 0.42,
                                      height: size.height * 0.4,
                                      decoration: BoxDecoration(
                                        color: ksmallActionColor,
                                        borderRadius: BorderRadius.circular(12),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF303030),
                                            ksmallActionColor
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Center(
                                          child: CircularProgressIndicator(
                                        color: kbutton,
                                      )),
                                    ),
                                  );
                                }),
                          );
                        }
                        if (state is Snacksloaded &&
                            cubit.snackResponsedrinks?.data != null) {
                          // Filter only "Drink" snacks
                          final drinkSnacks = cubit.snackResponsedrinks!.data;
                             

                          return SizedBox(
                            height: size.height * 0.36,
                            width: size.width,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: drinkSnacks!.length,
                              itemBuilder: (context, index) {
                                final snackData = drinkSnacks[index];
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.001,
                                      horizontal: size.height * 0.02),
                                  child: GestureDetector(
                                    onTap: () {
                                      // SnackDetails
                                      NavigationWidget.pushPage(
                                        context,
                                        SnackDetails(snackId: snackData.id!),
                                      );
                                    },
                                    child: SnackCard(
                                      imageUrl: snackData.image != null
                                          ? '${LinksUrl.baseUrl}${snackData.image!.url}'
                                          : null,
                                      title: snackData.englishName,
                                      variants: snackData.variants,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                        return SizedBox();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
