import 'package:flutter/material.dart';

import '../../../../domain/entities/comic.dart';
import '../../common_widgets/cover_image.dart';
import '../../common_widgets/info.dart';

class ComicGridItem extends StatelessWidget {
  const ComicGridItem({super.key, required this.comic, required this.onTap});

  final Comic comic;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoverImage(imageUrl: comic.coverImage),
            Expanded(
              child: Info(
                  title: comic.title,
                  description: comic.description,
                  rating: comic.rating,
                  views: comic.views),
            ),
          ],
        ),
      ),
    );
  }
}
