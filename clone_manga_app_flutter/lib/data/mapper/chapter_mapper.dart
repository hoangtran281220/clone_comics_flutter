import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/mapper/mapper.dart';
import '../../domain/entities/chapter.dart';
import '../dtos/chapter_dto.dart';

class ChapterMapper implements Mapper<ChapterDto, Chapter> {
  @override
  Chapter map(ChapterDto dto) {
    return Chapter(
      id: dto.id,
      comicId: dto.comicId,
      chapterNumber: dto.chapterNumber,
      chapterTitle: dto.chapterTitle,
      content: dto.content,
      createdAt: dto.createdAt,
      views: dto.views,
    );
  }
}
