import 'package:aoba/arch/graphql_repo.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/data/remote/client/gql_request.dart';
import 'package:graphql/client.dart';

import 'user_info.gql.dart';

abstract class UserInfoRepo {
  Future<Resource<Query$FetchBasicUserInfo>> getBasicUserInfo();
}

class UserInfoRepoImpl extends GraphqlRepo implements UserInfoRepo {
  @override
  Future<Resource<Query$FetchBasicUserInfo>> getBasicUserInfo() async {
    return GqlRequest.query(
      QueryOptions(
        document: documentNodeQueryFetchBasicUserInfo,
        fetchPolicy: FetchPolicy.networkOnly,
      ),
      accessToken: accessToken,
      fromJson: Query$FetchBasicUserInfo.fromJson,
    );
  }
}
