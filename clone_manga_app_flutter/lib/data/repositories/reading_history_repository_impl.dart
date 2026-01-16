import 'package:clone_manga_app_flutter/data/datasource/local/reading_history_local_datasource.dart';
import 'package:clone_manga_app_flutter/domain/entities/reading_history.dart';

import '../../app/app.locator.dart';
import '../../core/models/paged_results.dart';
import '../../core/models/paging_cursor.dart';
import '../../domain/repositories/reading_history_repository.dart';

class ReadingHistoryRepositoryImpl implements ReadingHistoryRepository {
  final ReadingHistoryLocalDatasource _localDatasource =
      locator<ReadingHistoryLocalDatasource>();

  @override
  ReadingHistory? getByComicId(String comicId) {
    // TODO: implement getByComicId
    return _localDatasource.getByComicId(comicId);
  }

  @override
  Future<void> saveOrUpdate(
      {required String comicId,
      required String chapterId,
      required String comicTitle,
      required String chapterTitle,
      required int chapterNumber,
      String? imgUrl}) {
    // TODO: implement saveOrUpdate
    return _localDatasource.saveOrUpdate(
        comicId: comicId,
        chapterId: chapterId,
        comicTitle: comicTitle,
        chapterTitle: chapterTitle,
        chapterNumber: chapterNumber,
        imgUrl: imgUrl);
  }

  @override
  PagedResult<ReadingHistory> getAllPaged({
    PagingCursor? cursor,
    required int limit,
  }) {
    return _localDatasource.getAllPaged(
      cursor: cursor,
      limit: limit,
    );
  }
}
