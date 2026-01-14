class ChapterDto {
  final String id;
  final String comicId;
  final int chapterNumber;
  final String chapterTitle;
  final List<String> content;
  final DateTime createdAt;
  final int views;

  const ChapterDto({
    required this.id,
    required this.comicId,
    required this.chapterNumber,
    required this.chapterTitle,
    required this.content,
    required this.createdAt,
    required this.views,
  });
}
