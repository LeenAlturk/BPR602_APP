import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:meta/meta.dart';

part 'change_passwordemp_state.dart';

class ChangePasswordempCubit extends Cubit<ChangePasswordempState> {
  ChangePasswordempCubit() : super(ChangePasswordempInitial());
   bool get isPasswordHidden => _isPasswordHidden;
  bool _isPasswordHidden = true;

  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    emit(Changepasswordvisibility(visibile: _isPasswordHidden));
  }
  final FormValidator passwordValidator = FormValidator(
    hint: 'Password',
    regExp: RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$'),
    errorMessage: 'symbols, uppercase letters, number',
  );
  final FormValidator newpasswordValidator = FormValidator(
    hint: 'Password',
    regExp: RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$'),
    errorMessage: 'symbols, uppercase letters, number',
  );
  final FormValidator confirmpasswordValidator = FormValidator(
    hint: 'Password',
    regExp: RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$'),
    errorMessage: 'symbols, uppercase letters, number',
  );
}
