import 'package:flutter/material.dart';

class Views extends StatelessWidget {
  const Views({super.key, required this.views});
  final int views;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Icon(Icons.remove_red_eye, size: 14),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            views.toString(),
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
