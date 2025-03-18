import 'dart:async';

import 'package:disposito/src/interfaces.dart';
import 'package:disposito/src/internal.dart';

extension StreamSubscrptionExtensions<T> on StreamSubscription<T> {
  StreamSubscription<T> bindDisposeTo(CustomDisposableCallHost disposableHolder) =>
      disposableHolder.customDisposable(this, dispose: () => unawaited(cancel()));
}

extension StreamControllerExtensions<T> on StreamController<T> {
  StreamController<T> bindDisposeTo(CustomDisposableCallHost disposableHolder) =>
      disposableHolder.customDisposable(this, dispose: () => unawaited(close()));
}

extension TimerExtensions on Timer {
  Timer bindDisposeTo(CustomDisposableCallHost disposableHolder) =>
      disposableHolder.customDisposable(this, dispose: cancel);
}

extension SinkExtension<T> on Sink<T> {
  Sink<T> bindDisposeTo(CustomDisposableCallHost disposableHolder) =>
      disposableHolder.customDisposable(this, dispose: close);
}

extension ClosableExtension<C extends Closable> on C {
  C bindDisposeTo(CustomDisposableCallHost disposableHolder) => disposableHolder.customDisposable(this, dispose: close);
}

extension CancelableExtension<C extends Cancelable> on C {
  C bindDisposeTo(CustomDisposableCallHost disposableHolder) =>
      disposableHolder.customDisposable(this, dispose: cancel);
}

extension DisposableExtension<D extends Disposable> on D {
  D bindDisposeTo(CustomDisposableCallHost disposableHolder) =>
      disposableHolder.customDisposable(this, dispose: dispose);
}
