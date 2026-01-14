import 'package:clone_manga_app_flutter/domain/exceptions/auth_exception.dart';
import 'package:clone_manga_app_flutter/domain/usecases/params/auth_param.dart';
import 'package:clone_manga_app_flutter/ui/views/register/register_view.form.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/register_usecase.dart';

class RegisterViewModel extends BaseViewModel with FormStateHelper{
  final _registerUseCase = locator<RegisterUseCase>();
  User? _user;
  User? get user => _user;

  Future<void> registerWithUsername() async {
    if (!isFormValid) return;

    if (passwordValue != confirmPasswordValue) {
      setPasswordValidationMessage('Password không khớp');
      setConfirmPasswordValidationMessage('Password không khớp');
      notifyListeners();
      return;
    }

    setBusy(true);
    clearErrors();

    try {
      final params = RegisterParams(
        username: usernameValue!,
        password: passwordValue!,
      );
      _user = await _registerUseCase.execute(params);
    } on AuthException catch(e){
      setError(e.message);
    } catch(_) {
      setError('Lỗi không xác định');
    }
    finally {
      setBusy(false);
      notifyListeners();
    }
  }

}
