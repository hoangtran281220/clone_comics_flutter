import 'package:clone_manga_app_flutter/core/models/paged_results.dart';
import 'package:clone_manga_app_flutter/core/models/paging_cursor.dart';
import 'package:clone_manga_app_flutter/core/usecase/usecase.dart';
import 'package:clone_manga_app_flutter/domain/domain.dart';
import 'package:clone_manga_app_flutter/domain/entities/reading_history.dart';

import '../../app/app.locator.dart';

class GetReadingHistoriesUseCase
    implements PagingUseCase<PagedResult<ReadingHistory>> {
  final ReadingHistoryRepository _readingHistoryRepository =
      locator<ReadingHistoryRepository>();

  @override
  Future<PagedResult<ReadingHistory>> execute(
      {PagingCursor? cursor, int limit = 10}) async {
    // TODO: implement execute
    return _readingHistoryRepository.getAllPaged(limit: limit);
  }
}
