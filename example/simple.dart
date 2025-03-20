import 'dart:async';

import 'package:disposito/disposito.dart';

class SomeCoolObject with DisposeHolderHostMixin {
  late final streamController = customDisposableFactory(
    StreamController<int>.new,
    dispose: (instance) => instance.close(),
  );

  // ignore: cancel_subscriptions
  late final sub = streamController.stream.listen(print).bindDisposeTo(disposeHolder);

  void add(int input) {
    if (streamController.isClosed) return;
    streamController.add(input);
  }

  SomeCoolObject() {
    // ignore: unnecessary_statements
    sub;
  }
}

void main(List<String> args) {
  final someCoolObject = SomeCoolObject();

  someCoolObject.add(123);
  someCoolObject.add(456);
  someCoolObject.dispose();

  someCoolObject.add(789); // no 789? T_T
}
