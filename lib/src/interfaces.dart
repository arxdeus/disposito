import 'dart:async';

import 'package:meta/meta.dart';

typedef DisposeCallback = FutureOr<void> Function();

abstract class Disposable {
  FutureOr<void> dispose();

  @internal
  static FutureOr<void> disposeObject(Disposable disposable) => disposable.dispose();
}

abstract class Closable {
  FutureOr<void> close();
}

abstract class Cancelable {
  FutureOr<void> cancel();
}
