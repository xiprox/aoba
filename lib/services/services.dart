import 'dart:io';

import 'package:aoba/data/repo/user_info/user_info_repo.dart';
import 'package:aoba/features/feed/data/feed_repo.dart';
import 'package:aoba/features/lists/data/lists_repo.dart';
import 'package:aoba/features/profile/data/profile_repo.dart';
import 'package:aoba/features/quick_update/data/quick_update_repo.dart';
import 'package:get_it/get_it.dart';

import 'exported_services.dart';
export 'exported_services.dart';

final get = GetIt.instance.get;

Logger get log => get<Logger>();

final _testing = Platform.environment.containsKey('FLUTTER_TEST');

final client = Client();

class Services {
  static bool initialized = false;

  static init({bool isRootIsolate = true}) async {
    if (initialized) return;
    if (_testing) {
      await _initTesting();
    } else {
      await _init(isRootIsolate);
    }
    initialized = true;
  }

  static Future _init(bool isRootIsolate) async {
    final getIt = GetIt.instance;

    getIt.registerSingleton<Logger>(LoggerImpl());

    getIt.registerSingleton<PingService>(PingServiceImpl());

    final prefs = PreferencesImpl();
    await prefs.init();
    getIt.registerSingleton<Preferences>(prefs);

    final credentials = CredentialsImpl();
    await credentials.init();
    getIt.registerSingleton<Credentials>(credentials);

    final database = DatabaseImpl();
    await database.init();
    getIt.registerSingleton<Database>(database);

    getIt.registerLazySingleton<AuthService>(() => AuthServiceImpl());

    getIt.registerSingleton<Client>(client);

    // Repos
    getIt.registerSingleton<UserInfoRepo>(UserInfoRepoImpl());
    getIt.registerSingleton<FeedRepo>(FeedRepoImpl());
    getIt.registerSingleton<ProfileRepo>(ProfileRepoImpl());
    getIt.registerSingleton<QuickUpdateRepo>(QuickUpdateRepoImpl());
    getIt.registerFactory<ListsRepo>(() => ListsRepoImpl());

    getIt.registerSingleton(AppRouter(authGuard: AuthGuard()));
  }

  static Future _initTesting() async {
    return _init(true);
  }
}
