// import 'package:bpr602_cinema/AllUserScreens/spalshscreen.dart';
// import 'package:bpr602_cinema/Cubits/Cartcubit/shopping_cart_cubit.dart';
// import 'package:bpr602_cinema/controller/app_store.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() async{
//      await Future.wait([
//     DataStore.instance.init(),
//   ]);
//   runApp(
//     BlocProvider(
//       create: (context) =>
//           ShoppingCartCubit(), // Provide cubit at the root level
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }

///new

import 'dart:developer';

import 'package:bpr602_cinema/AllUserScreens/spalshscreen.dart';
import 'package:bpr602_cinema/Cubits/Cartcubit/shopping_cart_cubit.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

// void main() async {
//  WidgetsFlutterBinding.ensureInitialized();

//   await Future.wait([
//     DataStore.instance.init(),
//   ]);

//    await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   Future.delayed(const Duration(seconds: 1), () {
//     runApp(
//       BlocProvider(
//         create: (context) => ShoppingCartCubit(),
//         child: const MyApp(),
//       ),
//     );
//   });
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Future.wait([
      DataStore.instance.init(),
    ]);
  } finally {
    // Register dependencies (if needed in your app)
    GetIt.I.registerSingleton<Authrepo>(Authrepo());

   
    if (DataStore.instance.hasToken) {
      log('user token is : ${DataStore.instance.token}');
    } else {
      log('there is no user');
    }

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((value) {
      Future.delayed(const Duration(seconds: 1), () {
        runApp(
          BlocProvider(
            create: (context) => GetIt.I<ShoppingCartCubit>(),
            child: const MyApp(),
          ),
        );
      });
    });
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

