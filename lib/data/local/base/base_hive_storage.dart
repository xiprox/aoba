import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'storage_public_interface.dart';

abstract class BaseHiveStorage implements StoragePublicInterface {
  @protected
  late Box box;

  @protected
  String get boxName;

  @override
  Future init() async {
    box = await Hive.openBox(boxName);
  }

  @override
  Future clear() async {
    await box.clear();
    // Box gets closed when cleared so call init to re-open it.
    // Failing to re-open after clearing a box will cause writes to not be
    // persisted.
    await init();
  }

  @override
  Future close() {
    return box.close();
  }
}
