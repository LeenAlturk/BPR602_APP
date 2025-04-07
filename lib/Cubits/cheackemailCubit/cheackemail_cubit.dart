import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:meta/meta.dart';

part 'cheackemail_state.dart';

class CheackemailCubit extends Cubit<CheackemailState> {
  CheackemailCubit() : super(CheackemailInitial());
  final FormValidator emailValidatorcheack = FormValidator(
    hint: 'Email',
    regExp: RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
    errorMessage: 'Invalid email address',
  );
}
