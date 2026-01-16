// ===== DATASOURCE =====
// local
export 'datasource/local/auth_local_datasource.dart';
export 'datasource/local/auth_local_datasource_impl.dart';
export 'datasource/local/reading_history_local_datasource.dart';
export 'datasource/local/reading_history_local_datasource_impl.dart';

// remote
export 'datasource/remote/firebase/auth_remote_datasource.dart';
export 'datasource/remote/firebase/auth_remote_datasource_impl.dart';
export 'datasource/remote/firebase/comic_remote_datasource.dart';
export 'datasource/remote/firebase/comic_firebase_datasource_impl.dart';

// ===== MAPPER =====
export 'mapper/comic_mapper.dart';
export 'mapper/chapter_mapper.dart';
export 'mapper/user_mapper.dart';

// ===== REPOSITORY IMPL =====
export 'repositories/auth_repository_impl.dart';
export 'repositories/comic_repository_impl.dart';
export 'repositories/chapter_repository_impl.dart';
export 'repositories/reading_history_repository_impl.dart';
