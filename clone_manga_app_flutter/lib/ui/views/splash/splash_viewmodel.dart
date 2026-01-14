import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void startDelay() {
    Timer(const Duration(seconds: 3), () {
      _navigationService.replaceWithLoginView();
    });
  }
}
