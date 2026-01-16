import 'package:clone_manga_app_flutter/domain/entities/reading_history.dart';
import 'package:stacked/stacked.dart';

class ReadingHistoryState with ListenableServiceMixin {
  final List<ReadingHistory> _item = [];

  List<ReadingHistory> get item => List.unmodifiable(_item);

  void add(ReadingHistory history) {
    _item.removeWhere(
      (e) => e.comicId == history.comicId,
    );

    _item.insert(0, history);
    notifyListeners();
  }

  void setAll(List<ReadingHistory> histories) {
    _item
      ..clear()
      ..addAll(histories);
    notifyListeners();
  }

  void clear() {
    _item.clear();
    notifyListeners();
  }

  void addAll(List<ReadingHistory> histories) {
    _item.addAll(histories);
    notifyListeners();
  }

}
