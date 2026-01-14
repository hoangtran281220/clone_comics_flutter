import 'package:clone_manga_app_flutter/app/app.locator.dart';
import 'package:clone_manga_app_flutter/ui/views/main/states/favorite_state.dart';
import 'package:stacked/stacked.dart';

class FavoriteViewModel extends BaseViewModel {
  final FavoriteState _favoriteState = locator<FavoriteState>();
  List<String> get names => _favoriteState.names;
}
