import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Cartcubit/shopping_cart_cubit.dart';
import 'package:bpr602_cinema/clientScreens/snackcart.dart';
import 'package:bpr602_cinema/models/snackModel.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SnackDetails extends StatelessWidget {
  final String snackimg;
  final String title;
  final int price;
  final String description;

  const SnackDetails({
    super.key,
    required this.description,
    required this.snackimg,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Create a snack item
    final snackItem = snacks(
      title: title,
      price: price,
      snackimg: snackimg,
      describtion: description,
      quantity: 1,
      size: "M", // Default size
    );

    return BlocConsumer<ShoppingCartCubit, ShoppingCartState>(
      listener: (context, state) {
        if (state is ItemIsAdded) {
          print('${state.productName} added to the cart');
        }
        if (state is ItemIsRemoved) {
          print('${state.productName} removed from the cart');
        }
        if (state is ItemQuantityUpdated) {
          print('Quantity of ${state.productName} updated');
        }
      },
      builder: (context, state) {
        final cartCubit = context.read<ShoppingCartCubit>();

        return Scaffold(
          backgroundColor: Kbackground,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Kbackground,
            title: Text(
              'Snacks',
              style: TextStyle(color: Ktext, fontSize: 14.sp),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: kbutton),
              onPressed: () => Navigator.of(context).pop(),
            ),
            // actions: [
            //   Padding(
            //     padding:  EdgeInsets.all(size.width * 0.01),
            //     child: IconButton(
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const CartScreen()),
            //         );
            //       },
            //       icon: const Icon(Icons.shopping_cart),
            //     ),
            //   )
            // ],
          ),
          body: ListView(
            children: [
              Column(
                children: [
                   SizedBox(height: size.height * 0.02),
                  Center(
                    child: Column(
                      children: [
                        Hero(
                          tag: title,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            height: size.height * 0.40,
                            width: size.width * 0.80,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                                bottom: Radius.circular(12),
                              ),
                              child: Image.network(
                                snackimg,
                                height: size.height * 0.40,
                                width: size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(size.width * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: kbutton,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: size.width * 0.04 , vertical:  0),
                    child: Text(
                      description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                         padding:  EdgeInsets.all(size.width * 0.04),
                        child: Text("Select Size  :",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: kbutton)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: ["M", "L", "XL"].map((size) {
                          return Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                cartCubit.updateSize(snackItem, size);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  color: snackItem.size == size
                                      ? kbutton
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(size,
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.2,
                        height: size.height * 0.080,
                        decoration: BoxDecoration(
                          color: ksmallActionColor,
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 22, 27, 54),
                              ksmallActionColor,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: IconButton(
                          onPressed: () =>
                              cartCubit.incrementQuantity(snackItem),
                          icon: const Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(size.width * 0.04),
                        child: Text(
                          snackItem.quantity.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.2,
                        height: size.height * 0.080,
                        decoration: BoxDecoration(
                          color: ksmallActionColor,
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 22, 27, 54),
                              ksmallActionColor,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: IconButton(
                          onPressed: () =>
                              cartCubit.decrementQuantity(snackItem),
                          icon: const Icon(Icons.remove, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  // Text(
                  //   "Total: ${(snackItem.quantity * (price + cartCubit.sizePriceMap[snackItem.size]!))}",
                  //   style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  // ),
                  ElevatedBtn(
                    buttonText: "Add to Cart Total  ${(snackItem.quantity * (price + cartCubit.sizePriceMap[snackItem.size]!))}.IQD", // Change text based on isItemAdded
                    backgroundColor: kbutton,
                    onPressed: () {
                      cartCubit.addToCart(snackItem);
                      AppConstants.showToast(
                                              context,
                                              'added');
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
