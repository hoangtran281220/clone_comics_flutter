import 'package:clone_manga_app_flutter/ui/views/home/widgets/comic_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel vm, Widget? child) {
    if (vm.isBusy && vm.comics.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (vm.comics.isEmpty) {
      return const Center(child: Text('Không có truyện'));
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (scroll) {
        if (scroll.metrics.pixels >= scroll.metrics.maxScrollExtent - 200) {
          vm.loadMore();
        }
        return false;
      },
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: vm.comics.length + (vm.hasMore ? 1 : 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.48,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemBuilder: (context, index) {
          if (index >= vm.comics.length) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final comic = vm.comics[index];

          return ComicGridItem(
            comic: comic,
            onTap: () {
              vm.openComicDetail(comic.id);
            },
          );
        },
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) {
    return HomeViewModel();
  }

  @override
  void onViewModelReady(HomeViewModel vm) {
    vm.loadInitial();
    super.onViewModelReady(vm);
  }
}
