import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'seeallsnacks_state.dart';

class SeeallsnacksCubit extends Cubit<SeeallsnacksState> {
  SeeallsnacksCubit() : super(SeeallsnacksInitial());
    int? selectedFilter = 0;
  void selectFilter(int filterindex) {
    selectedFilter = filterindex;
    emit(SeeallSnacksFilterSelected(selectindex: filterindex));
    //fetchDataFromApi(index); // function api
  }
}
