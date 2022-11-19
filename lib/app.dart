import 'package:aoba/data/local/user_info.dart';
import 'package:aoba/navigation/custom/custom_route_info_parser.dart';
import 'package:aoba/services/services.dart';
import 'package:aoba/theme/theme.dart';
import 'package:aoba/utils/anilist_utils.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = get<AppRouter>();
    return StreamBuilder<String?>(
      stream: get<UserInfo>().profileColorStream,
      builder: (context, snapshot) {
        final profileColor = AniListUtils().colorFromProfileColor(
          snapshot.data,
        );
        return MaterialApp.router(
          title: 'Aoba',
          theme: AppTheme.light(profileColor),
          darkTheme: AppTheme.dark(profileColor),
          routerDelegate: router.delegate(),
          routeInformationParser: CustomRouteInfoParser(
            router.defaultRouteParser(),
          ),
        );
      },
    );
  }
}
