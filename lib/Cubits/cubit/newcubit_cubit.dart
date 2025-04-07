import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'newcubit_state.dart';

class NewcubitCubit extends Cubit<NewcubitState> {
  NewcubitCubit() : super(NewcubitInitial());
}
