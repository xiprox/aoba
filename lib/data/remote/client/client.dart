import 'package:aoba/data/remote/gql/queries/in_progress_media.graphql.dart';
import 'package:aoba/services/services.dart';
import 'package:graphql/client.dart';

class Client {
  final _httpLink = HttpLink(
    'https://graphql.anilist.co',
    defaultHeaders: {
      'Accept': 'application/json',
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

  Future<Query$FetchMedia$Media?> getBakemonogatari() async {
    final response = await client.query(
      QueryOptions(
        document: documentNodeQueryFetchMedia,
        variables: const {'id': 5081},
      ),
    );
    if (response.data != null) {
      return Query$FetchMedia$Media.fromJson(response.data!['Media']);
    }
    return null;
  }
}
