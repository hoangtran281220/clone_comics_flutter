import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, errol, stackTrace) => const Icon(Icons.error),
      ),
    );
  }
}
