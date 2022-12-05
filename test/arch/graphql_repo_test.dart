import 'package:aoba/arch/graphql_repo.dart';
import 'package:aoba/services/fakes.dart';
import 'package:aoba/services/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../testing/common.dart';

class SubjectGraphqlRepo extends GraphqlRepo {}

void main() {
  setUp(() {
    GetIt.I.reregisterSingleton<Credentials>(FakeCredentials());
  });

  testWidgets(
    'accessToken returns the value from $Credentials',
    (tester) async {
      const value = 'sometoken';
      get<Credentials>().accessToken = value;
      // ignore: invalid_use_of_protected_member
      expect(SubjectGraphqlRepo().accessToken, value);
    },
  );
}
