import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'snackdetailes_state.dart';

class SnackdetailesCubit extends Cubit<SnackdetailesState> {
  SnackdetailesCubit() : super(SnackdetailesInitial());
}
