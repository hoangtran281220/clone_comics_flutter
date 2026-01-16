import 'package:clone_manga_app_flutter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:clone_manga_app_flutter/app/app.bottomsheets.dart';
import 'package:clone_manga_app_flutter/app/app.dialogs.dart';
import 'package:clone_manga_app_flutter/app/app.locator.dart';
import 'package:clone_manga_app_flutter/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'domain/entities/reading_history.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setupLocator();

  await Hive.initFlutter();
  Hive.registerAdapter(ReadingHistoryAdapter());
  await Hive.openBox<ReadingHistory>('reading_history');

  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.splashView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
    );
  }
}
