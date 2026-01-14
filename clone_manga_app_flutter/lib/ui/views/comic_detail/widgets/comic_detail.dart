import 'package:flutter/material.dart';

import '../../../../domain/entities/comic.dart';
import '../../common_widgets/cover_image.dart';

class ComicDetail extends StatelessWidget {
  const ComicDetail({super.key, required this.comic});
  final Comic comic;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CoverImage(imageUrl: comic.coverImage),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            comic.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            comic.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
