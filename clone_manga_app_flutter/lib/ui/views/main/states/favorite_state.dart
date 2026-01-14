import 'package:flutter/foundation.dart';

class FavoriteState extends ChangeNotifier {
  final List<String> _names = [];

  List<String> get names => List.unmodifiable(_names);

  void add(String name) {
    _names.add(name);
    notifyListeners();
  }

  int get count => _names.length;
}
