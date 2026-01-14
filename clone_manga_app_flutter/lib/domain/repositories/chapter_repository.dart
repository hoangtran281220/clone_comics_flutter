import '../entities/chapter.dart';

abstract class ChapterRepository {
  Future<List<Chapter>> getChapters(String comicId);
}
