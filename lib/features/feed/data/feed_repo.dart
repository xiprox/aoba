import 'package:aoba/arch/graphql_repo.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/data/remote/client/gql_request.dart';
import 'package:graphql/client.dart';

import 'feed.gql.dart';

typedef Feed = Query$FetchFeed;
typedef Activity = Query$FetchFeed$Page$activities;
typedef ListActivity = Query$FetchFeed$Page$activities$$ListActivity;
typedef TextActivity = Query$FetchFeed$Page$activities$$TextActivity;

abstract class FeedRepo {
  Future<Resource<Feed>> getFeed({
    required int page,
    required bool followingOnly,
    bool forceNetwork = false,
  });
}

class FeedRepoImpl extends GraphqlRepo implements FeedRepo {
  @override
  Future<Resource<Feed>> getFeed({
    required int page,
    required bool followingOnly,
    bool forceNetwork = false,
  }) async {
    return GqlRequest.query(
      QueryOptions(
        document: documentNodeQueryFetchFeed,
        variables: {
          'isFollowing': followingOnly,
          'page': page,
        },
        fetchPolicy: forceNetwork ? FetchPolicy.networkOnly : null,
      ),
      accessToken: accessToken,
      fromJson: Feed.fromJson,
    );
  }
}
