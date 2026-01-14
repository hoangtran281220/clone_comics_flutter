import '../../app/app.locator.dart';
import '../../core/usecase/usecase.dart';
import '../entities/chapter.dart';
import '../repositories/chapter_repository.dart';

class GetChaptersByComicIdUseCase implements UseCase<List<Chapter>> {
  final ChapterRepository _repository = locator<ChapterRepository>();

  @override
  Future<List<Chapter>> execute() {
    // TODO: implement execute
    throw UnimplementedError();
  }

  Future<List<Chapter>> executeWithComicId(String comicId) {
    return _repository.getChapters(comicId);
  }
}
