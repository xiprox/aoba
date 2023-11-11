import 'package:aoba/data/model/aliases.dart';
import 'package:isar/isar.dart';
import 'package:aoba/widgets/lists/media_list.dart';
import 'package:aoba/data/remote/gql/schema/schema.gql.dart';

part 'lists.g.dart';

@embedded
class ListsPreferences {
  @Enumerated(EnumType.name)
  ListDisplayType displayType = ListDisplayType.grid;

  @Enumerated(EnumType.name)
  MediaListSort sort = MediaListSort.MEDIA_TITLE_ROMAJI;
}
