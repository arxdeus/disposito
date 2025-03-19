import 'dart:collection';

import 'package:disposito/disposito.dart';
import 'package:disposito/src/internal/dispose_registry.dart';
import 'package:meta/meta.dart';

abstract final class DisposeTracker {
  static final disposeHolders = UnmodifiableMapView(DisposeRegistry.registeredHolders);

  @visibleForTesting
  static bool get hasUndisposedHolders => DisposeRegistry.registeredHolders.isNotEmpty;

  @experimental
  static void forceDisposeAll() =>
      DisposeRegistry.registeredHolders.keys.forEach(Disposable.disposeObject);
}
