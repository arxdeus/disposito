import 'dart:async';

import 'package:disposito/src/internal/dispose_wrapper.dart';
import 'package:meta/meta.dart';

@internal
abstract class DisposeGroup {
  Iterable<DisposableWrapper<Object>> get $disposers;
}

@internal
abstract class Named {
  String? get $debugName;
}

@internal
abstract class CustomDisposableCallHost {
  T customDisposable<T extends Object>(
    T instance, {
    required FutureOr<void> Function() dispose,
  });
}

@internal
abstract class CustomDisposableFactoryCallHost {
  T customDisposableFactory<T extends Object>(
    T Function() factory, {
    required FutureOr<void> Function(T instance) dispose,
  });
}
