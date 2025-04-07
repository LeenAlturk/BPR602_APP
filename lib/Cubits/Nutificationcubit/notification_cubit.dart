import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
    int? selectedFilter = 0;
    final List<bool> _expandedStates = List.generate(10, (_) => false);
     bool isExpanded = false; 
  void selectFilter(int filterindex) {
    selectedFilter = filterindex;
    emit(SeeallFilterSelected(selectindex: filterindex));
    //fetchDataFromApi(index); // function api
  }
}
