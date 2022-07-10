import 'package:aoba/services/services.dart';
import 'package:aoba/utils/hive_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future init() async {
  await Executor().warmUp(log: kDebugMode);
  await IsolateInit.init(isRootIsolate: true);
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
    if (isRootIsolate) await HiveUtils.init();
    await Services.init(isRootIsolate: isRootIsolate);
    initialized = true;
  }
}
