import 'package:aoba/data/local/user_info.dart';
import 'package:aoba/data/repo/user_info/user_info_repo.dart';
import 'package:aoba/services/services.dart';

abstract class AuthService {
  Future<String?> handleAccessToken(String token);
}

class AuthServiceImpl implements AuthService {
  final _credentials = get<Credentials>();
  final _userInfo = get<UserInfo>();
  final _userInfoRepo = get<UserInfoRepo>();

  @override
  Future<String?> handleAccessToken(String token) async {
    _credentials.accessToken = token;

    final userData = await _userInfoRepo.getBasicUserInfo();
    if (userData.isSuccess() && userData.data?.Viewer != null) {
      _userInfo.saveFromBasicUserInfo(userData.data!.Viewer!);
      return null;
    } else {
      _credentials.accessToken = null;
      return userData.error?.message ?? 'Error getting user data';
    }
  }
}
