import 'dart:async';

import 'package:disposito/src/dispose_wrapper.dart';
import 'package:disposito/src/interfaces.dart';
import 'package:disposito/src/internal/dispose_registry.dart';
import 'package:disposito/src/internal/internal.dart';
import 'package:meta/meta.dart';

final class DisposeHolder
    implements
        CustomDisposableCallHost,
        CustomDisposableFactoryCallHost,
        DisposeGroup,
        Named,
        Disposable {
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
  final List<DisposableWrapper<Object>> $disposers = [];

  late final WeakReference<Object> _parent;

  bool _isDisposed = false;
  bool get isDisposed => _isDisposed;

  static final _finalizer = Finalizer<DisposeHolder>(Disposable.disposeObject);

  @override
  @nonVirtual
  T customDisposable<T extends Object>(
    T instance, {
    required FutureOr<void> Function() dispose,
  }) {
    if (isDisposed) return instance;

    final wrapper = DisposableWrapper(
      instance: instance,
      dispose: dispose,
    );

    if (!$disposers.contains(dispose)) {
      $disposers.add(wrapper);
    }
    return instance;
  }

  @override
  @nonVirtual
  T customDisposableFactory<T extends Object>(
    T Function() factory, {
    required FutureOr<void> Function(T instance) dispose,
  }) {
    final instance = factory();
    if (isDisposed) return instance;

    final wrapper = DisposableWrapper(
      instance: instance,
      dispose: () => dispose(instance),
    );

    if (!$disposers.contains(wrapper)) {
      $disposers.add(wrapper);
    }
    return instance;
  }

  @override
  @mustCallSuper
  Future<void> dispose() async {
    if (_isDisposed) return;
    // Prevents binding to this holder during disposing
    // preventing `Concurrent modification` problem
    _isDisposed = true;

    for (final dispose in $disposers) {
      await Future.sync(dispose.dispose);
    }

    DisposeRegistry.purgeAfter(() => DisposeRegistry.registeredHolders.remove(this));
    _finalizer.detach(_parent);
  }

  @override
  String toString() => 'DisposeHolder(debugName: ${$debugName}, isDisposed: $isDisposed)';
}
