import 'dart:io';

import 'package:aoba/arch/show_snack_bar.dart';
import 'package:aoba/data/local/user_info.dart';
import 'package:aoba/data/repo/user_info/user_info_repo.dart';
import 'package:aoba/services/services.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:veee/veee.dart';

const _kClientId = 8787;
const _kClientIdPin = 8798;

class MoveOn extends ViewModelOrder {
  const MoveOn();
}

class AuthViewModel extends ViewModel {
  final Function()? onSuccess;

  AuthViewModel({this.onSuccess});

  final _credentials = get<Credentials>();
  final _userInfo = get<UserInfo>();
  final _userInfoRepo = get<UserInfoRepo>();

  void onAuthPress() {
    final clientId =
        Platform.isMacOS || Platform.isWindows ? _kClientIdPin : _kClientId;
    launchUrlString(
      'https://anilist.co/api/v2/oauth/authorize'
      '?client_id=$clientId'
      '&response_type=token',
    );
  }

  void onPinSubmit(String? pin) async {
    if (pin?.trim().isNotEmpty != true) {
      order(ShowSnackBar('Pin is required'));
      return;
    }

    _credentials.accessToken = pin;

    final userData = await _userInfoRepo.getBasicUserInfo();
    print(userData);
    if (userData.isSuccess() && userData.data?.Viewer != null) {
      final data = userData.data!.Viewer!;
      _userInfo.id = data.id;
      _userInfo.name = data.name;
      _userInfo.avatarLarge = data.avatar?.large;
      _userInfo.avatarMedium = data.avatar?.medium;
      _userInfo.banner = data.bannerImage;
      _userInfo.donatorTier = data.donatorTier;
      _userInfo.donatorBadge = data.donatorBadge;
      _userInfo.timezone = data.options?.timezone;
      _userInfo.profileColor = data.options?.profileColor;
      onSuccess?.call();
    } else {
      order(ShowSnackBar(userData.error?.message ?? 'Error getting user data'));
      _credentials.accessToken = null;
    }
  }
}
