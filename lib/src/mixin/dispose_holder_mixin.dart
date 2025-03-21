import 'dart:async';

import 'package:disposito/src/dispose_holder.dart';
import 'package:disposito/src/interfaces.dart';
import 'package:meta/meta.dart';

mixin DisposeHolderHostMixin implements Disposable {
  @protected
  DisposeHolder get disposeHolder => _disposeHolder;

  late final _disposeHolder = DisposeHolder(
    this,
    debugName: identityHashCode(this).toRadixString(16),
  );

  @nonVirtual
  @protected
  T bindDisposable<T extends Object>(
    T instance, {
    required FutureOr<void> Function() dispose,
  }) =>
      disposeHolder.bindDisposable(
        instance,
        dispose: dispose,
      );

  @nonVirtual
  @protected
  T createDisposable<T extends Object>(
    T Function() factory, {
    required FutureOr<void> Function(T instance) dispose,
  }) =>
      disposeHolder.createDisposable(
        factory,
        dispose: dispose,
      );

  @override
  @mustCallSuper
  Future<void> dispose() => disposeHolder.dispose();
}
