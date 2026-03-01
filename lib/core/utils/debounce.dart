import 'dart:async';

class Debounce {
  /// Creates a [Debounce] instance with the specified duration.
  ///
  /// The [duration] parameter defines how long to wait before executing
  /// the debounced function.
  Debounce({required this.duration});

  /// The duration to wait before executing the debounced function.
  final Duration duration;

  Timer? _timer;

  /// Calls the provided [action] after the specified [duration].
  ///
  /// If this method is called again before the duration expires,
  /// the previous timer is cancelled and a new one is started.
  void call(void Function() action) {
    _timer?.cancel();
    _timer = Timer(duration, action);
  }

  /// Runs the provided [action] immediately and prevents any subsequent
  /// calls for the specified [duration].
  ///
  /// This is useful when you want the first call to execute immediately
  /// but ignore rapid subsequent calls.
  void runImmediately(void Function() action) {
    if (_timer?.isActive ?? false) return;
    action();
    _timer = Timer(duration, () {});
  }

  /// Cancels the pending debounced action if any.
  void cancel() {
    _timer?.cancel();
    _timer = null;
  }

  /// Disposes of this debouncer and cancels any pending actions.
  ///
  /// Should be called when the debouncer is no longer needed,
  /// typically in a dispose method.
  void dispose() {
    cancel();
  }
}
