import 'package:aoba/arch/graphql_repo.dart';
import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/data/remote/client/gql_request.dart';
import 'package:collection/collection.dart';
import 'package:graphql/client.dart';

import 'lists.gql.dart';

typedef ListsData = Query$FetchData$MediaListCollection;
typedef MediaList = Query$FetchData$MediaListCollection$lists;
typedef MediaListEntry = Fragment$mediaListEntry;

int _sortListNames(List<String?> order, String? a, String? b) {
  final name1 = a ?? '';
  final name2 = b ?? '';
  final index1 = order.indexOf(name1);
  final index2 = order.indexOf(name2);
  if (index1 != -1 && index2 != -1) {
    return index1.compareTo(index2);
  } else if (index1 != -1 && index2 == -1) {
    return -1;
  } else if (index1 == -1 && index2 != -1) {
    return 1;
  } else {
    return 0;
  }
}

abstract class ListsRepo {
  Future<Resource<ListsData>> getData({
    required int userId,
    required MediaType type,
  });
}

class ListsRepoImpl extends GraphqlRepo implements ListsRepo {
  @override
  Future<Resource<ListsData>> getData({
    required int userId,
    required MediaType type,
  }) async {
    final result = await GqlRequest.query(
      QueryOptions(
        document: documentNodeQueryFetchData,
        variables: {
          'userId': userId,
          'type': type.name,
        },
      ),
      accessToken: accessToken,
      fromJson: (json) => ListsData.fromJson(json['MediaListCollection']),
    );
    return result.transform((data) {
      final animeLists =
          data.user?.mediaListOptions?.animeList?.sectionOrder ?? [];
      final mangaLists =
          data.user?.mediaListOptions?.mangaList?.sectionOrder ?? [];
      return ListsData(
        $__typename: data.$__typename,
        lists: data.lists
            ?.where((it) => it != null)
            .map((it) => it!)
            .sorted((a, b) => _sortListNames(
                  type == MediaType.ANIME ? animeLists : mangaLists,
                  a.name,
                  b.name,
                )),
        user: data.user,
      );
    });
  }
}
