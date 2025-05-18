// ignore_for_file: unnecessary_statements, avoid_returning_this, unused_local_variable

import 'dart:async';

import 'package:disposito/disposito.dart';
import 'package:test/test.dart';

import 'util/gc_util.dart';

class Test with DisposeHolderHostMixin {
  late final StreamSubscription<Object?> sub = bindDisposable(
    Stream<Object?>.periodic(const Duration(milliseconds: 100))
        .take(5000)
        .listen(null),
    dispose: (sub) => sub.cancel(),
  );

  late final StreamController<Object?> controller = bindDisposable(
    StreamController(),
    dispose: (controller) => controller.close(),
  );

  late final StreamController<Object?> controller3 =
      StreamController<Object?>().bindDisposeTo(disposeHolder);
  late final StreamController<Object?> controller4 =
      StreamController<Object?>().bindDisposeTo(disposeHolder);
  late final StreamController<Object?> controller5 =
      StreamController<Object?>().bindDisposeTo(disposeHolder);
  late final StreamController<Object?> controller6 =
      StreamController<Object?>().bindDisposeTo(disposeHolder);
  late final StreamController<Object?> controller7 =
      StreamController<Object?>().bindDisposeTo(disposeHolder);
  late final StreamController<Object?> controller8 =
      StreamController<Object?>().bindDisposeTo(disposeHolder);

  Test load() {
    // someInteger;
    sub;
    controller;
    controller3;
    controller4;
    controller5;
    controller6;
    controller7;
    controller8;

    return this;
  }
}

void main() async {
  final vmService = await VmServiceUtil.create();

  test('holders is empty after dispose', () async {
    Test? x = Test().load();
    Test? y = Test().load();

    x = null;
    y = null;

    print(DisposeTracker.disposeHolders);
    expect(DisposeTracker.disposeHolders, isNotEmpty);

    await Future(vmService.gc);

    print(DisposeTracker.disposeHolders);
    expect(DisposeTracker.disposeHolders, isEmpty);
  });
}
