import 'package:flutter/material.dart';

import '../../../../domain/entities/comic.dart';
import '../../common_widgets/cover_image.dart';
import 'comic_description_overlay.dart';

class ComicDetail extends StatelessWidget {
  const ComicDetail(
      {super.key,
      required this.comic,
      required this.isDescriptionExpanded,
      required this.onToggle});

  final Comic comic;
  final bool isDescriptionExpanded;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Stack(children: [
              CoverImage(imageUrl: comic.coverImage),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: ComicDescriptionOverlay(
                      description: comic.description,
                      isExpanded: isDescriptionExpanded,
                      onToggle: onToggle,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
