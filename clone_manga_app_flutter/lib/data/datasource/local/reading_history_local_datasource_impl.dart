import 'package:clone_manga_app_flutter/data/datasource/local/reading_history_local_datasource.dart';
import 'package:clone_manga_app_flutter/domain/entities/reading_history.dart';
import 'package:hive/hive.dart';

import '../../../core/models/paged_results.dart';
import '../../../core/models/paging_cursor.dart';

class ReadingHistoryLocalDatasourceImpl
    implements ReadingHistoryLocalDatasource {
  static const String boxName = 'reading_history';

  final Box<ReadingHistory> _box = Hive.box<ReadingHistory>(boxName);

  @override
  ReadingHistory? getByComicId(String comicId) {
    // TODO: implement getByComicId
    return _box.get(comicId);
  }

  @override
  Future<void> saveOrUpdate({
    required String comicId,
    required String chapterId,
    required String comicTitle,
    required String chapterTitle,
    required int chapterNumber,
    String? imgUrl,
  }) async {
    // TODO: implement saveOrUpdate
    await _box.put(
      comicId,
      ReadingHistory(
        comicId: comicId,
        chapterId: chapterId,
        comicTitle: comicTitle,
        chapterTitle: chapterTitle,
        chapterNumber: chapterNumber,
        imgUrl: imgUrl,
        lastReadAt: DateTime.now(),
      ),
    );
  }

  @override
  PagedResult<ReadingHistory> getAllPaged({
    PagingCursor? cursor,
    required int limit,
  }) {
    final all = _box.values.toList()
      ..sort((a, b) => b.lastReadAt.compareTo(a.lastReadAt));

    final DateTime? lastReadAt = cursor == null ? null : cursor.raw as DateTime;

    final filtered = lastReadAt == null
        ? all
        : all.where((e) => e.lastReadAt.isBefore(lastReadAt)).toList();

    final items = filtered.take(limit).toList();

    final nextCursor =
        items.length < limit ? null : PagingCursor(items.last.lastReadAt);

    return PagedResult(
      items: items,
      nextCursor: nextCursor,
    );
  }
}
