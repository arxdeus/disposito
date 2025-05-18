import 'dart:async';

import 'package:disposito/src/dispose_holder.dart';
import 'package:disposito/src/interfaces.dart';
import 'package:meta/meta.dart';

/// A mixin providing functionality for managing disposable resources.
///
/// This mixin provides a mechanism to create and manage disposable objects,
/// ensuring that resources are properly released when no longer needed.
/// It uses [DisposeHolder] for managing disposables and provides methods
/// like `bindDisposable` and `dispose` for interacting with disposable
/// objects.
mixin DisposeHolderHostMixin implements Disposable {
  /// The [DisposeHolder] instance associated with this host.
  ///
  /// Provides access to the [DisposeHolder] instance that manages the
  /// lifecycle of disposable objects associated with this host.
  @protected
  DisposeHolder get disposeHolder => _disposeHolder;

  late final _disposeHolder = DisposeHolder(
    this,
    // Use identity of host object as unique identifier
    debugName: identityHashCode(this).toRadixString(16),
  );

  /// Binds a disposable instance to the host, allowing for its disposal.
  ///
  /// This method binds a [T] instance to the host and associates a [dispose]
  /// function to handle its disposal. The [dispose] function is executed
  /// when the disposable object is no longer needed.
  ///
  /// [instance]: The disposable object to bind.
  /// [dispose]: A future function that will be executed to dispose of the [instance].
  ///
  /// Returns the bound [instance].
  @nonVirtual
  @protected
  T bindDisposable<T extends Object>(
    T instance, {
    required FutureOr<void> Function(T instance) dispose,
  }) =>
      disposeHolder.bindDisposable(
        instance,
        dispose: dispose,
      );

  /// Disposes of all bound disposable objects.
  ///
  /// This method delegates the actual disposal to the underlying [DisposeHolder].
  /// It is marked with @mustCallSuper to ensure proper disposal of all bound
  /// disposable objects.
  @override
  @mustCallSuper
  Future<void> dispose() => disposeHolder.dispose();
}
