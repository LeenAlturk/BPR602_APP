
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Cartcubit/shopping_cart_cubit.dart';
import 'package:bpr602_cinema/Cubits/snackcubit/snackcubit_cubit.dart';
import 'package:bpr602_cinema/clientScreens/seeallshowing.dart';
import 'package:bpr602_cinema/clientScreens/seeallsnacks.dart';
import 'package:bpr602_cinema/clientScreens/snackcart.dart';
import 'package:bpr602_cinema/clientScreens/snackdetailescreen.dart';
import 'package:bpr602_cinema/models/snackModel.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/Snack_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      create: (context) => SnackcubitCubit(),
      child: BlocConsumer<SnackcubitCubit, SnackcubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Kbackground,
            appBar: AppBar(
              backgroundColor: Kbackground,
              title: Text(
                'Snacks',
                style: TextStyle(color: Ktext, fontSize: 14.sp),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: kbutton,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              // actions:  [
              //   Padding(
              //     padding: EdgeInsets.all(size.width * 0.01),
              //     child: IconButton(onPressed: (){
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const CartScreen()),
              //       );
              //     }, icon: Icon(
              //       Icons.shopping_cart,
              //       color: Colors.white,
              //     ),)
              //   )
              // ],
              actions: [
  Padding(
    padding: EdgeInsets.all(size.width * 0.01),
    child: BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
      builder: (context, state) {
        final cartItems = context.read<ShoppingCartCubit>().listOfCartItem;
        final itemCount = cartItems.fold(0, (sum, item) => sum + item.quantity);
        
        return Stack(
          clipBehavior: Clip.none, // مهم لعدم قص الجزء الزائد
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              },
              icon: Icon(Icons.shopping_cart, color: Colors.white),
            ),
            if (itemCount > 0)
              Positioned(
                right: -2, // تعديل الموضع أفقيًا
                top: -2,  // تعديل الموضع رأسيًا
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 210, 26, 13),
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Center(
                    child: Text(
                      itemCount.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
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
              automaticallyImplyLeading: true,
            ),
            body: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                        Padding(
                      padding:  EdgeInsets.all(size.height * 0.01),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          
                          "assets/newsnacks.jpg",
                          width: size.width,
                          height: size.height *0.15,
                          fit: BoxFit.cover, 
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(size.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cinema food',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                               NavigationWidget.pushPage(
                                  context, const SeeAllSnacksScreen());
                            },
                            child: Text(
                              'see all',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.36,
                      width: size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snack.length,
                        itemBuilder: (context, index) {
                          final snacks = snack[index];
                          return Padding(
                            padding:  EdgeInsets.symmetric(
                               horizontal: size.width * 0.03),
                            child: GestureDetector(
                                onTap: () {
                                  NavigationWidget.pushPage(
                                      context,
                                      SnackDetails(
                                        description: snacks.describtion,
                                        snackimg: snacks.snackimg,
                                        title: snacks.title,
                                        price: snacks.price,
                                      ));
                                },
                                child: Hero(
                                  tag: snacks.title,
                                  child: SnackCard(
                                      imageUrl: snacks.snackimg,
                                      title: snacks.title,
                                      price: snacks.price),
                                )),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(size.width * 0.05),
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
                                  context, const SeeAllSnacksScreen());
                            },
                            child: Text(
                              'see all',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.36,
                      width: size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snack.length,
                        itemBuilder: (context, index) {
                          final snacks = snack[index];
                          return Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            child: GestureDetector(
                                onTap: () {
                                  NavigationWidget.pushPage(
                                      context,
                                      SnackDetails(
                                        description: snacks.describtion,
                                        snackimg: snacks.snackimg,
                                        title: snacks.title,
                                        price: snacks.price,
                                      ));
                                },
                                child: Hero(
                                  tag: '${snacks.title}_$index',
                                  child: SnackCard(
                                      imageUrl: snacks.snackimg,
                                      title: snacks.title,
                                      price: snacks.price),
                                )),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
