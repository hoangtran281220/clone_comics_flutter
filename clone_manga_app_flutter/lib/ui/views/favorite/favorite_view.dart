import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'favorite_viewmodel.dart';

class FavoriteView extends StackedView<FavoriteViewModel> {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FavoriteViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(viewModel.names[index]),
            );
          },
          itemCount: viewModel.names.length),
    );
  }

  @override
  FavoriteViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FavoriteViewModel();
}
