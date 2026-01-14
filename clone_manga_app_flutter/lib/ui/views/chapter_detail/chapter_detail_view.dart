import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../domain/entities/chapter.dart';
import 'chapter_detail_viewmodel.dart';

class ChapterDetailView extends StackedView<ChapterDetailViewModel> {
  const ChapterDetailView({super.key, required this.chapter});
  final Chapter chapter;

  @override
  Widget builder(
    BuildContext context,
    ChapterDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("ChapterDetailView")),
      ),
    );
  }

  @override
  ChapterDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChapterDetailViewModel();
}
