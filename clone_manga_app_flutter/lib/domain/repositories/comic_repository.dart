import '../../core/models/paged_results.dart';
import '../entities/comic.dart';
import '../../core/models/paging_cursor.dart';

abstract class ComicRepository {
  Future<PagedResult<Comic>> getComics({
    PagingCursor? cursor,
    int limit,
  });

  Future<Comic?> getComicById(String comicId);
}
