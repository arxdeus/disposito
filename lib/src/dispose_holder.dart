import 'dart:async';

import 'package:disposito/src/interfaces.dart';
import 'package:disposito/src/internal/dispose_registry.dart';
import 'package:disposito/src/internal/internal.dart';
import 'package:meta/meta.dart';

final class DisposeHolder implements DisposableBinderHost, DisposeGroup, NamedObject, Disposable {
  DisposeHolder(
    Object parent, {
    String? debugName,
  }) : $debugName = debugName {
    _parent = WeakReference(parent);
    _finalizer.attach(parent, this, detach: _parent);

    DisposeRegistry.purgeAfter(() => DisposeRegistry.registeredHolders[this] = _parent);
  }

  @override
  @protected
  final String? $debugName;

  @override
  @internal
  late final Map<Object, Future<void> Function()> $disposers = {};
  late final WeakReference<Object> _parent;

  bool _isDisposed = false;
  bool get isDisposed => _isDisposed;

  static final _finalizer = Finalizer<DisposeHolder>(Disposable.disposeObject);

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

  @override
  String toString() => 'DisposeHolder(debugName: ${$debugName}, isDisposed: $isDisposed)';
}
