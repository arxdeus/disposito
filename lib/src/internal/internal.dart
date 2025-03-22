import 'dart:async';

import 'package:meta/meta.dart';

@internal
abstract class DisposeGroup {
  Map<Object, FutureOr<void> Function()> get $disposers;
}

@internal
abstract class NamedObject {
  String? get $debugName;
}

@internal
abstract class DisposableBinderHost {
  T bindDisposable<T extends Object>(
    T instance, {
    required FutureOr<void> Function(T instance) dispose,
  });
}
