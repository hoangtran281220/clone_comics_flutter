import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 14,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          rating.toStringAsFixed(2),
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
