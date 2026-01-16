import 'package:flutter/material.dart';

class ComicDescriptionOverlay extends StatelessWidget {
  const ComicDescriptionOverlay({
    super.key,
    required this.description,
    required this.isExpanded,
    required this.onToggle,
    this.collapsedLines = 2,
    this.maxHeightRatio = 0.75,
  });

  final String description;
  final bool isExpanded;
  final VoidCallback onToggle;
  final int collapsedLines;
  final double maxHeightRatio;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = constraints.maxHeight * maxHeightRatio;

        return Align(
          alignment: Alignment.bottomLeft,
          child: isExpanded
              ? ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: maxHeight, // 👈 Giới hạn chiều cao tối đa
                  ),
                  child: IntrinsicHeight(
                    // 👈 Cho phép chiếm không gian vừa đủ
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          // 👈 Cho phép scroll nếu quá dài
                          child: Scrollbar(
                            thumbVisibility: true,
                            child: SingleChildScrollView(
                              child: Text(
                                description,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: onToggle,
                          child: Text(
                            'Thu gọn',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.85),
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: onToggle,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        maxLines: collapsedLines,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Xem thêm',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
