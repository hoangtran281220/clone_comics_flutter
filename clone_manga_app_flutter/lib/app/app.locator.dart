// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../data/datasource/local/auth_local_datasource.dart';
import '../data/datasource/local/auth_local_datasource_impl.dart';
import '../data/datasource/remote/firebase/auth_remote_datasource.dart';
import '../data/datasource/remote/firebase/auth_remote_datasource_impl.dart';
import '../data/datasource/remote/firebase/comic_firebase_datasource_impl.dart';
import '../data/datasource/remote/firebase/comic_remote_datasource.dart';
import '../data/mapper/chapter_mapper.dart';
import '../data/mapper/comic_mapper.dart';
import '../data/mapper/user_mapper.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../data/repositories/chapter_repository_impl.dart';
import '../data/repositories/comic_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/chapter_repository.dart';
import '../domain/repositories/comic_repository.dart';
import '../domain/usecases/get_chapters_by_comic_id_usecase.dart';
import '../domain/usecases/get_comic_by_id_usecase.dart';
import '../domain/usecases/get_comics_paging_usecase.dart';
import '../domain/usecases/get_current_user_usecase.dart';
import '../domain/usecases/login_with_google_usecase.dart';
import '../domain/usecases/login_with_username_usecase.dart';
import '../domain/usecases/logout_usecase.dart';
import '../domain/usecases/register_usecase.dart';
import '../ui/views/main/states/favorite_state.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton<ComicRemoteDatasource>(
      () => ComicFirebaseDatasource());
  locator.registerLazySingleton(() => ComicMapper());
  locator.registerLazySingleton(() => ChapterMapper());
  locator.registerLazySingleton(() => UserMapper());
  locator.registerLazySingleton<ComicRepository>(() => ComicRepositoryImpl());
  locator
      .registerLazySingleton<ChapterRepository>(() => ChapterRepositoryImpl());
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  locator.registerLazySingleton<AuthLocalDatasource>(
      () => AuthLocalDatasourceImpl());
  locator.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl());
  locator.registerFactory(() => GetComicsPagingUseCase());
  locator.registerFactory(() => GetComicByIdUseCase());
  locator.registerFactory(() => GetChaptersByComicIdUseCase());
  locator.registerFactory(() => GetCurrentUserUseCase());
  locator.registerFactory(() => LoginWithGoogleUseCase());
  locator.registerFactory(() => LoginWithUsernameUseCase());
  locator.registerFactory(() => LogoutUseCase());
  locator.registerFactory(() => RegisterUseCase());
  locator.registerLazySingleton(() => FavoriteState());
}
