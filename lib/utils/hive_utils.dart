import 'package:hive_flutter/hive_flutter.dart';

// Unique IDs for types registered with Hive.
class HiveTypes {
  static const example = 0;
}

class HiveUtils {
  static Future init() async {
    await Hive.initFlutter();
    registerAdapters();
  }

  static registerAdapters() {
    // Register future adapters here.
  }
}
