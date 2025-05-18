import 'dart:async';

import 'package:disposito/src/interfaces.dart';
import 'package:disposito/src/internal/internal.dart';

/// Extension for StreamSubscription objects to bind disposal to a DisposableBinderHost.
extension StreamSubscrptionExtensions<T, S extends StreamSubscription<T>> on S {
  /// Bind subscription disposal to the given host.
  S bindDisposeTo(DisposableBinderHost disposeHolder) =>
      disposeHolder.bindDisposable(this, dispose: (_) => cancel());
}

/// Extension for StreamController objects to bind disposal to a DisposableBinderHost.
extension StreamControllerExtensions<T, S extends StreamController<T>> on S {
  /// Bind controller disposal to the given host.
  S bindDisposeTo(DisposableBinderHost disposeHolder) =>
      disposeHolder.bindDisposable(this, dispose: (_) => close());
}

/// Extension for Timer objects to bind disposal to a DisposableBinderHost.
extension TimerExtensions on Timer {
  /// Bind timer disposal to the given host.
  Timer bindDisposeTo(DisposableBinderHost disposeHolder) =>
      disposeHolder.bindDisposable(this, dispose: (_) => cancel());
}

/// Extension for Sink objects to bind disposal to a DisposableBinderHost.
extension SinkExtension<T, S extends Sink<T>> on S {
  /// Bind sink disposal to the given host.
  S bindDisposeTo(DisposableBinderHost disposeHolder) =>
      disposeHolder.bindDisposable(this, dispose: (_) => close());
}

/// Extension for Closable objects to bind disposal to a DisposableBinderHost.
extension ClosableExtension<C extends Closable> on C {
  /// Bind closable object disposal to the given host.
  C bindDisposeTo(DisposableBinderHost disposeHolder) =>
      disposeHolder.bindDisposable(this, dispose: (_) => close());
}

/// Extension for Disposable objects to bind disposal to a DisposableBinderHost.
extension DisposableExtension<D extends Disposable> on D {
  /// Bind disposable object disposal to the given host.
  D bindDisposeTo(DisposableBinderHost disposeHolder) =>
      disposeHolder.bindDisposable(this, dispose: (_) => dispose());
}
