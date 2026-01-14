import 'package:clone_manga_app_flutter/ui/views/favorite/favorite_view.dart';
import 'package:clone_manga_app_flutter/ui/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../search/search_view.dart';
import 'main_viewmodel.dart';

class MainView extends StackedView<MainViewModel> {
  const MainView({super.key});

  @override
  Widget builder(
    BuildContext context,
    MainViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App đọc truyện'),
        ),
        body: IndexedStack(
          index: viewModel.currentIndex,
          children: [HomeView(), SearchView(), FavoriteView()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: viewModel.currentIndex,
          onTap: viewModel.changeTab,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'Tìm kiếm'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Yêu thích')
          ],
        ));
  }

  @override
  MainViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainViewModel();
}
