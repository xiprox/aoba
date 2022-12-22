import 'package:aoba/arch/show_snack_bar.dart';
import 'package:aoba/data/local/user_info.dart';
import 'package:aoba/data/repo/user_info/user_info_repo.dart';
import 'package:aoba/services/services.dart';
import 'package:veee/veee.dart';

class OpenProfile extends ViewModelOrder {}

class ClosePopup extends ViewModelOrder {}

class UserBoxViewModel extends ViewModel {
  final _userInfo = get<UserInfo>();
  final _userInfoRepo = get<UserInfoRepo>();

  int get userId => _userInfo.id;
  String? get name => _userInfo.name;
  String? get avatarMedium => _userInfo.avatarMedium;
  String? get avatarLarge => _userInfo.avatarLarge;
  String? get color => _userInfo.profileColor;

  @override
  void onCreate() {
    super.onCreate();
    _updateUserInfo();
  }

  void _updateUserInfo() async {
    final userData = await _userInfoRepo.getBasicUserInfo();
    if (userData.data != null) {
      _userInfo.saveFromBasicUserInfo(userData.data!);
      notifyListeners();
    }
  }

  void onProfilePress() {
    order(OpenProfile());
    order(ClosePopup());
  }

  void onSettingsPress() {
    order(ShowSnackBar('Soon™️'));
    order(ClosePopup());
  }

  void onLogoutPress() async {
    await get<Credentials>().clear();
    await get<UserInfo>().clear();
    get<AppRouter>().replaceAll([const HomeRoute()]);
  }
}
