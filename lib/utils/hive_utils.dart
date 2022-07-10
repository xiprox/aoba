import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';

// Unique IDs for types registered with Hive.
class HiveTypes {
  static const example = 0;
}

class HiveUtils {
  static Future init() async {
    await Hive.initFlutter();
    _registerAdapters();
  }

  /// Initializes Hive for tests.
  static Future initTest() async {
    const path = 'test/resources/hive';
    final dir = Directory(path);
    if (dir.existsSync()) {
      await dir.delete(recursive: true);
    }
    Hive.init(path);
    _registerAdapters();
  }

  static _registerAdapters() {
    // Register future adapters here.
  }
}
