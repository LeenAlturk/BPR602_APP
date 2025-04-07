import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'no_internet_state.dart';

class NoInternetCubit extends Cubit<NoInternetState> {
  NoInternetCubit() : super(NoInternetInitial());
   late StreamSubscription subscription;
  bool isInternet = false;

  bool showConnectivity(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;

    if (hasInternet) {
      return true;
    } else {
      return false;
    }
  }

  Future onInit() async {
    emit(Watting());
    Future.delayed(const Duration(seconds: 20));
    subscription =
        Connectivity().onConnectivityChanged.listen(showConnectivity);
    final result = await Connectivity().checkConnectivity();
    isInternet = showConnectivity(result);
    if (isInternet) {
      emit(ConnectWithInternet());
    } else {
      emit(NotConnectWithInternet());
    }
  }
}
