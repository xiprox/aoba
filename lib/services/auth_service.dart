import 'package:aoba/data/local/database/schema/user_info.dart';
import 'package:aoba/data/repo/user_info/user_info_repo.dart';
import 'package:aoba/services/services.dart';

abstract class AuthService {
  Future<String?> handleAccessToken(String token);
}

class AuthServiceImpl implements AuthService {
  final _credentials = get<Credentials>();
  final _db = get<Database>();
  final _userInfoRepo = get<UserInfoRepo>();

  @override
  Future<String?> handleAccessToken(String token) async {
    _credentials.update((it) => it.accessToken = token);

    final userData = await _userInfoRepo.getBasicUserInfo();
    if (userData.data != null) {
      final data = userData.data!;
      _db.userInfo = UserInfo(
        id: data.id,
        name: data.name,
        avatarLarge: data.avatar?.large,
        avatarMedium: data.avatar?.medium,
        banner: data.bannerImage,
        donatorTier: data.donatorTier,
        donatorBadge: data.donatorBadge,
        timezone: data.options?.timezone,
        profileColor: data.options?.profileColor,
      );
      return null;
    } else {
      _credentials.update((it) => it.accessToken = null);
      return userData.error?.message ?? 'Error getting user data';
    }
  }
}
