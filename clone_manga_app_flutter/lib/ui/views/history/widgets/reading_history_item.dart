import 'package:flutter/material.dart';

import '../../../../domain/entities/reading_history.dart';
import '../../common_widgets/cover_image.dart';

class ReadingHistoryItem extends StatelessWidget {
  const ReadingHistoryItem(
      {super.key, required this.readingHistory, required this.onTap});

  final ReadingHistory readingHistory;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTap,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            clipBehavior: Clip.antiAlias,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    flex: 2,
                    child: CoverImage(imageUrl: readingHistory.imgUrl ?? '')),
                Flexible(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        readingHistory.comicTitle,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Chapter:${readingHistory.chapterNumber}-${readingHistory.chapterTitle}',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
