import 'package:aoba/data/local/base/storage_public_interface.dart';
import 'package:isar/isar.dart';

import 'schema/user_info.dart';

typedef UpdaterFunction<T> = Function(T it);

abstract class Database implements StoragePublicInterface {
  UserInfo get userInfo;
  set userInfo(UserInfo value);

  Stream<String?> get userProfileColorStream;
}

class DatabaseImpl implements Database {
  late Isar _isar;

  @override
  Future init() async {
    _isar = await Isar.open([UserInfoSchema], name: 'database');
  }

  @override
  Future clear() => _isar.writeTxn(() => _isar.clear());

  @override
  Future close() => _isar.close();

  @override
  UserInfo get userInfo {
    final existing = _isar.userInfo.getSync(kUserInfoId);
    if (existing != null) {
      return existing;
    } else {
      final info = UserInfo();
      userInfo = info;
      return info;
    }
  }

  @override
  set userInfo(UserInfo value) {
    _isar.writeTxnSync(() => _isar.userInfo.putSync(value));
  }

  @override
  Stream<String?> get userProfileColorStream => _isar.userInfo
      .watchObject(kUserInfoId)
      .map((event) => event?.profileColor);
}
