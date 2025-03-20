import 'dart:async';

import 'package:disposito/src/dispose_holder.dart';
import 'package:disposito/src/interfaces.dart';
import 'package:meta/meta.dart';

@internal
abstract final class DisposeRegistry {
  static final registeredHolders = <DisposeHolder, WeakReference<Object>>{};

  static Future<void> purgeAfter(FutureOr<void> Function() function) async {
    await function();
    Future(_purge).ignore();
  }

  static void _purge() => registeredHolders.entries
      .where((entry) => entry.value.target == null)
      .map((entry) => entry.key)
      .forEach(Disposable.disposeObject);
}
