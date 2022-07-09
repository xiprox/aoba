import 'dart:io';

import 'package:get_it/get_it.dart';

import 'exported_services.dart';
export 'exported_services.dart';

final get = GetIt.instance.get;

Logger get log => get<Logger>();

final _testing = Platform.environment.containsKey('FLUTTER_TEST');

class Services {
  static bool _initialized = false;

  static init() async {
    if (_initialized) return;
    if (_testing) {
      await _initTesting();
    } else {
      await _init();
    }
    _initialized = true;
  }

  static Future _init() async {
    final getIt = GetIt.instance;

    getIt.registerSingleton<Logger>(LoggerImpl());

    getIt.registerSingleton<Credentials>(CredentialsImpl());

    getIt.registerSingleton(AppRouter(authGuard: AuthGuard()));
  }

  static Future _initTesting() async {
    return _init();
  }
}
