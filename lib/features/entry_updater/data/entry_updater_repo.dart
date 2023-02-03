import 'package:aoba/data/model/resource.dart';
import 'package:aoba/data/remote/client/gql_request.dart';
import 'package:aoba/exts/date_time_exts.dart';
import 'package:aoba/features/entry_updater/data/entry_updater.gql.dart';
import 'package:aoba/features/entry_updater/data/model/entry_update_data.dart';
import 'package:graphql/client.dart';

abstract class EntryUpdaterRepo {
  Future<Resource> updateEntry({
    required int mediaId,
    required EntryUpdateData data,
  });
}

class EntryUpdaterRepoImpl implements EntryUpdaterRepo {
  @override
  Future<Resource> updateEntry({
    required int mediaId,
    required EntryUpdateData data,
  }) {
    return GqlRequest.mutation(
      MutationOptions(
        document: documentNodeMutationEntryUpdate,
        variables: Variables$Mutation$EntryUpdate(
          mediaId: mediaId,
          status: data.status,
          score: data.score,
          progress: data.progress,
          progressVolumes: data.progressVolumes,
          repeat: data.repeats,
          notes: data.notes,
          startedAt: data.startedAt?.toFuzzyDateInput(),
          completedAt: data.completedAt?.toFuzzyDateInput(),
        ).toJson(),
      ),
      fromJson: Mutation$EntryUpdate.fromJson,
    );
  }
}
