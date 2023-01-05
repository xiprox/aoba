import 'package:isar/isar.dart';

part 'schema.g.dart';

const kCredentialsId = 1;

@collection
class Creds {
  Id get id => kCredentialsId;

  String? accessToken;
}
