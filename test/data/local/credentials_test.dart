import 'package:aoba/services/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../testing/files/hive.dart';

Future<Credentials> _createInstance() async {
  final instance = CredentialsImpl();
  await instance.init();
  await instance.clear();
  return instance;
}

void main() async {
  setUpAll(() async {
    await HiveTestUtils.setUp();
  });

  tearDownAll(() async {
    await HiveTestUtils.cleanUp();
  });

  test('Returns correct value for isAuthenticated', () async {
    final credentials = await _createInstance();
    expect(credentials.isAuthenticated, false);
    credentials.accessToken = 'test_access_token';
    expect(credentials.isAuthenticated, true);
    await credentials.close();
  });

  group('Reads and writes correctly:', () {
    test('access token', () async {
      final credentials = await _createInstance();
      const value = 'test_token';
      credentials.accessToken = value;
      expect(credentials.accessToken, value);
      await credentials.close();
    });
  });
}
