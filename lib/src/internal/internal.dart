import 'dart:async';

import 'package:meta/meta.dart';

/// A class that manages a group of disposables.
@internal
abstract class DisposeGroup {
  /// Gets the map of disposal callbacks for this group.
  Map<Object, FutureOr<void> Function()> get $disposers;
}

/// Represents an object with a debug name.
@internal
abstract class NamedObject {
  /// Gets the debug name of this object.
  String? get $debugName;
}

///
/// A host that binds a disposable to a certain context or target.
///
@internal
abstract class DisposableBinderHost {
  /// Binds a disposable instance to the given callback.
  T bindDisposable<T extends Object>(
    T instance, {
    required FutureOr<void> Function(T) dispose,
  });
}

///
/// A generic callable that can be called with no arguments.
///
abstract final class Callable {
  /// Calls the provided function.
  static T call<T>(T Function() callback) => callback();
}
