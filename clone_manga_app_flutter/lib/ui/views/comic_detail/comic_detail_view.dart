import 'package:clone_manga_app_flutter/ui/views/comic_detail/comic_detail_viewmodel.dart';
import 'package:clone_manga_app_flutter/ui/views/comic_detail/widgets/comic_detail.dart';
import 'package:clone_manga_app_flutter/ui/views/comic_detail/widgets/list_chapter.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../common_widgets/cover_image.dart';

class ComicDetailView extends StackedView<ComicDetailViewmodel> {
  const ComicDetailView({super.key, required this.comicId});

  final String comicId;

  @override
  Widget builder(
    BuildContext context,
    ComicDetailViewmodel vm,
    Widget? child,
  ) {
    if (vm.isBusy) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (vm.comic == null) {
      return const Scaffold(
        body: Center(
          child: Text('Comic not found'),
        ),
      );
    }

    final comic = vm.comic!;

    return Scaffold(
        appBar: AppBar(
          title: Text(comic.title),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ComicDetail(
                comic: comic,
                isDescriptionExpanded: vm.isDescriptionExpanded,
                onToggle: vm.toggleDescription),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  label: const Text('Yêu thích'),
                ),
              ),
            ),
            ListChapter(
              chapters: vm.chapters,
              onChapterTap: (chapter) {
                vm.goToChapterDetail(chapter);
              },
            )
          ]),
        ));
  }

  @override
  ComicDetailViewmodel viewModelBuilder(BuildContext context) {
    return ComicDetailViewmodel();
  }

  @override
  void onViewModelReady(ComicDetailViewmodel vm) {
    vm.init(comicId);
    super.onViewModelReady(vm);
  }
}
