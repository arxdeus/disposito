import 'dart:async';

typedef DisposeCallback = FutureOr<void> Function();

abstract class Disposable {
  FutureOr<void> dispose();
}

abstract class Closable {
  FutureOr<void> close();
}

abstract class Cancelable {
  FutureOr<void> cancel();
}
