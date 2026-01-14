import 'package:cloud_firestore/cloud_firestore.dart';

import '../../app/app.locator.dart';
import '../../core/models/paged_results.dart';
import '../../domain/entities/comic.dart';
import '../../core/models/paging_cursor.dart';
import '../../domain/repositories/comic_repository.dart';
import '../datasource/remote/firebase/comic_remote_datasource.dart';
import '../mapper/comic_mapper.dart';
import '../dtos/comic_dto.dart';

class ComicRepositoryImpl implements ComicRepository {
  final ComicRemoteDatasource remote = locator<ComicRemoteDatasource>();
  final ComicMapper mapper = locator<ComicMapper>();

  @override
  Future<PagedResult<Comic>> getComics({
    PagingCursor? cursor,
    int limit = 12,
  }) async {
    // 1️⃣ datasource trả DTO luôn
    final page = await remote.getComics(
      cursor: cursor,
      limit: limit,
    );

    // 2️⃣ DTO -> Entity
    final comics = page.items.map(mapper.map).toList();

    // 3️⃣ trả domain result
    return PagedResult(
      items: comics,
      nextCursor: page.nextCursor,
    );
  }

  @override
  Future<Comic?> getComicById(String comicId) async {
    final ComicDto? dto = await remote.getComicById(comicId);
    if (dto == null) return null;

    return mapper.map(dto);
  }
}
