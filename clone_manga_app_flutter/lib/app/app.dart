import 'package:clone_manga_app_flutter/data/datasource/local/auth_local_datasource_impl.dart';
import 'package:clone_manga_app_flutter/data/datasource/remote/firebase/auth_remote_datasource_impl.dart';
import 'package:clone_manga_app_flutter/data/datasource/remote/firebase/comic_firebase_datasource_impl.dart';
import 'package:clone_manga_app_flutter/data/mapper/comic_mapper.dart';
import 'package:clone_manga_app_flutter/data/mapper/user_mapper.dart';
import 'package:clone_manga_app_flutter/data/repositories/auth_repository_impl.dart';
import 'package:clone_manga_app_flutter/data/repositories/comic_repository_impl.dart';
import 'package:clone_manga_app_flutter/domain/usecases/get_chapters_by_comic_id_usecase.dart';
import 'package:clone_manga_app_flutter/domain/usecases/get_comic_by_id_usecase.dart';
import 'package:clone_manga_app_flutter/domain/usecases/get_comics_paging_usecase.dart';
import 'package:clone_manga_app_flutter/domain/usecases/get_current_user_usecase.dart';
import 'package:clone_manga_app_flutter/domain/usecases/login_with_google_usecase.dart';
import 'package:clone_manga_app_flutter/domain/usecases/login_with_username_usecase.dart';
import 'package:clone_manga_app_flutter/domain/usecases/logout_usecase.dart';
import 'package:clone_manga_app_flutter/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:clone_manga_app_flutter/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:clone_manga_app_flutter/ui/views/comic_detail/comic_detail_view.dart';
import 'package:clone_manga_app_flutter/ui/views/home/home_view.dart';
import 'package:clone_manga_app_flutter/ui/views/home/home_viewmodel.dart';
import 'package:clone_manga_app_flutter/ui/views/main/states/favorite_state.dart';
import 'package:clone_manga_app_flutter/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:clone_manga_app_flutter/ui/views/splash/splash_view.dart';

import '../data/datasource/local/auth_local_datasource.dart';
import '../data/datasource/remote/firebase/auth_remote_datasource.dart';
import '../data/datasource/remote/firebase/comic_remote_datasource.dart';
import '../data/mapper/chapter_mapper.dart';
import '../data/repositories/chapter_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/chapter_repository.dart';
import '../domain/repositories/comic_repository.dart';
import 'package:clone_manga_app_flutter/ui/views/search/search_view.dart';
import 'package:clone_manga_app_flutter/ui/views/search/search_view.dart';
import 'package:clone_manga_app_flutter/ui/views/main/main_view.dart';
import 'package:clone_manga_app_flutter/ui/views/favorite/favorite_view.dart';
import 'package:clone_manga_app_flutter/ui/views/login/login_view.dart';

import '../domain/usecases/register_usecase.dart';
import 'package:clone_manga_app_flutter/ui/views/register/register_view.dart';
import 'package:clone_manga_app_flutter/ui/views/chapter_detail/chapter_detail_view.dart';
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
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),

    // DATA
    LazySingleton(
        classType: ComicFirebaseDatasource, asType: ComicRemoteDatasource),
    LazySingleton(classType: ComicMapper),
    LazySingleton(classType: ChapterMapper),
    LazySingleton(classType: UserMapper),
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
      classType: AuthLocalDatasourceImpl,
      asType: AuthLocalDatasource,
    ),
    LazySingleton(
      classType: AuthRemoteDatasourceImpl,
      asType: AuthRemoteDatasource,
    ),

    // DOMAIN
    Factory(classType: GetComicsPagingUseCase),
    Factory(classType: GetComicByIdUseCase),
    Factory(classType: GetChaptersByComicIdUseCase),
    Factory(classType: GetCurrentUserUseCase),
    Factory(classType: LoginWithGoogleUseCase),
    Factory(classType: LoginWithUsernameUseCase),
    Factory(classType: LogoutUseCase),
    Factory(classType: RegisterUseCase),

    //UI
    LazySingleton(classType: FavoriteState)
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
