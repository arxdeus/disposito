import 'dart:async';

import 'package:disposito/src/interfaces.dart';
import 'package:disposito/src/internal/internal.dart';

extension StreamSubscrptionExtensions<T, S extends StreamSubscription<T>> on S {
  S bindDisposeTo(DisposableBinderHost disposeHolder) =>
      disposeHolder.bindDisposable(this, dispose: (_) => unawaited(cancel()));
}

extension StreamControllerExtensions<T, S extends StreamController<T>> on S {
  S bindDisposeTo(DisposableBinderHost disposeHolder) =>
      disposeHolder.bindDisposable(this, dispose: (_) => unawaited(close()));
}

extension TimerExtensions on Timer {
  Timer bindDisposeTo(DisposableBinderHost disposeHolder) =>
      disposeHolder.bindDisposable(this, dispose: (_) => cancel());
}

extension SinkExtension<T, S extends Sink<T>> on S {
  S bindDisposeTo(DisposableBinderHost disposeHolder) =>
      disposeHolder.bindDisposable(this, dispose: (_) => close());
}

extension ClosableExtension<C extends Closable> on C {
  C bindDisposeTo(DisposableBinderHost disposeHolder) =>
      disposeHolder.bindDisposable(this, dispose: (_) => close());
}

extension CancelableExtension<C extends Cancelable> on C {
  C bindDisposeTo(DisposableBinderHost disposeHolder) =>
      disposeHolder.bindDisposable(this, dispose: (_) => cancel());
}

extension DisposableExtension<D extends Disposable> on D {
  D bindDisposeTo(DisposableBinderHost disposeHolder) =>
      disposeHolder.bindDisposable(this, dispose: (_) => dispose());
}
