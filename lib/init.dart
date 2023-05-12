import 'package:aoba/services/services.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'licenses.dart';

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsolateInit.init(isRootIsolate: true);
  Licenses.init();
  return runApp(const App());
}

class IsolateInit {
  /// This will be false for each isolate as memory isn't shared.
  static bool initialized = false;

  static Future init({
    /// Whether we are initializing the root/main/UI isolate.
    bool isRootIsolate = false,
  }) async {
    if (initialized) return;
    await Services.init(isRootIsolate: isRootIsolate);
    initialized = true;
  }
}
