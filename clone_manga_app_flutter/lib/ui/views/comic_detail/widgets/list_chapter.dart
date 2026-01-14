import 'package:flutter/material.dart';

import '../../../../domain/entities/chapter.dart';

class ListChapter extends StatelessWidget {
  const ListChapter(
      {super.key, required this.chapters, required this.onChapterTap});
  final List<Chapter> chapters;
  final void Function(Chapter chapter) onChapterTap;

  @override
  Widget build(BuildContext context) {
    if (chapters.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Chưa có chapter nào'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Danh sách chapter',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 8),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: chapters.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final chapter = chapters[index];

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).dividerColor, width: 1),
                  borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                leading: Text(
                  chapter.chapterNumber.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                title: Text(chapter.chapterTitle),
                subtitle: Text(
                  'Lượt xem: ${chapter.views}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                onTap: () => onChapterTap(chapters[index]),
              ),
            );
          },
        ),
      ],
    );
  }
}
