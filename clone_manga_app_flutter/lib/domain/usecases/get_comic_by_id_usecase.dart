import 'package:clone_manga_app_flutter/app/app.locator.dart';
import 'package:clone_manga_app_flutter/core/usecase/usecase.dart';
import 'package:clone_manga_app_flutter/domain/repositories/comic_repository.dart';

import '../entities/comic.dart';

class GetComicByIdUseCase implements UseCase<Comic?> {
  final ComicRepository _repository = locator<ComicRepository>();

  @override
  Future<Comic?> execute() {
    // TODO: implement execute
    throw UnimplementedError();
  }

  Future<Comic?> executeWithId(String comicId) {
    return _repository.getComicById(comicId);
  }
}
