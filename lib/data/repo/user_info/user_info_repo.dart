import 'package:aoba/arch/graphql_repo.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/data/remote/client/gql_request.dart';
import 'package:graphql/client.dart';

import 'user_info.gql.dart';

typedef BasicUserInfo = Query$FetchBasicUserInfo$Viewer;
typedef BasicUserInfoAvatar = Query$FetchBasicUserInfo$Viewer$avatar;
typedef BasicUserInfoOptions = Query$FetchBasicUserInfo$Viewer$options;

abstract class UserInfoRepo {
  Future<Resource<BasicUserInfo>> getBasicUserInfo();
}

class UserInfoRepoImpl extends GraphqlRepo implements UserInfoRepo {
  @override
  Future<Resource<BasicUserInfo>> getBasicUserInfo() async {
    return GqlRequest.query(
      QueryOptions(
        document: documentNodeQueryFetchBasicUserInfo,
        fetchPolicy: FetchPolicy.networkOnly,
      ),
      accessToken: accessToken,
      fromJson: (json) => BasicUserInfo.fromJson(json['Viewer']),
    );
  }
}
