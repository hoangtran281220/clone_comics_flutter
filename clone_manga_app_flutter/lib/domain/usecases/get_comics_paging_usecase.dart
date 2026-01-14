import '../../app/app.locator.dart';
import '../../core/models/paged_results.dart';
import '../../core/usecase/usecase.dart';
import '../entities/comic.dart';
import '../../core/models/paging_cursor.dart';
import '../repositories/comic_repository.dart';

class GetComicsPagingUseCase implements PagingUseCase<PagedResult<Comic>> {
  final ComicRepository _repository = locator<ComicRepository>();

  @override
  Future<PagedResult<Comic>> execute({
    PagingCursor? cursor,
    int limit = 12,
  }) {
    return _repository.getComics(
      cursor: cursor,
      limit: limit,
    );
  }
}
