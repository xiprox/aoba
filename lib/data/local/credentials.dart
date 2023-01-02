import 'dart:async';

import 'base/base_hive_storage.dart';
import 'base/storage_public_interface.dart';

abstract class _Keys {
  static const accessToken = 'accessToken';
}

abstract class Credentials implements StoragePublicInterface {
  String? get accessToken;
  set accessToken(String? value);

  bool get isAuthenticated;
}

class CredentialsImpl extends BaseHiveStorage implements Credentials {
  @override
  String get boxName => 'credentials';

  @override
  String? get accessToken => box.get(_Keys.accessToken);
  @override
  set accessToken(String? value) => box.put(_Keys.accessToken, value);

  @override
  bool get isAuthenticated => accessToken != null;
}

/// An in-memory [Credentials] implementation to be used in Isolates.
class CredentialsInIsolate implements Credentials {
  String? _token;

  @override
  Future init() async {}

  @override
  Future clear() async {}

  @override
  Future close() async {}

  @override
  String? get accessToken => _token;

  @override
  set accessToken(String? value) => _token = value;

  @override
  bool get isAuthenticated => accessToken != null;
}
