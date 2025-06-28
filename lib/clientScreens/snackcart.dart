import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Cartcubit/shopping_cart_cubit.dart';
import 'package:bpr602_cinema/Cubits/bookingCubit/booking_cubit.dart';
import 'package:bpr602_cinema/clientScreens/Bill.dart';
import 'package:bpr602_cinema/clientScreens/BookingDetailes.dart';
import 'package:bpr602_cinema/clientScreens/snackscreen.dart';
import 'package:bpr602_cinema/models/snackModel.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<ShoppingCartCubit, ShoppingCartState>(
      listener: (context, state) {
    //       final cartCubit = context.read<ShoppingCartCubit>();
    //        final bookingCubit = context.read<BookingCubit>();
    // bookingCubit.selectSnacks(cartCubit.listOfCartItem);
      },
      child: BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
        builder: (context, state) {
          final cartItems = context.read<ShoppingCartCubit>().listOfCartItem;

          if (cartItems.isEmpty) {
               final cartCubit = context.read<ShoppingCartCubit>();
           final bookingCubit = context.read<BookingCubit>();
   bookingCubit.selectSnacks([]);
            return Scaffold(
              backgroundColor: Kbackground,
              appBar: AppBar(
                title: Text('My Cart',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold)),
                backgroundColor: Kbackground,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: kbutton),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sorry Your cart is empty.',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    Lottie.asset(
                      'assets/svg/empty cart.json',
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                  ],
                ),
              ),
            );
          }

          return Scaffold(
            backgroundColor: Kbackground,
            appBar: AppBar(
              title: Text('My Cart',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold)),
              backgroundColor: Kbackground,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: kbutton),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final snack = cartItems[index];
                      return CartItemWidget(
                        snack: snack,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.1),
                  child: Container(
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
                    width: size.width * 0.9,
                    height: size.height * 0.3,
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(size.width * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Price Detailes",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.sp),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.0008,
                          ),
                          Padding(
                            padding: EdgeInsets.all(size.width * 0.02),
                            child: Divider(
                              thickness: 0.5,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.002,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Subtotal: \$${context.read<ShoppingCartCubit>().calculateTotal(cartItems)}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.sp),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(
                                "Service fee = 0 IQD",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.sp),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.all(size.width * 0.02),
                                child: Divider(
                                  thickness: 0.5,
                                ),
                              ),
                              BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
                                builder: (context, state) {
                                  final cartItems = context
                                      .read<ShoppingCartCubit>()
                                      .listOfCartItem;
                                  return Text(
                                    'Total: \$${context.read<ShoppingCartCubit>().addtoservice(context.read<ShoppingCartCubit>().calculateTotal(cartItems))}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.sp),
                                  );
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              
                ElevatedBtn(
                    backgroundColor: kbutton,
                    textColor: ksmallActionColor,
                    buttonText: "Checkout",
                    onPressed: () {
                      final listofcart =
                          context.read<ShoppingCartCubit>().listOfCartItem;
                      context.read<BookingCubit>().selectSnacks(listofcart);
                      
                      //context.read<BookingCubit>().confirmSnackCheckout();
                      // طباعة البيانات للتأكد (لأغراض التصحيح)
                      // final booking = context.read<BookingCubit>().state
                      //     as BookingDataState;
                      // print("Selected Snacks:");
                      // for (var snack in booking.selectedSnacks) {
                      //   print(
                      //       " - ${snack.title}, Quantity: ${snack.quantity}, VariantID: ${snack.variantId}, Price: ${snack.price}");
                      // }
                      // final cartCubit = context.read<ShoppingCartCubit>();
                      // final bookingCubit = context.read<BookingCubit>();
                      // bookingCubit.selectSnacks(cartCubit.listOfCartItem);

                      // // طباعة الـ variants بعد الحفظ
                      // final state = bookingCubit.state as BookingDataState;
                      // print('----- After Saving Variants -----');
                      // print('All Variant IDs: ${state.variantIds}');
                      // state.selectedSnacks.forEach((snack) {
                      //   print(
                      //       '${snack.variantId} (${snack.size}) x${snack.quantity}');
                      // });

                      AppConstants.showToast(context, 'Snacks booking ready',
                          icon: Icons.done, iconcolor: Colors.green);
                      NavigationWidget.pushPage(context, BookingDetailes());
                    })
                
              ],
            ),
          );
        },
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final snacks snack;

  const CartItemWidget({super.key, required this.snack});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
        width: size.width * 0.6,
        height: size.height * 0.15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  snack.snackimg,
                  height: size.height * 0.8,
                  width: size.width * 0.2,
                  fit: BoxFit.fitHeight,
                ),
              ),
              title: Text(
                snack.title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price: \$${snack.price + (context.read<ShoppingCartCubit>().sizePriceMap[snack.size] ?? 0)} x ${snack.quantity}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(10)),
                          width: size.width * 0.1,
                          height: size.height * 0.05,
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<ShoppingCartCubit>()
                                  .incrementQuantity(snack);
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(10)),
                          width: size.width * 0.1,
                          height: size.height * 0.05,
                          child: Center(
                            child: Text(
                              "${snack.quantity}",
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(10)),
                          width: size.width * 0.1,
                          height: size.height * 0.05,
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<ShoppingCartCubit>()
                                  .decrementQuantity(snack);
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  context.read<ShoppingCartCubit>().removeFromCart(snack);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
