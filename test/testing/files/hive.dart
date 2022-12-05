import 'dart:io';

import 'package:aoba/utils/hive_utils.dart';
import 'package:hive/hive.dart';

const _kPath = 'test/temp/hive';

class HiveTestUtils {
  /// Initializes Hive for tests.
  static Future setUp() async {
    await cleanUp();
    Hive.init(_kPath);
    HiveUtils.registerAdapters();
  }

  /// Cleans up Hive related files.
  static Future cleanUp() async {
    final dir = Directory(_kPath);
    if (dir.existsSync()) {
      await dir.delete(recursive: true);
    }
  }
}
