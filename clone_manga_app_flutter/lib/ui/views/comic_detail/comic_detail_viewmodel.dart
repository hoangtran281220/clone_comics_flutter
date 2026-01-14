import 'package:clone_manga_app_flutter/app/app.router.dart';
import 'package:clone_manga_app_flutter/domain/entities/chapter.dart';
import 'package:clone_manga_app_flutter/domain/usecases/get_comic_by_id_usecase.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../domain/entities/comic.dart';
import '../../../domain/usecases/get_chapters_by_comic_id_usecase.dart';

class ComicDetailViewmodel extends BaseViewModel {
  late String comicId;

  final GetComicByIdUseCase _getComicByIdUsecase =
      locator<GetComicByIdUseCase>();
  final GetChaptersByComicIdUseCase _getChaptersByComicIdUseCase =
      locator<GetChaptersByComicIdUseCase>();
  final _navigationService = locator<NavigationService>();

  Comic? comic;

  List<Chapter> chapters = [];

  Future<void> init(String comicId) async {
    this.comicId = comicId;
    setBusy(true);
    comic = await _getComicByIdUsecase.executeWithId(comicId);
    chapters = await _getChaptersByComicIdUseCase.executeWithComicId(comicId);

    setBusy(false);
    notifyListeners();
  }

  void goToChapterDetail(Chapter chapter) {
    _navigationService.replaceWithChapterDetailView(chapter: chapter);
  }
}
