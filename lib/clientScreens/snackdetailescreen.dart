// import 'package:bpr602_cinema/Constants/colors.dart';
// import 'package:bpr602_cinema/Constants/sizer.dart';
// import 'package:bpr602_cinema/Cubits/Cartcubit/shopping_cart_cubit.dart';
// import 'package:bpr602_cinema/clientScreens/snackcart.dart';
// import 'package:bpr602_cinema/clientScreens/snackscreen.dart';
// import 'package:bpr602_cinema/models/snackModel.dart';
// import 'package:bpr602_cinema/wedgets/Navigating.dart';
// import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
// import 'package:bpr602_cinema/wedgets/toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SnackDetails extends StatelessWidget {
//   final String snackimg;
//   final String title;
//   final int price;
//   final String description;

//   const SnackDetails({
//     super.key,
//     required this.description,
//     required this.snackimg,
//     required this.title,
//     required this.price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     // Create a snack item
//     final snackItem = snacks(
//       title: title,
//       price: price,
//       snackimg: snackimg,
//       describtion: description,
//       quantity: 1,
//       size: "M", // Default size
//     );

//     return BlocConsumer<ShoppingCartCubit, ShoppingCartState>(
//       listener: (context, state) {
//         if (state is ItemIsAdded) {
//           print('${state.productName} added to the cart');
//         }
//         if (state is ItemIsRemoved) {
//           print('${state.productName} removed from the cart');
//         }
//         if (state is ItemQuantityUpdated) {
//           print('Quantity of ${state.productName} updated');
//         }
//       },
//       builder: (context, state) {
//         final cartCubit = context.read<ShoppingCartCubit>();

//         return Scaffold(
//           backgroundColor: Kbackground,
//           appBar: AppBar(
//             centerTitle: true,
//             backgroundColor: Kbackground,
//             title: Text(
//               'Snacks',
//               style: TextStyle(color: Ktext, fontSize: 14.sp),
//             ),
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back_ios, color: kbutton),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             // actions: [
//             //   Padding(
//             //     padding:  EdgeInsets.all(size.width * 0.01),
//             //     child: IconButton(
//             //       onPressed: () {
//             //         Navigator.push(
//             //           context,
//             //           MaterialPageRoute(
//             //               builder: (context) => const CartScreen()),
//             //         );
//             //       },
//             //       icon: const Icon(Icons.shopping_cart),
//             //     ),
//             //   )
//             // ],
//             actions: [
//               Padding(
//                 padding: EdgeInsets.all(size.width * 0.01),
//                 child: BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
//                   builder: (context, state) {
//                     final cartItems =
//                         context.read<ShoppingCartCubit>().listOfCartItem;
//                     final itemCount =
//                         cartItems.fold(0, (sum, item) => sum + item.quantity);

