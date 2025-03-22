# Disposito

Semi-automatic dispose holder that allows centralized disposal of objects

## Quickstart

#### 1. Create `disposeHolder`:
- via `DisposeHolder()` constructor
- via mixin `DisposeHolderHostMixin`

    This mixin automatically:
    - creates under the hood `DisposeHolder` and tags by original class `identityHashcode`
    - transforms your class into `Disposable` extending original class with `dispose` method

#### 2. Bind each disposable object using `bindDisposable`

This method automatically binds disposables to a `disposeHolder`, which was created in step 1.

Usage:

```dart
// Each `DisposeHolderHostMixin` extends your class into `Disposable`
class SomeCoolObject with DisposeHolderHostMixin /* implements Disposable */ {

    // Bind your object using the `bindDisposable` method
    late final myCoolStreamController = bindDisposable(
        StreamController<int>(),
        dispose: (controller) => controller.close(),
    );

    // After using a mixin, your class will automatically get this method and a holder under the hood
    late final disposeHolder = DisposeHolder(...); // from `DisposeHolderHostMixin`
    void dispose() => disposeHolder.dispose(); // from `Disposable`
}

// Somewhere in code
void main() {
    final object = SomeCoolObject();
    myCoolStreamController.add(1); // Adds to controller `1`
    /* await */ object.dispose(); // Use await if you want to wait until the disposition of all bound objects
    myCoolStreamController.add(2); // Throws exception because the `myCoolStreamController` is closed
}
```

## Automatic disposing

Sometimes we can forget to dispose our objects, such as `StreamSubscription`'s or `StreamController`'s

Normally, you should prevent such situations, but..

`disposito` may dispose your forgotten disposables if their parent `Object` was GC'd (if there are no references to this `Object`)

After the parent `Object` is collected, `WeakReference` under the hood loses its link to that `Object`, marking `DisposeHolder` as "dirty"

Such `DisposeHolder`'s will be purged aka disposed (along with all bound disposables) after the next update in internal `DisposeRegistry`

Under the hood `DisposeRegistry` holds a hashmap with all existing `DisposeHolder`'s, giving you the ability to interact with previously created `DisposeHolder`'s


