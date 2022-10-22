import 'dart:async';

import 'package:flutter_hooks/flutter_hooks.dart';

void Function() useDebounce(
  void Function() func,
  Duration duration, {
  List<Object> keys = const [],
}) {
  final debouncedFunc = useDebounceArg(
    (arg) {
      func();
    },
    duration,
    keys: keys,
  );

  return () {
    debouncedFunc(null);
  };
}

const _doesNotExist = Object();

void Function(T arg) useDebounceArg<T>(
  void Function(T arg) func,
  Duration duration, {
  List<Object> keys = const [],
}) {
  final lastArgRef = useRef<dynamic>(_doesNotExist);
  final timerRef = useRef<Timer?>(null);

  void restartCall(T arg) {
    final timer = timerRef.value;
    if (timer != null && timer.isActive) {
      timer.cancel();
    }
    final newTimer = Timer(duration, () {
      lastArgRef.value = _doesNotExist;
      func(arg);
    });
    timerRef.value = newTimer;
  }

  useEffect(() {
    final lastArg = lastArgRef.value;

    final isArgValid = !identical(lastArg, _doesNotExist);

    if (isArgValid) {
      restartCall(lastArg as T);
    }

    return () {};
  }, [duration, ...keys]);

  return (arg) {
    lastArgRef.value = arg;
    restartCall(arg);
  };
}
