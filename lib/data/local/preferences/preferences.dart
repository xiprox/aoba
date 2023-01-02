import 'package:aoba/data/local/base/storage_public_interface.dart';
import 'package:isar/isar.dart';

import 'schema/schema.dart';

abstract class Preferences implements StoragePublicInterface {
  Prefs get();
  void update(Function(Prefs it) update);
}

class PreferencesImpl implements Preferences {
  late Isar _isar;

  @override
  Future init() async {
    _isar = await Isar.open([PrefsSchema], name: 'preferences');
  }

  @override
  Future clear() => _isar.clear();

  @override
  Future close() => _isar.close();

  @override
  Prefs get() {
    final existing = _isar.prefs.getSync(kPrefsId);
    if (existing != null) {
      return existing;
    } else {
      final prefs = Prefs();
      _isar.writeTxnSync(() => _isar.prefs.putSync(prefs));
      return prefs;
    }
  }

  @override
  update(Function(Prefs) update) async {
    _isar.writeTxnSync(() {
      update(get());
      _isar.prefs.putSync(get());
    });
  }
}
