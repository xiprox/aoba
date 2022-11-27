import 'dart:io';

import 'package:aoba/arch/show_snack_bar.dart';
import 'package:aoba/consts/anilist_consts.dart';
import 'package:aoba/services/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:veee/veee.dart';

final kIsPinAuthMethod = Platform.isWindows || Platform.isMacOS;

class MoveOn extends ViewModelOrder {
  const MoveOn();
}

class AuthViewModel extends ViewModel {
  final Function()? onSuccess;

  AuthViewModel({this.onSuccess});

  final _auth = get<AuthService>();

  bool showPinInputField = false;

  void onAuthPress() {
    if (Platform.isMacOS || Platform.isWindows) {
      showPinInputField = true;
      notifyListeners();
    }

    final clientId =
        kIsPinAuthMethod ? AnilistConsts.clientIdPin : AnilistConsts.clientId;
    launchUrl(
      Uri.parse(
        'https://anilist.co/api/v2/oauth/authorize'
        '?client_id=$clientId'
        '&response_type=token',
      ),
      mode: LaunchMode.externalApplication,
    );
  }

  void onPinSubmit(String? pin) async {
    if (pin?.trim().isNotEmpty != true) {
      order(ShowSnackBar('Pin is required'));
      return;
    }

    final error = await _auth.handleAccessToken(pin!);
    if (error == null) {
      onSuccess?.call();
    } else {
      order(ShowSnackBar(error));
    }
  }
}
