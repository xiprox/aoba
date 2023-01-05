import 'package:aoba/arch/show_snack_bar.dart';
import 'package:aoba/data/local/database/schema/user_info.dart';
import 'package:aoba/data/repo/user_info/user_info_repo.dart';
import 'package:aoba/services/services.dart';
import 'package:veee/veee.dart';

class OpenProfile extends ViewModelOrder {}

class ClosePopup extends ViewModelOrder {}

class UserBoxViewModel extends ViewModel {
  final _db = get<Database>();
  final _userInfoRepo = get<UserInfoRepo>();

  int get userId => _db.userInfo.id;
  String? get name => _db.userInfo.name;
  String? get avatarMedium => _db.userInfo.avatarMedium;
  String? get avatarLarge => _db.userInfo.avatarLarge;
  String? get color => _db.userInfo.profileColor;

  @override
  void onCreate() {
    super.onCreate();
    _updateUserInfo();
  }

  void _updateUserInfo() async {
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
    await get<Preferences>().clear();
    await get<Credentials>().clear();
    await get<Database>().clear();
    get<AppRouter>().replaceAll([const HomeRoute()]);
  }
}
