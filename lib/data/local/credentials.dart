import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';

abstract class _Keys {
  static const accessToken = 'accessToken';
}

abstract class Credentials {
  Future init();
  Future clear();

  String? get accessToken;
  set accessToken(String? value);

  bool get isAuthenticated;
}

class CredentialsImpl implements Credentials {
  late Box _box;

  @override
  Future init() async {
    _box = await Hive.openBox('credentials');
  }

  @override
  Future clear() async {
    await _box.clear();
    // Box gets closed when cleared so call init to re-open it.
    // Failing to re-open after clearing a box will cause writes to not be
    // persisted.
    await init();
  }

  @override
  String? get accessToken => _box.get(_Keys.accessToken);
  @override
  set accessToken(String? value) => _box.put(_Keys.accessToken, value);

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
  String? get accessToken => _token;

  @override
  set accessToken(String? value) => _token = value;

  @override
  bool get isAuthenticated => accessToken != null;
}
