import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension FlutterWindowExts on SingletonFlutterWindow {
  EdgeInsets get padding => MediaQueryData.fromWindow(this).padding;
}
