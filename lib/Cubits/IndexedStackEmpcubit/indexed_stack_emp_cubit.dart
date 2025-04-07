import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'indexed_stack_emp_state.dart';

class IndexedStackEmpCubit extends Cubit<IndexedStackEmpState> {
  IndexedStackEmpCubit() : super(IndexedStackEmpInitial());
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangedIndex());
  }
}
