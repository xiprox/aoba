import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import 'lists.dart';

part 'schema.g.dart';

const kPrefsId = 1;

@collection
class Prefs {
  Prefs() {
    lists = ListsPreferences();
  }

  Id get id => kPrefsId;

  late ListsPreferences lists;
}
