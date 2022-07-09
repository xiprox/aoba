import 'package:aoba/services/services.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future init() async {
  // await Executor().warmUp(log: kDebugMode);
  // await HiveUtils.init();
  await Services.init();
  return runApp(const App());
}
