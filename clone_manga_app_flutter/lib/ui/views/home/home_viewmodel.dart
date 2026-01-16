import 'package:clone_manga_app_flutter/app/app.router.dart';
import 'package:clone_manga_app_flutter/ui/views/main/states/favorite_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../domain/entities/comic.dart';
import '../../../core/models/paging_cursor.dart';
import '../../../domain/usecases/get_comics_paging_usecase.dart';

class HomeViewModel extends BaseViewModel {
  final GetComicsPagingUseCase _getComics = locator<GetComicsPagingUseCase>();
  final NavigationService _navigationService = locator<NavigationService>();
  final List<Comic> _comics = [];
  final FavoriteState _favoriteState = locator<FavoriteState>();

  List<Comic> get comics => _comics;

  PagingCursor? _cursor;
  bool _hasMore = true;
  bool get hasMore => _hasMore;

  Future<void> loadInitial() async {
    if (isBusy) return;

    setBusy(true);

    _cursor = null;
    _hasMore = true;
    _comics.clear();

    final page = await _getComics.execute(
      cursor: _cursor,
      limit: 12,
    );

    _comics.addAll(page.items);
    _cursor = page.nextCursor;
    _hasMore = page.items.length == 12;

    setBusy(false);
    notifyListeners();
  }

  Future<void> loadMore() async {
    if (isBusy || !_hasMore) return;

    setBusy(true);

    final page = await _getComics.execute(
      cursor: _cursor,
      limit: 12,
    );

    _comics.addAll(page.items);
    _cursor = page.nextCursor;
    _hasMore = page.items.length == 12;

    setBusy(false);
    notifyListeners();
  }

  void openComicDetail(String comicId) async {
    await _navigationService.navigateToComicDetailView(comicId: comicId);
  }
}
