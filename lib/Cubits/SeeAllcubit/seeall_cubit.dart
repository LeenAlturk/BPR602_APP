import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'seeall_state.dart';

class SeeallCubit extends Cubit<SeeallState> {
  SeeallCubit() : super(SeeallInitial());

  int? selectedFilter = 0;
  void selectFilter(int filterindex) {
    selectedFilter = filterindex;
    emit(SeeallFilterSelected(selectindex: filterindex));
    //fetchDataFromApi(index); // function api
  }
}
