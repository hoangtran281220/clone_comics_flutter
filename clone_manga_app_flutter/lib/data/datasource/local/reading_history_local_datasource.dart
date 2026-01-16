import '../../../core/models/paged_results.dart';
import '../../../core/models/paging_cursor.dart';
import '../../../domain/entities/reading_history.dart';

abstract class ReadingHistoryLocalDatasource {
  Future<void> saveOrUpdate({
    required String comicId,
    required String chapterId,
    required String comicTitle,
    required String chapterTitle,
    required int chapterNumber,
    String? imgUrl,
  });

  ReadingHistory? getByComicId(String comicId);

  PagedResult<ReadingHistory> getAllPaged({
    PagingCursor? cursor,
    required int limit,
  });
}
