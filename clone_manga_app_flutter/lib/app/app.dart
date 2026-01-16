import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:clone_manga_app_flutter/data/data.dart';
import 'package:clone_manga_app_flutter/domain/domain.dart';
import 'package:clone_manga_app_flutter/ui/ui.dart';
import 'package:clone_manga_app_flutter/ui/views/history/history_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: SplashView),
    MaterialRoute(page: ComicDetailView),
    MaterialRoute(page: SearchView),
    MaterialRoute(page: MainView),
    MaterialRoute(page: FavoriteView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: ChapterDetailView),
    MaterialRoute(page: HistoryView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),

    // DATA.Mapper
    LazySingleton(classType: ComicMapper),
    LazySingleton(classType: ChapterMapper),
    LazySingleton(classType: UserMapper),

    //Data.repository
    LazySingleton(classType: ComicRepositoryImpl, asType: ComicRepository),
    LazySingleton(
      classType: ChapterRepositoryImpl,
      asType: ChapterRepository,
    ),
    LazySingleton(
      classType: AuthRepositoryImpl,
      asType: AuthRepository,
    ),
    LazySingleton(
      classType: ReadingHistoryRepositoryImpl,
      asType: ReadingHistoryRepository,
    ),
    //Data.datasource
    LazySingleton(
        classType: ComicFirebaseDatasource, asType: ComicRemoteDatasource),
    LazySingleton(
      classType: AuthLocalDatasourceImpl,
      asType: AuthLocalDatasource,
    ),
    LazySingleton(
      classType: AuthRemoteDatasourceImpl,
      asType: AuthRemoteDatasource,
    ),
    LazySingleton(
      classType: ReadingHistoryLocalDatasourceImpl,
      asType: ReadingHistoryLocalDatasource,
    ),

    // DOMAIN.usecase
    Factory(classType: GetComicsPagingUseCase),
    Factory(classType: GetComicByIdUseCase),
    Factory(classType: GetChaptersByComicIdUseCase),
    Factory(classType: GetCurrentUserUseCase),
    Factory(classType: LoginWithGoogleUseCase),
    Factory(classType: LoginWithUsernameUseCase),
    Factory(classType: LogoutUseCase),
    Factory(classType: RegisterUseCase),
    Factory(classType: SaveReadingHistoryUseCase),
    Factory(classType: GetReadingHistoriesUseCase),
    //UI
    LazySingleton(classType: FavoriteState),
    LazySingleton(classType: ReadingHistoryState)
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
