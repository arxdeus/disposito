import 'dart:async';

import 'package:disposito/src/dispose_holder.dart';
import 'package:disposito/src/interfaces.dart';
import 'package:meta/meta.dart';

/// This is an internal class that manages the disposal of objects.
///
/// It uses a static map to store references to objects and their associated
/// [DisposeHolder] objects.
@internal
abstract final class DisposeRegistry {
  static final registeredHolders = <DisposeHolder, WeakReference<Object>>{};

  /// The `purgeAfter` method can be used to schedule a purge of the registry.
  /// This method calls the provided function and then schedules the actual purge.
  ///
  static void purgeAfter(void Function() function) {
    function();
    Future(_purge).ignore();
  }

  /// The `_purge` method iterates through the entries in the `registeredHolders` map,
  /// filters the entries with null targets(objects that have been disposed of),
  /// and then disposes of the remaining objects by calling the `Disposable.disposeObject` function.
  static void _purge() => registeredHolders.entries
      .where((entry) => entry.value.target == null)
      .map((entry) => entry.key)
      .forEach(Disposable.disposeObject);
}
