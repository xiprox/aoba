import 'package:aoba/arch/graphql_repo.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/data/remote/client/gql_request.dart';
import 'package:graphql/client.dart';

import 'quick_update.gql.dart';

abstract class QuickUpdateRepo {
  Future<Resource<Query$FetchQuickUpdate>> getEntries({
    required int userId,
    bool forceNetwork,
  });
  Future<Resource> updateEntry({required int mediaId, required int progress});
}

class QuickUpdateRepoImpl extends GraphqlRepo implements QuickUpdateRepo {
  @override
  Future<Resource<Query$FetchQuickUpdate>> getEntries({
    required int userId,
    bool forceNetwork = false,
  }) async {
    return GqlRequest.query(
      QueryOptions(
        document: documentNodeQueryFetchQuickUpdate,
        variables: {
          'userId': userId,
        },
        fetchPolicy: forceNetwork ? FetchPolicy.networkOnly : null,
      ),
      accessToken: accessToken,
      fromJson: Query$FetchQuickUpdate.fromJson,
    );
  }

  @override
  Future<Resource> updateEntry({required int mediaId, required int progress}) {
    return GqlRequest.mutation(
      MutationOptions(
        document: documentNodeMutationUpdateEntry,
        variables: {
          'mediaId': mediaId,
          'progress': progress,
        },
      ),
      accessToken: accessToken,
      fromJson: Mutation$UpdateEntry.fromJson,
    );
  }
}
