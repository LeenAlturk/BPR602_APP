import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'indexedstackclientapp_state.dart';

class IndexedstackclientappCubit extends Cubit<IndexedstackclientappState> {
  IndexedstackclientappCubit() : super(IndexedstackclientappInitial());
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangedIndex());
  }
}
