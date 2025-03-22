import 'dart:async';

import 'package:disposito/src/dispose_holder.dart';
import 'package:disposito/src/interfaces.dart';
import 'package:meta/meta.dart';

mixin DisposeHolderHostMixin implements Disposable {
  @protected
  DisposeHolder get disposeHolder => _disposeHolder;

  late final _disposeHolder = DisposeHolder(
    this,
    // Use identity of host object as unique identifier
    debugName: identityHashCode(this).toRadixString(16),
  );

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

  @override
  @mustCallSuper
  Future<void> dispose() => disposeHolder.dispose();
}