//                     return Stack(
//                       clipBehavior: Clip.none, // مهم لعدم قص الجزء الزائد
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const CartScreen()),
//                             );
//                           },
//                           icon: Icon(Icons.shopping_cart, color: Colors.white),
//                         ),
//                         if (itemCount > 0)
//                           Positioned(
//                             right: -2, // تعديل الموضع أفقيًا
//                             top: -2, // تعديل الموضع رأسيًا
//                             child: Container(
//                               padding: EdgeInsets.all(2),
//                               decoration: BoxDecoration(
//                                 color: const Color.fromARGB(255, 210, 26, 13),
//                                 shape: BoxShape.circle,
//                               ),
//                               constraints: BoxConstraints(
//                                 minWidth: 16,
//                                 minHeight: 16,
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   itemCount.toString(),
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ),
//                           ),
//                       ],
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//           body: ListView(
//             children: [
//               Column(
//                 children: [
//                   SizedBox(height: size.height * 0.02),
//                   Center(
//                     child: Column(
//                       children: [
//                         Hero(
//                           tag: title,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             alignment: Alignment.center,
//                             height: size.height * 0.40,
//                             width: size.width * 0.80,
//                             child: ClipRRect(
//                               borderRadius: const BorderRadius.vertical(
//                                 top: Radius.circular(12),
//                                 bottom: Radius.circular(12),
//                               ),
//                               child: Image.network(
//                                 snackimg,
//                                 height: size.height * 0.40,
//                                 width: size.width,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(size.width * 0.04),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           title,
//                           style: const TextStyle(
//                             color: kbutton,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: size.width * 0.04, vertical: 0),
//                     child: Text(
//                       description,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(size.width * 0.04),
//                         child: Text("Select Size  :",
//                             style: TextStyle(
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.bold,
//                                 color: kbutton)),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: ["M", "L", "XL"].map((size) {
//                           return Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: GestureDetector(
//                               onTap: () {
//                                 cartCubit.updateSize(snackItem, size);
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.all(15.0),
//                                 decoration: BoxDecoration(
//                                   color: snackItem.size == size
//                                       ? kbutton
//                                       : Colors.grey,
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: Text(size,
//                                     style: TextStyle(color: Colors.white)),
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: size.height * 0.03),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: size.width * 0.2,
//                         height: size.height * 0.080,
//                         decoration: BoxDecoration(
//                           color: ksmallActionColor,
//                           borderRadius: BorderRadius.circular(20),
//                           gradient: LinearGradient(
//                             colors: [
//                               Color.fromARGB(255, 22, 27, 54),
//                               ksmallActionColor,
//                             ],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                         ),
//                         child: IconButton(
//                           onPressed: () =>
//                               cartCubit.incrementQuantity(snackItem),
//                           icon: const Icon(Icons.add, color: Colors.white),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(size.width * 0.04),
//                         child: Text(
//                           snackItem.quantity.toString(),
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18.sp,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: size.width * 0.2,
//                         height: size.height * 0.080,
//                         decoration: BoxDecoration(
//                           color: ksmallActionColor,
//                           borderRadius: BorderRadius.circular(20),
//                           gradient: LinearGradient(
//                             colors: [
//                               Color.fromARGB(255, 22, 27, 54),
//                               ksmallActionColor,
//                             ],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                         ),
//                         child: IconButton(
//                           onPressed: () =>
//                               cartCubit.decrementQuantity(snackItem),
//                           icon: const Icon(Icons.remove, color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: size.height * 0.03),
//                   // Text(
//                   //   "Total: ${(snackItem.quantity * (price + cartCubit.sizePriceMap[snackItem.size]!))}",
//                   //   style: TextStyle(color: Colors.white, fontSize: 20.sp),
//                   // ),
//                   ElevatedBtn(
//                     buttonText:
//                         "Add to Cart Total  ${(snackItem.quantity * (price + cartCubit.sizePriceMap[snackItem.size]!))}.IQD", // Change text based on isItemAdded
//                     backgroundColor: kbutton,
//                     onPressed: () {
//                       cartCubit.addToCart(snackItem);
//                       AppConstants.showToast(context, 'Snack added to cart ',
//                           icon: Icons.done, iconcolor: Colors.green);
//                       NavigationWidget.popPage(context, SnackScreen());
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/AllUserScreens/NointernetScreen.dart';
import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:bpr602_cinema/Cubits/Cartcubit/shopping_cart_cubit.dart';
import 'package:bpr602_cinema/clientScreens/snackcart.dart';
import 'package:bpr602_cinema/clientScreens/snackscreen.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/models/snackModel.dart';
import 'package:bpr602_cinema/models/response/snackresponse_byid.dart';
import 'package:bpr602_cinema/wedgets/Navigating.dart';
import 'package:bpr602_cinema/wedgets/elevatedbtn.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SnackDetails extends StatefulWidget {
  final int snackId;

  const SnackDetails({super.key, required this.snackId});

  @override
  State<SnackDetails> createState() => _SnackDetailsState();
}

class _SnackDetailsState extends State<SnackDetails> {
  snacks? snackItem;
  List<Variant> variants = [];

