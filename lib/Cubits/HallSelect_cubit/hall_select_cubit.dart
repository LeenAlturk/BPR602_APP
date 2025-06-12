import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hall_select_state.dart';

class HallSelectCubit extends Cubit<HallSelectState> {
  HallSelectCubit() : super(HallSelectInitial());
}
