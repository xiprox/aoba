import 'dart:async';

import 'package:veee/veee.dart';

mixin StreamSubscriptionManagerMixin on ViewModel {
  final _subscriptions = <StreamSubscription>[];

  void manage(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }

  @override
  void dispose() {
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }
}
