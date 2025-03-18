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
  T customDisposable<T extends Object>(
    T instance, {
    required FutureOr<void> Function() dispose,
  }) =>
      disposeHolder.customDisposable(
        instance,
        dispose: dispose,
      );

  @nonVirtual
  @protected
  T customDisposableFactory<T extends Object>(
    T Function() factory, {
    required FutureOr<void> Function(T instance) dispose,
  }) =>
      disposeHolder.customDisposableFactory(
        factory,
        dispose: dispose,
      );

  @override
  @mustCallSuper
  FutureOr<void> dispose() => disposeHolder.dispose();
}
