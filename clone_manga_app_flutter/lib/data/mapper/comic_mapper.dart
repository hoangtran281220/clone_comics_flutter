import '../../core/mapper/mapper.dart';
import '../../domain/entities/comic.dart';
import '../dtos/comic_dto.dart';

class ComicMapper implements Mapper<ComicDto, Comic> {
  @override
  Comic map(ComicDto dto) {
    return Comic(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      coverImage: dto.coverImage,
      status: dto.status,
      rating: dto.rating,
      ratingCount: dto.ratingCount,
      views: dto.views,
      currentChapter: dto.currentChapter,
      tagIds: dto.tagIds,
      authorIds: dto.authorIds,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}
