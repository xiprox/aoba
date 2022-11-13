import 'package:aoba/services/services.dart';
import 'package:graphql/client.dart';

class Client {
  final _httpLink = HttpLink(
    'https://graphql.anilist.co',
    defaultHeaders: {
      'Accept': 'application/json',
      'User-Agent': 'Aoba',
    },
  );

  late final _authLink = AuthLink(
    getToken: () async => 'Bearer ${get<Credentials>().accessToken}',
  );
  late final _link = _authLink.concat(_httpLink);

  late final client = GraphQLClient(
    cache: GraphQLCache(),
    link: _link,
  );
}
