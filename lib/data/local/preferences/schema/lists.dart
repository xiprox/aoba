import 'package:isar/isar.dart';
import 'package:aoba/widgets/lists/media_list.dart';

part 'lists.g.dart';

@embedded
class ListsPreferences {
  @Enumerated(EnumType.name)
  ListDisplayType displayType = ListDisplayType.grid;
}
