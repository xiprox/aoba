import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const accessToken = 'accessToken';
}

abstract class Credentials {
  Future clear();

  Future<String?> get accessToken;
  Future setAccessToken(String? value);

  Future<bool> get isAuthenticated;
}

class CredentialsImpl implements Credentials {
  final _storage = const FlutterSecureStorage();

  @override
  Future clear() async {
    await _storage.deleteAll();
  }

  @override
  Future<String?> get accessToken {
    return _storage.read(key: _Keys.accessToken);
  }

  @override
  Future setAccessToken(String? value) {
    return _storage.write(key: _Keys.accessToken, value: value);
  }

  @override
  Future<bool> get isAuthenticated async => (await accessToken) != null;
}
