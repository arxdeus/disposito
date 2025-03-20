import 'dart:async';

import 'package:disposito/disposito.dart';

class SomeCoolObject with DisposeHolderHostMixin {
  late final streamController = customDisposableFactory(
    StreamController<int>.new,
    dispose: (instance) => instance.close(),
  );

  // ignore: cancel_subscriptions
  late final sub = customDisposableFactory(
    () => streamController.stream.listen(print),
    dispose: (instance) async {
      unawaited(instance.cancel());
      await Future<void>.delayed(const Duration(seconds: 1));
    },
  );

  void add(int input) {
    if (streamController.isClosed) return;
    streamController.add(input);
  }

  Future<void> someFutureCall() async {
    await Future(() {});
    add(456);
  }

  SomeCoolObject() {
    // ignore: unnecessary_statements
    sub;
  }
}

void main(List<String> args) async {
  final someCoolObject = SomeCoolObject();

  someCoolObject.add(123);
  await someCoolObject.someFutureCall();

  await someCoolObject.dispose();
  print('hello?');

  someCoolObject.add(789); // no 789? T_T
}
