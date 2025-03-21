# Disposito

Semi-automatic dispose holder that allows centralised disposal of objects

## Quickstart

#### 1. Create `disposeHolder`:
- via `DisposeHolder()` constructor
- via mixin `DisposeHolderHostMixin`
    This mixin automatically:
    - creates under the hood `DisposeHolder` and tags by original class identityHashcode
    - transforms your class into `Disposable` extending original class with `dispose` method

#### 2. Bind each disposable value using `bindDisposable`

This methods automatically binds disposables into `disposeHolder` that was created in step 1.

Usage:

```dart
// Each `DisposeHolderHostMixin` extends your class into `Disposable`
class SomeCoolObject with DisposeHolderHostMixin /* implements Disposable */ {

    // Bind your object via `bindDisposable`
    late final myCoolStreamController = bindDisposable(
        StreamController<int>(),
        dispose: (controller) => controller.close(),
    );

    // After using mixin your class will automatically get these method and holder under the hood
    /* from `DisposeHolderHostMixin` */  late final disposeHolder = DisposeHolder(...);
    /* from `Disposable` */ void dispose() => disposeHolder.dispose();
}

// Somewhere in code
void main() {
    final object = SomeCoolObject();
    myCoolStreamController.add(1); // Adds to controller `1`
    /* await */ object.dispose(); // Use await if you want to wait untii disposition of all binded objects
    myCoolStreamController.add(2); // Throws exception since the controller is closed
}
```

## Automatic disposing

Sometimes we can forget to dispose our objects, such as `StreamSubscription`'s or `StreamController`'s

Normally, you should prevent such situations, but..

`disposito` may dispose your forgotten disposables if their parental `Object` was GC'ed (if there's no references to this `Object`)

After parental `Object` was collected, `WeakReference` under the hood loses a link to this `Object`, marking `DisposeHolder` is "dirty"

Such `DisposeHolder`'s will be purged aka disposed (with all binded disposables) after next update in internal `DisposeRegistry`

Under the hood `DisposeRegistry` holds a hashmap with all existing `DisposeHolder`'s, it gives you a possibility to interact with previously created `DisposeHolder`'s


