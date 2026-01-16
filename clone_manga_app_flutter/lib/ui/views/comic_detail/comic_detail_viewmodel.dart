import 'package:clone_manga_app_flutter/app/app.router.dart';
import 'package:clone_manga_app_flutter/domain/entities/chapter.dart';
import 'package:clone_manga_app_flutter/domain/entities/reading_history.dart';
import 'package:clone_manga_app_flutter/domain/usecases/get_comic_by_id_usecase.dart';
import 'package:clone_manga_app_flutter/domain/usecases/params/reading_history_param.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../domain/entities/comic.dart';
import '../../../domain/usecases/get_chapters_by_comic_id_usecase.dart';
import '../../../domain/usecases/save_reading_history_usecase.dart';
import '../main/states/reading_history_state.dart';

class ComicDetailViewmodel extends BaseViewModel {
  late String comicId;

  final GetComicByIdUseCase _getComicByIdUsecase =
      locator<GetComicByIdUseCase>();
  final GetChaptersByComicIdUseCase _getChaptersByComicIdUseCase =
      locator<GetChaptersByComicIdUseCase>();
  final SaveReadingHistoryUseCase _saveReadingHistoryUseCase =
      locator<SaveReadingHistoryUseCase>();
  final ReadingHistoryState _historyState =
  locator<ReadingHistoryState>();

  final _navigationService = locator<NavigationService>();

  bool _isDescriptionExpanded = false;

  bool get isDescriptionExpanded => _isDescriptionExpanded;

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

  Future<void> goToChapterDetail(Chapter chapter) async {
    ReadingHistory? readingHistory = await _saveReadingHistoryUseCase.execute(ReadingHistoryParam(
        comicId: comicId,
        chapterId: chapter.id,
        comicTitle: comic!.title,
        chapterTitle: chapter.chapterTitle,
        chapterNumber: chapter.chapterNumber,
        imgUrl: comic!.coverImage));

    _historyState.add(readingHistory!);

    _navigationService.replaceWithChapterDetailView(chapter: chapter);
  }

  void toggleDescription() {
    _isDescriptionExpanded = !_isDescriptionExpanded;
    notifyListeners();
  }
}
