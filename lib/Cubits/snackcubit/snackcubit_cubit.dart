import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'snackcubit_state.dart';

class SnackcubitCubit extends Cubit<SnackcubitState> {
  SnackcubitCubit() : super(SnackcubitInitial());
}
