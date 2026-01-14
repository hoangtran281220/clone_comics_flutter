import 'package:clone_manga_app_flutter/app/app.locator.dart';
import 'package:clone_manga_app_flutter/app/app.router.dart';
import 'package:clone_manga_app_flutter/domain/exceptions/auth_exception.dart';
import 'package:clone_manga_app_flutter/domain/usecases/params/auth_param.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'login_view.form.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/login_with_google_usecase.dart';
import '../../../domain/usecases/login_with_username_usecase.dart';

class LoginViewModel extends BaseViewModel with FormStateHelper {
  final _loginWithUsernameUseCase = locator<LoginWithUsernameUseCase>();
  final _loginWithGoogleUseCase = locator<LoginWithGoogleUseCase>();
  final _navigationService = locator<NavigationService>();

  User? _user;
  User? get user => _user;

  Future<void> loginWithUsername() async {
    if (!isFormValid) return;

    setBusy(true);
    clearErrors();

    try {
      LoginWithUsernameParams params = LoginWithUsernameParams(
          username: usernameValue!, password: passwordValue!);
      _user = await _loginWithUsernameUseCase.execute(params);

      if (_user != null) {
        goToMain();
      }
    } on AuthException catch (e) {
      setError(e.message);
    } catch (_) {
      setError('Lỗi không xác định');
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  Future<void> loginWithGoogle() async {
    setBusy(true);
    clearErrors();
    try {
      _user = await _loginWithGoogleUseCase.execute();
      if(_user != null) {
        goToMain();
      }
    } on AuthException catch (e) {
      setError(e.message);
    } catch (_) {
      setError('Lỗi không xác định, Đăng nhập Google thất bại');
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  void goToRegister() {
    _navigationService.replaceWithRegisterView();
  }

  void goToMain() {
    _navigationService.replaceWithMainView();
  }
}
