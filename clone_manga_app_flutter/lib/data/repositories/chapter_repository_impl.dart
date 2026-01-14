import '../../app/app.locator.dart';
import '../../domain/entities/chapter.dart';
import '../../domain/repositories/chapter_repository.dart';
import '../datasource/remote/firebase/comic_remote_datasource.dart';
import '../dtos/chapter_dto.dart';
import '../mapper/chapter_mapper.dart';

class ChapterRepositoryImpl implements ChapterRepository {
  final ComicRemoteDatasource datasource = locator<ComicRemoteDatasource>();
  final ChapterMapper mapper = locator<ChapterMapper>();

  @override
  Future<List<Chapter>> getChapters(String comicId) async {
    final List<ChapterDto> dtos =
        await datasource.getChaptersByComicId(comicId);

    return dtos.map(mapper.map).toList();
  }
}
