import 'package:clone_manga_app_flutter/ui/views/history/widgets/reading_history_item.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'history_viewmodel.dart';

class HistoryView extends StackedView<HistoryViewModel> {
  const HistoryView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HistoryViewModel viewModel,
    Widget? child,
  ) {
    return viewModel.isBusy && viewModel.readingHistories.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : LayoutBuilder(
            builder: (context, constraints) {
              final itemHeight = constraints.maxHeight / 5;

              return NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification.metrics.pixels >=
                      notification.metrics.maxScrollExtent - 200) {
                    viewModel.loadMore();
                  }
                  return false;
                },
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 8),
                  itemCount: viewModel.readingHistories.length +
                      (viewModel.hasMore ? 1 : 0),
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    if (index < viewModel.readingHistories.length) {
                      final history = viewModel.readingHistories[index];
                      return SizedBox(
                        height: itemHeight, // 👈 Set chiều cao cố định
                        child: ReadingHistoryItem(
                          readingHistory: history,
                          onTap: () {
                            // TODO: resume đọc
                          },
                        ),
                      );
                    }

                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  },
                ),
              );
            },
          );
  }

  @override
  HistoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HistoryViewModel();

  @override
  void onViewModelReady(HistoryViewModel viewModel) {
    viewModel.loadInitial();
    super.onViewModelReady(viewModel);
  }
}
