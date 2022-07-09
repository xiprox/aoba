import 'dart:io';

import 'package:aoba/services/services.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:veee/veee.dart';

const _kClientId = 8787;
const _kClientIdMacOs = 8798;

class MoveOn extends ViewModelOrder {
  const MoveOn();
}

class AuthViewModel extends ViewModel {
  final Function()? onSuccess;

  AuthViewModel({this.onSuccess});

  final _credentials = get<Credentials>();

  void onAuthPress() {
    final clientId = Platform.isMacOS ? _kClientIdMacOs : _kClientId;
    launchUrlString(
      'https://anilist.co/api/v2/oauth/authorize'
      '?client_id=$clientId'
      '&response_type=token',
    );
  }

  void onPinSubmit(String? pin) {
    if (pin?.trim().isNotEmpty == true) {
      _credentials.setAccessToken(pin);
      onSuccess?.call();
    }
  }
}
