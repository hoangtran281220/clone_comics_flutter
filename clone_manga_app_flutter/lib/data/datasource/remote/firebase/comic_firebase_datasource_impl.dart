import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/models/paged_results.dart';
import '../../../../core/models/paging_cursor.dart';
import '../../../dtos/chapter_dto.dart';
import '../../../dtos/comic_dto.dart';
import 'comic_remote_datasource.dart';

class ComicFirebaseDatasource implements ComicRemoteDatasource {
  final CollectionReference<Map<String, dynamic>> _collection =
      FirebaseFirestore.instance.collection('comics');

  final CollectionReference<Map<String, dynamic>> _chapter =
      FirebaseFirestore.instance.collection('chapters');

  @override
  Future<PagedResult<ComicDto>> getComics({
    PagingCursor? cursor,
    int limit = 12,
  }) async {
    Query<Map<String, dynamic>> query =
        _collection.orderBy('UpdatedAt', descending: true).limit(limit);

    if (cursor != null) {
      query = query.startAfterDocument(
        cursor.raw as DocumentSnapshot,
      );
    }

    final snapshot = await query.get();

    final items = snapshot.docs.map((doc) {
      final data = doc.data();

      return ComicDto(
        id: doc.id,
        title: data['Title'] as String,
        description: data['Description'] as String,
        coverImage: data['CoverImage'] as String,
        status: data['Status'] as String,
        rating: (data['Rating'] as num).toDouble(),
        ratingCount: (data['RatingCount'] as num).toInt(),
        views: (data['Views'] as num).toInt(),
        currentChapter: (data['CurrentChapter'] as num).toInt(),
        tagIds: List<String>.from(data['TagIds'] ?? []),
        authorIds: List<String>.from(data['AuthorIds'] ?? []),
        createdAt: (data['CreatedAt'] as Timestamp).toDate(),
        updatedAt: (data['UpdatedAt'] as Timestamp).toDate(),
      );
    }).toList();

    return PagedResult(
      items: items,
      nextCursor:
          snapshot.docs.isEmpty ? null : PagingCursor(snapshot.docs.last),
    );
  }

  @override
  Future<ComicDto?> getComicById(String comicId) async {
    final doc = await _collection.doc(comicId).get();

    if (!doc.exists) return null;

    final data = doc.data()!;

    return ComicDto(
      id: doc.id,
      title: data['Title'] as String,
      description: data['Description'] as String,
      coverImage: data['CoverImage'] as String,
      status: data['Status'] as String,
      rating: (data['Rating'] as num).toDouble(),
      ratingCount: (data['RatingCount'] as num).toInt(),
      views: (data['Views'] as num).toInt(),
      currentChapter: (data['CurrentChapter'] as num).toInt(),
      tagIds: List<String>.from(data['TagIds'] ?? []),
      authorIds: List<String>.from(data['AuthorIds'] ?? []),
      createdAt: (data['CreatedAt'] as Timestamp).toDate(),
      updatedAt: (data['UpdatedAt'] as Timestamp).toDate(),
    );
  }

  @override
  Future<ChapterDto?> getChapterById(String chapterId) async {
    final doc = await _chapter.doc(chapterId).get();

    if (!doc.exists) return null;

    final data = doc.data()!;

    return ChapterDto(
      id: doc.id,
      comicId: data['ComicId'] as String,
      chapterNumber: (data['ChapterNumber'] as num).toInt(),
      chapterTitle: data['ChapterTitle'] as String,
      content: List<String>.from(data['Content'] ?? []),
      createdAt: (data['CreatedAt'] as Timestamp).toDate(),
      views: (data['Views'] as num).toInt(),
    );
  }

  @override
  Future<List<ChapterDto>> getChaptersByComicId(String comicId) async {
    final snapshot = await _chapter
        .where('ComicId', isEqualTo: comicId)
        .orderBy('ChapterNumber')
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();

      return ChapterDto(
        id: doc.id,
        comicId: data['ComicId'] as String,
        chapterNumber: (data['ChapterNumber'] as num).toInt(),
        chapterTitle: data['ChapterTitle'] as String,
        content: List<String>.from(data['Content'] ?? []),
        createdAt: (data['CreatedAt'] as Timestamp).toDate(),
        views: (data['Views'] as num).toInt(),
      );
    }).toList();
  }
}
