// ===== REPOSITORIES (interface only) =====
export 'repositories/auth_repository.dart';
export 'repositories/comic_repository.dart';
export 'repositories/chapter_repository.dart';
export 'repositories/reading_history_repository.dart';

// ===== USECASES =====
export 'usecases/get_comics_paging_usecase.dart';
export 'usecases/get_comic_by_id_usecase.dart';
export 'usecases/get_chapters_by_comic_id_usecase.dart';
export 'usecases/get_current_user_usecase.dart';
export 'usecases/login_with_google_usecase.dart';
export 'usecases/login_with_username_usecase.dart';
export 'usecases/logout_usecase.dart';
export 'usecases/register_usecase.dart';
export 'usecases/save_reading_history_usecase.dart';
export 'usecases/get_reading_histories_usecase.dart';
