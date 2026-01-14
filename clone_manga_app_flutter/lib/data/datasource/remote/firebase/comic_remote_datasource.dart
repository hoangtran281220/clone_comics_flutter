import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/models/paged_results.dart';
import '../../../../core/models/paging_cursor.dart';
import '../../../dtos/chapter_dto.dart';
import '../../../dtos/comic_dto.dart';

abstract class ComicRemoteDatasource {
  Future<PagedResult<ComicDto>> getComics({
    PagingCursor? cursor,
    int limit,
  });

  Future<ComicDto?> getComicById(String comicId);

  Future<ChapterDto?> getChapterById(String chapterId);

  Future<List<ChapterDto>> getChaptersByComicId(String comicId);
}
