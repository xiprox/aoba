import 'dart:async';

/// A simple service that allows async notifications between disconnected parts
/// of the code in extremely simple scenarios, where the consumer only needs
/// to know that the thing happened, but doesn't actually depend on it in any
/// capacity.
///
/// For example, when the user updates a media entry using Quick Update, the
/// Feed might be listening for a [PingType.quickUpdateHappened] ping, and may
/// refresh its data.
abstract class PingService<T> {
  StreamSubscription listen(T pingType, void Function() onPing);
  void notify(T pingType);
}

enum PingType {
  quickUpdateHappened,
  mediaListEntryUpdated,
}

class PingServiceImpl implements PingService<PingType> {
  final _controller = StreamController<PingType>.broadcast();

  @override
  StreamSubscription listen(PingType pingType, void Function() onPing) {
    return _controller.stream
        .where((event) => event == pingType)
        .listen((_) => onPing());
  }

  @override
  void notify(PingType pingType) {
    _controller.add(pingType);
  }
}
