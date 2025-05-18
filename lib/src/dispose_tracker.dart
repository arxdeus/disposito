import 'dart:collection';

import 'package:disposito/disposito.dart';
import 'package:disposito/src/internal/dispose_registry.dart';
import 'package:meta/meta.dart';

/// Represents a tracking mechanism for disposable objects within the Disposito framework.
///
/// This class provides static methods to interact with and manage disposable objects,
/// primarily focusing on their lifecycle and disposal. It leverages the `DisposeRegistry`
/// to track registered disposable objects.
abstract final class DisposeTracker {
  /// A static property that returns an unmodifiable view of the registered disposable holders.
  /// This allows read-only access to the list of registered objects.
  static final disposeHolders = UnmodifiableMapView(DisposeRegistry.registeredHolders);

  /// A static getter that checks if any disposable objects are currently registered but not yet disposed of.
  /// It leverages the `DisposeRegistry` to determine if any disposable objects exist in the registry.
  @visibleForTesting
  static bool get hasUndisposedHolders => DisposeRegistry.registeredHolders.isNotEmpty;

  /// A static method that forcibly disposes of all registered disposable objects in the registry.
  /// This method iterates through the keys (representing disposable objects) in the registry
  /// and calls the `disposeObject` method on each object.  Use with caution.
  @experimental
  static void forceDisposeAll() =>
      DisposeRegistry.registeredHolders.keys.forEach(Disposable.disposeObject);
}
