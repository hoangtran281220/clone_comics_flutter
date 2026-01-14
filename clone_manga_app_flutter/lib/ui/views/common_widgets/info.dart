import 'package:clone_manga_app_flutter/ui/views/common_widgets/rating.dart';
import 'package:clone_manga_app_flutter/ui/views/common_widgets/views.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info(
      {super.key,
      required this.title,
      required this.description,
      required this.rating,
      required this.views});
  final String title;
  final String description;
  final double rating;
  final int views;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Rating(rating: rating)),
              Expanded(child: Views(views: views)),
            ],
          ),
        ],
      ),
    );
  }
}
