import 'package:cloud_firestore/cloud_firestore.dart';

import 'paging_cursor.dart';

class PagedResult<T> {
  final List<T> items;
  final PagingCursor? nextCursor;

  const PagedResult({
    required this.items,
    this.nextCursor,
  });
}
