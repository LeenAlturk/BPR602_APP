import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  
  String? isFirstOpen;
  String? isLogedIn;
  String? role;

  void checkFirstOpen() {
    isFirstOpen = DataStore.instance.numOpen;
    isLogedIn = DataStore.instance.token;
    role = DataStore.instance.roal;
  print('Fetched isFirstOpen: $isFirstOpen');

    emit(FirstOpenState());
  }
  
  bool isInternet = false;
  late StreamSubscription subscription;
  bool showConnectivity(ConnectivityResult result) {
    bool hasInternet = result != ConnectivityResult.none;

    if (hasInternet) {
      return true;
    } else {
      return false;
    }
  }

  Future onInit() async {
    subscription =
        Connectivity().onConnectivityChanged.listen(showConnectivity);
    final result = await Connectivity().checkConnectivity();
    isInternet = showConnectivity(result);
    emit(ConnectWithInternet());
  }
}