  @override
  void initState() {
    super.initState();
    context.read<ShoppingCartCubit>().getMoviedetailes(widget.snackId);
  }

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<ShoppingCartCubit>();
    Size size = MediaQuery.of(context).size;

    return BlocListener<ShoppingCartCubit, ShoppingCartState>(
      listener: (context, state) {
        // TODO: implement listener
          if (state is DetailsnackEerorstate) {
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
      child: BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
        builder: (context, state) {
          final data = cartCubit.snackResponsebyid?.data;

          if (state is Detailessnackloading || data == null) {
            return const Scaffold(
              backgroundColor: Kbackground,
              body: Center(child: CircularProgressIndicator()),
            );
          }

          variants = data.variants ?? [];

          if (variants.isEmpty) {
            return const Scaffold(
              backgroundColor: Kbackground,
              body: Center(child: Text("No sizes available for this snack")),
            );
          }

          snackItem ??= snacks(
            title: data.englishName ?? "",
            price: variants.first.price ?? 0,
            snackimg: '${LinksUrl.baseUrl}${data!.image!.url}',
            describtion: data.description ?? "",
            variantId: variants.first.id ?? 0,
            quantity: 1,
            size: variants.first.size ?? "M",
          );

          final itemCount = cartCubit.listOfCartItem
              .fold(0, (sum, item) => sum + item.quantity);

          return Scaffold(
            backgroundColor: Kbackground,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Kbackground,
              title: Text('Snacks',
                  style: TextStyle(color: Ktext, fontSize: 14.sp)),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: kbutton),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.all(size.width * 0.01),
                  child: Stack(
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
                  ),
                )
              ],
            ),
            body: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: size.height * 0.02),
                    Center(
                      child: Hero(
                        tag: snackItem!.title,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            snackItem!.snackimg,
                            height: size.height * 0.4,
                            width: size.width * 0.8,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.04),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          snackItem!.title,
                          style: const TextStyle(
                            color: kbutton,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: Text(
                        snackItem!.describtion,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Select Size:",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: kbutton,
                                  fontWeight: FontWeight.bold)),
                          Row(
                            children: variants.map((variant) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      snackItem!.size = variant.size!;
                                      snackItem!.price = variant.price!;
                                      snackItem!.variantId = variant.id!;
                                    });
                                    //cartCubit.updateSize(snackItem!, variant.size!);
                                    cartCubit.updateSizeAndVariant(
                                        snackItem!,
                                        variant.size!,
                                        variant.id!,
                                        variant.price!);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: snackItem!.size == variant.size
                                          ? kbutton
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      variant.size!,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildQtyButton(Icons.add, () {
                          //setState(() => snackItem!.quantity++);
                          cartCubit.incrementQuantity(snackItem!);
                        }),
                        Padding(
                          padding: EdgeInsets.all(size.width * 0.04),
                          child: Text(
                            snackItem!.quantity.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        buildQtyButton(Icons.remove, () {
                          // setState(() {
                          //   if (snackItem!.quantity > 1) {
                          //     //snackItem!.quantity--;
                          //     cartCubit.decrementQuantity(snackItem!);
                          //   }
                          // });
                          if (snackItem!.quantity > 1) {
                            //snackItem!.quantity--;
                            cartCubit.decrementQuantity(snackItem!);
                          }
                        }),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    ElevatedBtn(
                      buttonText:
                          "Add to Cart Total ${(snackItem!.quantity * snackItem!.price)} SYP",
                      backgroundColor: kbutton,
                      onPressed: () {
                        cartCubit.addToCart(snackItem!);
                        AppConstants.showToast(context, 'Snack added to cart',
                            icon: Icons.done, iconcolor: Colors.green);
                        NavigationWidget.popPage(context, const SnackScreen());
                      },
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

  Widget buildQtyButton(IconData icon, VoidCallback onTap) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.2,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [const Color.fromARGB(255, 22, 27, 54), ksmallActionColor],
        ),
      ),
      child:
          IconButton(onPressed: onTap, icon: Icon(icon, color: Colors.white)),
    );
  }
}
