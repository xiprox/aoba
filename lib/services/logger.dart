import 'package:flutter/foundation.dart' show kDebugMode;

abstract class Logger {
  void call(String message, {String? tag});
}

class LoggerImpl extends Logger {
  @override
  void call(String message, {String? tag}) {
    final tagPart = tag == null ? '' : '$tag:';
    final line = '$tagPart $message';
    // ignore: avoid_print
    if (kDebugMode) print(line);
  }
}
