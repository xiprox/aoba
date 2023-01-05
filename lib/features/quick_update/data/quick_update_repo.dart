import 'package:aoba/data/model/resource.dart';
import 'package:aoba/data/remote/client/gql_request.dart';
import 'package:collection/collection.dart';
import 'package:flextensions/flextensions.dart';
import 'package:graphql/client.dart';

import 'quick_update.gql.dart';

typedef QuickUpdateEntry = Query$FetchQuickUpdate$Page$entries;
typedef QuickUpdateResult = Mutation$UpdateEntry$SaveMediaListEntry;

abstract class QuickUpdateRepo {
  Future<Resource<List<QuickUpdateEntry>>> getEntries({
    required int userId,
    bool forceNetwork,
  });
  Future<Resource<QuickUpdateResult>> updateEntry(
      {required int mediaId, required int progress});
}

class QuickUpdateRepoImpl implements QuickUpdateRepo {
  @override
  Future<Resource<List<QuickUpdateEntry>>> getEntries({
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
      fromJson: (json) {
        return Query$FetchQuickUpdate$Page.fromJson(json['Page'])
            .entries
            .orEmpty()
            .whereNotNull()
            .toList();
      },
    );
  }

  @override
  Future<Resource<QuickUpdateResult>> updateEntry(
      {required int mediaId, required int progress}) {
    return GqlRequest.mutation(
      MutationOptions(
        document: documentNodeMutationUpdateEntry,
        variables: {
          'mediaId': mediaId,
          'progress': progress,
        },
      ),
      fromJson: (json) =>
          QuickUpdateResult.fromJson(json['SaveMediaListEntry']),
    );
  }
}
