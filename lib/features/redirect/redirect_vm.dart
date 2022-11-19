import 'package:aoba/arch/show_snack_bar.dart';
import 'package:aoba/services/services.dart';
import 'package:veee/veee.dart';

class MoveOn extends ViewModelOrder {}

class RedirectViewModel extends ViewModel {
  final String? token;

  RedirectViewModel({this.token});

  final _auth = get<AuthService>();

  String? error;

  @override
  void onCreate() {
    _handleToken();
  }

  void _handleToken() async {
    if (token?.trim().isNotEmpty != true) {
      order(ShowSnackBar('Token is invalid'));
      return;
    }

    final error = await _auth.handleAccessToken(token!);
    if (error == null) {
      order(MoveOn());
    } else {
      this.error = error;
    }
  }
}
