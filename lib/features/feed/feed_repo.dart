import 'package:aoba/arch/graphql_repo.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/data/remote/client/gql_request.dart';
import 'package:graphql/client.dart';

import 'feed.gql.dart';

abstract class FeedRepo {
  Future<Resource<Query$FetchFeed>> getFeed({
    required int page,
    required bool followingOnly,
  });
}

class FeedRepoImpl extends GraphqlRepo implements FeedRepo {
  @override
  Future<Resource<Query$FetchFeed>> getFeed({
    required int page,
    required bool followingOnly,
  }) async {
    return GqlRequest.query(
      QueryOptions(
        document: documentNodeQueryFetchFeed,
        variables: {
          'isFollowing': followingOnly,
          'page': page,
        },
      ),
      accessToken: accessToken,
      fromJson: Query$FetchFeed.fromJson,
    );
  }
}
