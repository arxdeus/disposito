import 'dart:async';

import 'package:disposito/src/interfaces.dart';
import 'package:disposito/src/internal/internal.dart';

extension StreamSubscrptionExtensions<T, S extends StreamSubscription<T>> on S {
  S bindDisposeTo(CustomDisposableCallHost disposeHolder) =>
      disposeHolder.customDisposable(this, dispose: () => unawaited(cancel()));
}

extension StreamControllerExtensions<T, S extends StreamController<T>> on S {
  S bindDisposeTo(CustomDisposableCallHost disposeHolder) =>
      disposeHolder.customDisposable(this, dispose: () => unawaited(close()));
}

extension TimerExtensions on Timer {
  Timer bindDisposeTo(CustomDisposableCallHost disposeHolder) =>
      disposeHolder.customDisposable(this, dispose: cancel);
}

extension SinkExtension<T, S extends Sink<T>> on S {
  S bindDisposeTo(CustomDisposableCallHost disposeHolder) =>
      disposeHolder.customDisposable(this, dispose: close);
}

extension ClosableExtension<C extends Closable> on C {
  C bindDisposeTo(CustomDisposableCallHost disposeHolder) =>
      disposeHolder.customDisposable(this, dispose: close);
}

extension CancelableExtension<C extends Cancelable> on C {
  C bindDisposeTo(CustomDisposableCallHost disposeHolder) =>
      disposeHolder.customDisposable(this, dispose: cancel);
}

extension DisposableExtension<D extends Disposable> on D {
  D bindDisposeTo(CustomDisposableCallHost disposeHolder) =>
      disposeHolder.customDisposable(this, dispose: dispose);
}
