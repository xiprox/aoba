import 'package:aoba/data/model/resource.dart';
import 'package:aoba/data/remote/client/gql_request.dart';
import 'package:graphql/client.dart';

import 'profile.gql.dart';

typedef Feed = Query$FetchFeed;
typedef Activity = Query$FetchFeed$Page$activities;
typedef ListActivity = Query$FetchFeed$Page$activities$$ListActivity;
typedef TextActivity = Query$FetchFeed$Page$activities$$TextActivity;
typedef MessageActivity = Query$FetchFeed$Page$activities$$MessageActivity;

typedef UserQuery = Query$FetchInfo;
typedef User = Query$FetchInfo$User;

abstract class ProfileRepo {
  Future<Resource<User>> getInfo({required int userId});
  Future<Resource<Feed>> getFeed({required int userId, required int page});
}

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<Resource<User>> getInfo({required int userId}) {
    return GqlRequest.query(
      QueryOptions(
        document: documentNodeQueryFetchInfo,
        variables: {
          'userId': userId,
        },
      ),
      fromJson: (json) => User.fromJson(json['User']),
    );
  }

  @override
  Future<Resource<Feed>> getFeed({
    required int userId,
    required int page,
  }) async {
    return GqlRequest.query(
      QueryOptions(
        document: documentNodeQueryFetchFeed,
        variables: {
          'userId': userId,
          'page': page,
        },
      ),
      fromJson: Feed.fromJson,
    );
  }
}
