import 'package:aoba/data/local/base/storage_public_interface.dart';
import 'package:isar/isar.dart';

import 'schema.dart';

abstract class Credentials implements StoragePublicInterface {
  String? get accessToken;
  bool get isAuthenticated;

  void update(Function(Creds it) update);
}

class CredentialsImpl implements Credentials {
  late Isar _isar;

  @override
  Future init() async {
    _isar = await Isar.open([CredsSchema], name: 'credentials');
  }

  @override
  Future clear() => _isar.writeTxn(() => _isar.clear());

  @override
  Future close() => _isar.close();

  Creds _get() {
    final existing = _isar.creds.getSync(kCredentialsId);
    if (existing != null) {
      return existing;
    } else {
      final creds = Creds();
      _isar.writeTxnSync(() => _isar.creds.putSync(creds));
      return creds;
    }
  }

  @override
  String? get accessToken => _get().accessToken;

  @override
  bool get isAuthenticated => _get().accessToken != null;

  @override
  update(Function(Creds) update) async {
    final instance = _get();
    _isar.writeTxnSync(() {
      update(instance);
      _isar.creds.putSync(instance);
    });
  }
}
