import 'dart:async';

import 'package:disposito/src/interfaces.dart';
import 'package:meta/meta.dart';

/// Wrapper to hold disposable info
@internal
@immutable
final class DisposableWrapper<T> implements Disposable {
  const DisposableWrapper({
    required this.instance,
    required this.disposeCallback,
  });

  final T instance;
  final FutureOr<void> Function() disposeCallback;

  @override
  int get hashCode => Object.hash(instance, dispose);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DisposableWrapper &&
          runtimeType == other.runtimeType &&
          (instance == other.instance || identical(instance, other.instance));

  @override
  FutureOr<void> dispose() => disposeCallback();
}
