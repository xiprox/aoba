import 'package:isar/isar.dart';

part 'user_info.g.dart';

const kUserInfoId = 0;

@Collection(accessor: 'userInfo')
class UserInfo {
  final Id isarId = kUserInfoId;
  late int id;
  late String name;
  String? avatarMedium;
  String? avatarLarge;
  String? banner;
  int? donatorTier;
  String? donatorBadge;
  String? timezone;
  String? profileColor;

  UserInfo({
    this.id = 0,
    this.name = '',
    this.avatarMedium,
    this.avatarLarge,
    this.banner,
    this.donatorTier,
    this.donatorBadge,
    this.timezone,
    this.profileColor,
  });
}
