import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

// Simple wrapper around StopWatchTimer that emits notifications on events.
class FlutterFlowTimerController with ChangeNotifier {
  FlutterFlowTimerController(this.timer);
  final StopWatchTimer timer;
  StreamSubscription<int>? _resetSubscription;

  void onStartTimer() {
    timer.onStartTimer();
    notifyListeners();
  }

  void onStopTimer() {
    timer.onStopTimer();
    notifyListeners();
  }

  Future<void> onResetTimer() async {
    await _resetSubscription?.cancel();
    _resetSubscription = timer.rawTime.listen((final _) async {
      notifyListeners();
      await _resetSubscription?.cancel();
      _resetSubscription = null;
    });
    timer.onResetTimer();
  }

  @override
  Future<void> dispose() async {
    await _resetSubscription?.cancel();
    await timer.dispose();
    super.dispose();
  }
}

/// A timer widget that displays and manages time.
class FlutterFlowTimer extends StatefulWidget {
  /// Creates a [FlutterFlowTimer] widget.
  const FlutterFlowTimer({
    required this.initialTime,
    required this.controller,
    required this.getDisplayTime,
    required this.onChanged,
    required this.textAlign,
    required this.style,
    super.key,
    this.updateStateInterval,
    this.onEnded,
  });

  /// The initial time for the timer.
  final int initialTime;

  /// The controller for the timer.
  final FlutterFlowTimerController controller;

  /// A function that returns the formatted display time.
  final String Function(int) getDisplayTime;

  /// A callback function that is called when the timer value changes.
  final FutureOr<void> Function(
    int value,
    String displayTime,
    bool shouldUpdate,
  ) onChanged;

  /// The interval at which the timer state should be updated.
  final Duration? updateStateInterval;

  /// A callback function that is called when the timer ends.
  final FutureOr<void> Function()? onEnded;

  /// The alignment of the timer text.
  final TextAlign textAlign;

  /// The style of the timer text.
  final TextStyle style;

  @override
  State<FlutterFlowTimer> createState() => _FlutterFlowTimerState();
}

class _FlutterFlowTimerState extends State<FlutterFlowTimer> {
  int get timerValue => widget.controller.timer.rawTime.value;
  bool get isCountUp => widget.controller.timer.mode == StopWatchMode.countUp;

  late String _displayTime;
  late int lastUpdateMs;
  StreamSubscription<int>? _rawTimeSubscription;
  StreamSubscription<bool>? _endedSubscription;
  late VoidCallback _controllerListener;

  FutureOr<void> Function() get onEnded => widget.onEnded ?? () {};

  @override
  void initState() {
    super.initState();
    // Set the initial time.
    widget.controller.timer.setPresetTime(mSec: widget.initialTime, add: false);
    // Initialize timer properties without updating outer state.
    unawaited(_initTimer(shouldUpdate: false));
  }

  Future<void> _initTimer({required final bool shouldUpdate}) async {
    // Initialize timer display time and last update time.
    _displayTime = widget.getDisplayTime(widget.controller.timer.rawTime.value);
    lastUpdateMs = timerValue;
    // Update timer value and display time.
    await widget.onChanged(timerValue, _displayTime, shouldUpdate);

    // Cancel previous subscriptions if any
    await _rawTimeSubscription?.cancel();
    await _endedSubscription?.cancel();

    // Add a listener for when the timer value changes to update the
    // displayed timer value.
    _rawTimeSubscription =
        widget.controller.timer.rawTime.listen((final _) async {
      _displayTime = widget.getDisplayTime(timerValue);
      widget.onChanged(timerValue, _displayTime, _shouldUpdate());
      if (mounted) {
        setState(() {});
      }
    });

    // Add listener for actions executed on timer.
    _controllerListener = () async => _initTimer(shouldUpdate: true);
    widget.controller.addListener(_controllerListener);

    // Add listener for when the timer ends.
    _endedSubscription =
        widget.controller.timer.fetchEnded.listen((final _) async => onEnded());
  }

  @override
  Future<void> dispose() async {
    await _rawTimeSubscription?.cancel();
    await _endedSubscription?.cancel();
    widget.controller.removeListener(_controllerListener);
    super.dispose();
  }

  bool _shouldUpdate() {
    // If a null or 0ms update interval is provided, always update.
    final updateIntervalMs = widget.updateStateInterval?.inMilliseconds;
    if (updateIntervalMs == null || updateIntervalMs == 0) {
      return true;
    }
    // Otherwise, we only update after the specified duration has passed
    // since the most recent update.
    final cutoff = lastUpdateMs + updateIntervalMs * (isCountUp ? 1 : -1);
    final shouldUpdate = isCountUp ? timerValue > cutoff : timerValue < cutoff;
    if (shouldUpdate) {
      lastUpdateMs = timerValue;
    }
    return shouldUpdate;
  }

  @override
  Widget build(final BuildContext context) => Text(
        _displayTime,
        textAlign: widget.textAlign,
        style: widget.style,
      );
}
