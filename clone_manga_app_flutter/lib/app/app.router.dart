// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clone_manga_app_flutter/domain/entities/chapter.dart' as _i4;
import 'package:clone_manga_app_flutter/ui/ui.dart' as _i2;
import 'package:flutter/material.dart' as _i3;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i5;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const splashView = '/splash-view';

  static const comicDetailView = '/comic-detail-view';

  static const searchView = '/search-view';

  static const mainView = '/main-view';

  static const favoriteView = '/favorite-view';

  static const loginView = '/login-view';

  static const registerView = '/register-view';

  static const chapterDetailView = '/chapter-detail-view';

  static const historyView = '/history-view';

  static const all = <String>{
    homeView,
    startupView,
    splashView,
    comicDetailView,
    searchView,
    mainView,
    favoriteView,
    loginView,
    registerView,
    chapterDetailView,
    historyView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.comicDetailView,
      page: _i2.ComicDetailView,
    ),
    _i1.RouteDef(
      Routes.searchView,
      page: _i2.SearchView,
    ),
    _i1.RouteDef(
      Routes.mainView,
      page: _i2.MainView,
    ),
    _i1.RouteDef(
      Routes.favoriteView,
      page: _i2.FavoriteView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i2.LoginView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i2.RegisterView,
    ),
    _i1.RouteDef(
      Routes.chapterDetailView,
      page: _i2.ChapterDetailView,
    ),
    _i1.RouteDef(
      Routes.historyView,
      page: _i2.HistoryView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i3.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i2.StartupView: (data) {
      return _i3.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i2.SplashView: (data) {
      return _i3.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
      );
    },
    _i2.ComicDetailView: (data) {
      final args = data.getArgs<ComicDetailViewArguments>(nullOk: false);
      return _i3.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i2.ComicDetailView(key: args.key, comicId: args.comicId),
        settings: data,
      );
    },
    _i2.SearchView: (data) {
      return _i3.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SearchView(),
        settings: data,
      );
    },
    _i2.MainView: (data) {
      return _i3.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.MainView(),
        settings: data,
      );
    },
    _i2.FavoriteView: (data) {
      return _i3.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.FavoriteView(),
        settings: data,
      );
    },
    _i2.LoginView: (data) {
      return _i3.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.LoginView(),
        settings: data,
      );
    },
    _i2.RegisterView: (data) {
      return _i3.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.RegisterView(),
        settings: data,
      );
    },
    _i2.ChapterDetailView: (data) {
      final args = data.getArgs<ChapterDetailViewArguments>(nullOk: false);
      return _i3.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i2.ChapterDetailView(key: args.key, chapter: args.chapter),
        settings: data,
      );
    },
    _i2.HistoryView: (data) {
      return _i3.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HistoryView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ComicDetailViewArguments {
  const ComicDetailViewArguments({
    this.key,
    required this.comicId,
  });

  final _i3.Key? key;

  final String comicId;

  @override
  String toString() {
    return '{"key": "$key", "comicId": "$comicId"}';
  }

  @override
  bool operator ==(covariant ComicDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.comicId == comicId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ comicId.hashCode;
  }
}

class ChapterDetailViewArguments {
  const ChapterDetailViewArguments({
    this.key,
    required this.chapter,
  });

  final _i3.Key? key;

  final _i4.Chapter chapter;

  @override
  String toString() {
    return '{"key": "$key", "chapter": "$chapter"}';
  }

  @override
  bool operator ==(covariant ChapterDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.chapter == chapter;
  }

  @override
  int get hashCode {
    return key.hashCode ^ chapter.hashCode;
  }
}

extension NavigatorStateExtension on _i5.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToComicDetailView({
    _i3.Key? key,
    required String comicId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.comicDetailView,
        arguments: ComicDetailViewArguments(key: key, comicId: comicId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.searchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFavoriteView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.favoriteView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChapterDetailView({
    _i3.Key? key,
    required _i4.Chapter chapter,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.chapterDetailView,
        arguments: ChapterDetailViewArguments(key: key, chapter: chapter),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.historyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithComicDetailView({
    _i3.Key? key,
    required String comicId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.comicDetailView,
        arguments: ComicDetailViewArguments(key: key, comicId: comicId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.searchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFavoriteView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.favoriteView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChapterDetailView({
    _i3.Key? key,
    required _i4.Chapter chapter,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.chapterDetailView,
        arguments: ChapterDetailViewArguments(key: key, chapter: chapter),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.historyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
