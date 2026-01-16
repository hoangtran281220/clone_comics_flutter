import 'package:clone_manga_app_flutter/app/app.locator.dart';
import 'package:clone_manga_app_flutter/core/models/paging_cursor.dart';
import 'package:clone_manga_app_flutter/domain/domain.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/paged_results.dart';
import '../../../domain/entities/reading_history.dart';
import '../main/states/reading_history_state.dart';

class HistoryViewModel extends ReactiveViewModel {
  final GetReadingHistoriesUseCase _getReadingHistoriesUseCase =
  locator<GetReadingHistoriesUseCase>();

  final ReadingHistoryState _historyState =
  locator<ReadingHistoryState>();

  PagingCursor? _cursor;
  bool _hasMore = true;
  bool get hasMore => _hasMore;

  /// 🔥 View đọc từ STATE
  List<ReadingHistory> get readingHistories =>
      _historyState.item;

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_historyState];

  Future<void> loadInitial() async {
    if (isBusy) return;

    setBusy(true);
    _cursor = null;
    _hasMore = true;

    final result = await _getReadingHistoriesUseCase.execute(
      limit: 10,
    );

    _historyState.setAll(result.items);
    _cursor = result.nextCursor;
    _hasMore = result.nextCursor != null;

    setBusy(false);
  }

  Future<void> loadMore() async {
    if (isBusy || !_hasMore) return;

    setBusy(true);

    final result = await _getReadingHistoriesUseCase.execute(
      cursor: _cursor,
      limit: 10,
    );

    _historyState.addAll(result.items);
    _cursor = result.nextCursor;
    _hasMore = result.nextCursor != null;

    setBusy(false);
  }
}
