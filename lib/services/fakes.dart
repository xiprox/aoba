import 'package:aoba/data/local/credentials.dart';

class FakeCredentials implements Credentials {
  @override
  String? accessToken;

  @override
  Future clear() async {}

  @override
  Future init() async {}

  @override
  Future close() async {}

  @override
  bool isAuthenticated = false;
}
