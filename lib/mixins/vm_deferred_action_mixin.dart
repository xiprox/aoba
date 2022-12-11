import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:veee/veee.dart';

mixin DeferredActionMixin on ViewModel {
  final _timers = <dynamic, Timer>{};

  @protected
  void execute({
    required void Function() action,
    required Duration after,
    dynamic key,
  }) {
    final k = key ?? action.hashCode;
    _timers[k]?.cancel();
    _timers[k] = Timer(after, action);
  }

  @override
  void dispose() {
    for (var timer in _timers.values) {
      timer.cancel();
    }
    super.dispose();
  }
}
