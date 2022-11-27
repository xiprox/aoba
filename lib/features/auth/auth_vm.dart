import 'dart:io';

import 'package:aoba/arch/show_snack_bar.dart';
import 'package:aoba/services/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:veee/veee.dart';

const _kClientId = 8787;
const _kClientIdPin = 8798;

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
        Platform.isMacOS || Platform.isWindows ? _kClientIdPin : _kClientId;
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
