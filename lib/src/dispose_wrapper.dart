import 'dart:async';

import 'package:meta/meta.dart';

/// Wrapper to hold disposable info
@internal
@immutable
final class DisposableWrapper<T> {
  const DisposableWrapper({
    required this.instance,
    required this.dispose,
  });

  final T instance;
  final FutureOr<void> Function() dispose;

  @override
  int get hashCode => Object.hash(instance, dispose);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DisposableWrapper &&
          runtimeType == other.runtimeType &&
          (instance == other.instance || identical(instance, other.instance));

  FutureOr<void> call() => dispose();
}
