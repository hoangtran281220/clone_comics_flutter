import 'package:clone_manga_app_flutter/app/app.locator.dart';
import 'package:clone_manga_app_flutter/domain/entities/reading_history.dart';
import 'package:clone_manga_app_flutter/domain/usecases/params/reading_history_param.dart';
import '../../core/usecase/usecase.dart';
import '../repositories/reading_history_repository.dart';

class SaveReadingHistoryUseCase
    implements UseCaseWithParams<void, ReadingHistoryParam> {
  final ReadingHistoryRepository _repository =
      locator<ReadingHistoryRepository>();

  @override
  Future<ReadingHistory?> execute(ReadingHistoryParam params) async {
     _repository.saveOrUpdate(
        comicId: params.comicId,
        chapterId: params.chapterId,
        comicTitle: params.comicTitle,
        chapterTitle: params.chapterTitle,
        chapterNumber: params.chapterNumber,
        imgUrl: params.imgUrl);

     return _repository.getByComicId(params.comicId);
  }
}
