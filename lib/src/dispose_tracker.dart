import 'package:disposito/src/dispose_holder.dart';
import 'package:meta/meta.dart';

abstract final class DisposeTracker {
  @internal
  static final registeredHolders = <DisposeHolder, WeakReference<Object>>{};

  @internal
  @visibleForTesting
  static bool get hasUndisposedHolders => registeredHolders.isNotEmpty;

  @internal
  @experimental
  @visibleForTesting
  static Future<void> forceDisposeAll() async {
    for (final holder in registeredHolders.keys) {
      await holder.dispose();
    }
  }
}
