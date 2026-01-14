class Comic {
  final String id;
  final String title;
  final String description;
  final String coverImage;
  final String status;
  final double rating;
  final int ratingCount;
  final int views;
  final List<String> tagIds;
  final List<String> authorIds;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int currentChapter;

  Comic({
    required this.id,
    required this.title,
    required this.description,
    required this.coverImage,
    required this.status,
    required this.rating,
    required this.ratingCount,
    required this.views,
    required this.tagIds,
    required this.authorIds,
    required this.createdAt,
    required this.updatedAt,
    required this.currentChapter,
  });
}
