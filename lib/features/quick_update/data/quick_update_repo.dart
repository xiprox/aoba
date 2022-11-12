import 'package:aoba/arch/graphql_repo.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/data/remote/client/gql_request.dart';
import 'package:graphql/client.dart';

import 'quick_update.graphql.dart';

abstract class QuickUpdateRepo {
  Future<Resource<Query$FetchQuickUpdate>> getEntries({required int userId});
}

class QuickUpdateRepoImpl extends GraphqlRepo implements QuickUpdateRepo {
  @override
  Future<Resource<Query$FetchQuickUpdate>> getEntries({
    required int userId,
  }) async {
    return GqlRequest.query(
      QueryOptions(
        document: documentNodeQueryFetchQuickUpdate,
        variables: {
          'userId': userId,
        },
      ),
      accessToken: accessToken,
      fromJson: Query$FetchQuickUpdate.fromJson,
    );
  }
}
