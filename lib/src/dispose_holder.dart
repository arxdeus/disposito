import 'dart:async';

import 'package:disposito/src/interfaces.dart';
import 'package:disposito/src/internal/dispose_registry.dart';
import 'package:disposito/src/internal/dispose_wrapper.dart';
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
  T bindDisposable<T extends Object>(
    T instance, {
    required FutureOr<void> Function() dispose,
  }) {
    if (isDisposed) return instance;

    final wrapper = DisposableWrapper(
      instance: instance,
      disposeCallback: dispose,
    );

    if (!$disposers.contains(wrapper)) {
      $disposers.add(wrapper);
    }
    return instance;
  }

  @override
  @nonVirtual
  T createDisposable<T extends Object>(
    T Function() factory, {
    required FutureOr<void> Function(T instance) dispose,
  }) {
    final instance = factory();
    if (isDisposed) return instance;

    final wrapper = DisposableWrapper(
      instance: instance,
      disposeCallback: () => dispose(instance),
    );

    if (!$disposers.contains(wrapper)) {
      $disposers.add(wrapper);
    }
    return instance;
  }

  @override
  @mustCallSuper
  Future<void> dispose() {
    if (_isDisposed) return Future.value();
    final completer = Completer<void>.sync();
    // Prevents binding to this holder during disposing
    // preventing `Concurrent modification` problem
    _isDisposed = true;

    scheduleMicrotask(
      () => Future.wait($disposers.map((dispose) async => await dispose.dispose()))
          .whenComplete(completer.complete)
          // ignore: invalid_return_type_for_catch_error
          .catchError(completer.completeError),
    );

    DisposeRegistry.purgeAfter(() => DisposeRegistry.registeredHolders.remove(this));
    _finalizer.detach(_parent);
    return completer.future;
  }

  @override
  String toString() => 'DisposeHolder(debugName: ${$debugName}, isDisposed: $isDisposed)';
}
