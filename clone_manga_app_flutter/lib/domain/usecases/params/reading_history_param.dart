class ReadingHistoryParam {
  final String comicId;
  final String chapterId;
  final String comicTitle;
  final String chapterTitle;
  final int chapterNumber;
  String? imgUrl;

  ReadingHistoryParam(
      {required this.comicId,
      required this.chapterId,
      required this.comicTitle,
      required this.chapterTitle,
      required this.chapterNumber,
      this.imgUrl});
}
