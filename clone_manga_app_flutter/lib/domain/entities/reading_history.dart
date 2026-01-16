import 'package:hive/hive.dart';
part 'reading_history.g.dart';

@HiveType(typeId: 1)
class ReadingHistory {
  ReadingHistory({
    required this.comicId,
    required this.chapterId,
    required this.lastReadAt,
    required this.comicTitle,
    required this.chapterTitle,
    required this.chapterNumber,
    this.imgUrl,
  });

  @HiveField(0)
  final String comicId;

  @HiveField(1)
  final String chapterId;

  @HiveField(2)
  final DateTime lastReadAt;

  @HiveField(3)
  final String comicTitle;

  @HiveField(4)
  final String chapterTitle;

  @HiveField(5)
  final int chapterNumber;

  @HiveField(6)
  final String? imgUrl;
}
