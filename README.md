# `disposito` - Semi-Automatic disposal system for Dart

[![pub](https://img.shields.io/pub/points/disposito)](https://pub.dev/packages/disposito)

`disposito` is a lightweight utility for managing the lifecycle of disposable objects in Dart, ensuring they are automatically disposed when their parent object is garbage collected.

## Key Concepts

- **Automatic Disposal**: Disposes bound objects when the parent object is no longer referenced
- **Lifecycle Management**: Coordinates cleanup with the lifecycle of parent `DisposeHolderHostMixin`
- **DisposeRegistry**: Maintains map of existing `DisposeHolder` instances for lifecycle management

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  disposito: ^0.2.2
```

## Quickstart

#### 1. Create `disposeHolder`:
- via `DisposeHolder()` constructor
- via mixin `DisposeHolderHostMixin`

    This mixin automatically:
    - creates under the hood `DisposeHolder` and tags by original class `identityHashcode`
    - transforms your class into `Disposable` extending original class with `dispose` method

#### 2. Bind each disposable object using `bindDisposable`

This method automatically binds disposables to a `disposeHolder`, which was created in step 1.

## Usage Example

### `DisposeHolderHost` Object declaration
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
```

### Somewhere in code
```dart
void main() {
    final object = SomeCoolObject();
    myCoolStreamController.add(1); // Adds to controller `1`
    /* await */ object.dispose(); // Use await if you want to wait until the disposition of all bound objects
    myCoolStreamController.add(2); // Throws exception because the `myCoolStreamController` is closed
}
```


## Contributing

Contributions are welcome! Please follow these guidelines when submitting pull requests:

1. Follow package `analysis_options.yaml`
3. Add documentation for new features

For reporting issues, please use the [GitHub Issues page](https://github.com/arxdeus/disposito/issues).
