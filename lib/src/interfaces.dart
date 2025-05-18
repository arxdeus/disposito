import 'dart:async';

import 'package:meta/meta.dart';

typedef DisposeCallback = FutureOr<void> Function();

/// A base class for resources that can be disposed of.
///
/// Disposable objects should implement a `dispose()` method that performs
/// any necessary cleanup when the object is no longer needed.
abstract class Disposable {
  /// Disposes of the disposable object.
  ///
  /// This method should perform any necessary cleanup operations.
  ///
  /// @return A `Future` that completes when the disposal is finished.
  FutureOr<void> dispose();

  /// A static method to dispose of a disposable object.
  ///
  /// This is intended for internal use and is not part of the public API.
  ///
  /// @param disposable The disposable object to dispose.
  /// @return A `Future` that completes when the disposal is finished.
  @internal
  static FutureOr<void> disposeObject(Disposable disposable) => disposable.dispose();
}

/// A base class for resources that can be closed.
///
/// Closable objects should implement a `close()` method that performs
/// any necessary cleanup when the resource is no longer in use.
abstract class Closable {
  /// Closes the resource.
  ///
  /// This method should perform any necessary cleanup operations.
  ///
  /// @return A `Future` that completes when the closing is finished.
  FutureOr<void> close();
}

/// A base class for resources that can be cancelled.
///
/// Cancelable objects should implement a `cancel()` method that performs
/// any necessary cleanup when the operation is cancelled.
abstract class Cancelable {
  /// Cancels the operation.
  ///
  /// This method should perform any necessary cleanup operations.
  ///
  /// @return A `Future` that completes when the cancellation is finished.
  FutureOr<void> cancel();
}
