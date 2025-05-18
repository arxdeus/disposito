import 'dart:async';

import 'package:disposito/src/interfaces.dart';
import 'package:disposito/src/internal/dispose_registry.dart';
import 'package:disposito/src/internal/internal.dart';
import 'package:meta/meta.dart';

/// A class that serves as a host for disposable objects, managing their lifecycle.
/// It implements the interfaces `DisposableBinderHost`, `DisposeGroup`, `NamedObject`, and `Disposable`.
/// It's designed to be a central point for binding and disposing of disposable resources,
/// ensuring that resources are properly released when no longer needed.
final class DisposeHolder implements DisposableBinderHost, DisposeGroup, NamedObject, Disposable {
  /// Constructs a new [DisposeHolder].
  ///
  /// [parent]: The parent object (e.g., a widget or component) associated with the holder.
  ///          This allows for tracking and potential cleanup of the parent.
  /// [debugName]: An optional debugging name for the holder, used for identifying it in debugging tools.
  DisposeHolder(
    Object parent, {
    String? debugName,
  }) : $debugName = debugName {
    _parent = WeakReference(parent);
    _finalizer.attach(parent, this, detach: _parent);

    DisposeRegistry.purgeAfter(
      () => DisposeRegistry.registeredHolders[this] = _parent,
    );
  }

  /// The debug name associated with the [DisposeHolder], used for debugging purposes.
  ///  The name can be specified during object creation or is defaulted.
  @override
  @protected
  final String? $debugName;

  /// A map of disposable instances to their associated dispose functions.
  /// This map is marked as `@internal` to indicate that it's primarily used internally
  /// by the `DisposeHolder` and should not be accessed directly by external code.
  @override
  @internal
  late final Map<Object, Future<void> Function()> $disposers = {};
  late final WeakReference<Object> _parent;

  /// Indicates whether the [DisposeHolder] has already been disposed of.
  bool _isDisposed = false;
  bool get isDisposed => _isDisposed;

  /// A [Finalizer] used to automatically detach the holder from its parent when the parent is garbage-collected.
  /// It ensures proper cleanup when an object is no longer referenced.
  static final _finalizer = Finalizer<DisposeHolder>(Disposable.disposeObject);

  /// Binds a disposable instance to the [DisposeHolder] by associating it with a dispose function.
  ///
  /// [instance]: The disposable instance to bind.
  /// [dispose]: A function that handles the disposal of the [instance].
  ///            It should return a [Future] to allow for asynchronous disposal.
  @override
  @nonVirtual
  T bindDisposable<T extends Object>(
    T instance, {
    required FutureOr<void> Function(T instance) dispose,
  }) {
    if (isDisposed) return instance;

    if (!$disposers.containsKey(instance)) {
      $disposers[instance] = () async => await dispose(instance);
    }
    return instance;
  }

  /// Disposes of the [DisposeHolder], releasing its bound resources.
  /// This method should be called when the holder is no longer needed.
  /// It executes the dispose functions associated with all bound disposable instances.
  /// Prevents binding to this holder during disposing to prevent "Concurrent modification" problem
  @override
  @mustCallSuper
  Future<void> dispose() {
    if (_isDisposed) return Future.value();

    @pragma('vm:awaiter-link')
    final completer = Completer<void>.sync();

    // Prevents binding to this holder during disposing
    // preventing `Concurrent modification` problem
    _isDisposed = true;

    DisposeRegistry.purgeAfter(() {
      $disposers.values.map(Callable.call).wait.then(
            completer.complete,
            onError: completer.completeError,
          );

      DisposeRegistry.registeredHolders.remove(this);
    });

    _finalizer.detach(_parent);
    return completer.future;
  }

  /// Returns a string representation of the [DisposeHolder], primarily for debugging purposes.
  /// Includes information about its debug name and whether it has been disposed.
  @override
  String toString() => 'DisposeHolder(debugName: ${$debugName}, isDisposed: $isDisposed)';
}
