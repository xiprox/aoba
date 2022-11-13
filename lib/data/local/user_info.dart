import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';

abstract class _Keys {
  static const id = 'id';
  static const name = 'name';
  static const avatarMedium = 'avatarMedium';
  static const avatarLarge = 'avatarLarge';
  static const banner = 'banner';
  static const donatorTier = 'donatorTier';
  static const donatorBadge = 'donatorBadge';
  static const timezone = 'timezone';
  static const profileColor = 'profileColor';
}

abstract class UserInfo {
  Future init();
  Future clear();

  int get id;
  set id(int value);

  String? get name;
  set name(String? value);

  String? get avatarMedium;
  set avatarMedium(String? value);

  String? get avatarLarge;
  set avatarLarge(String? value);

  String? get banner;
  set banner(String? value);

  int? get donatorTier;
  set donatorTier(int? value);

  String? get donatorBadge;
  set donatorBadge(String? value);

  String? get timezone;
  set timezone(String? value);

  String? get profileColor;
  set profileColor(String? value);
}

class UserInfoImpl implements UserInfo {
  late Box _box;

  @override
  Future init() async {
    _box = await Hive.openBox('user_info');
  }

  @override
  Future clear() async {
    await _box.clear();
    // Box gets closed when cleared so call init to re-open it.
    // Failing to re-open after clearing a box will cause writes to not be
    // persisted.
    await init();
  }

  @override
  int get id => _box.get(_Keys.id) ?? -1;
  @override
  set id(int value) => _box.put(_Keys.id, value);

  @override
  String? get name => _box.get(_Keys.name);
  @override
  set name(String? value) => _box.put(_Keys.name, value);

  @override
  String? get avatarMedium => _box.get(_Keys.avatarMedium);
  @override
  set avatarMedium(String? value) => _box.put(_Keys.avatarMedium, value);

  @override
  String? get avatarLarge => _box.get(_Keys.avatarLarge);
  @override
  set avatarLarge(String? value) => _box.put(_Keys.avatarLarge, value);

  @override
  String? get banner => _box.get(_Keys.banner);
  @override
  set banner(String? value) => _box.put(_Keys.banner, value);

  @override
  int? get donatorTier => _box.get(_Keys.donatorTier);
  @override
  set donatorTier(int? value) => _box.put(_Keys.donatorTier, value);

  @override
  String? get donatorBadge => _box.get(_Keys.donatorBadge);
  @override
  set donatorBadge(String? value) => _box.put(_Keys.donatorBadge, value);

  @override
  String? get timezone => _box.get(_Keys.timezone);
  @override
  set timezone(String? value) => _box.put(_Keys.timezone, value);

  @override
  String? get profileColor => _box.get(_Keys.profileColor);
  @override
  set profileColor(String? value) => _box.put(_Keys.profileColor, value);
}
