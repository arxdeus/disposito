# Changelog

## [0.2.0](https://github.com/arxdeus/disposito/compare/v0.0.0..0.2.0) - 2025-03-21

### Bug Fixes

- **(dispose_holder)** make dispose async - ([4489a13](https://github.com/arxdeus/disposito/commit/4489a1339b8fde654605c82ca9a4df9dd8e2d40d))
- **(example)** update to new syntax - ([4f993ff](https://github.com/arxdeus/disposito/commit/4f993ff650a4fb7c9d28fabebdd1db7b2bc8f7d7))
- **(extensions)** change signatures to generics to allow subtypes - ([2e2759c](https://github.com/arxdeus/disposito/commit/2e2759cf47b4c7b7a9941a8f9329d3c477732541))
- **(extensions)** update extensions to new syntax - ([11f03a4](https://github.com/arxdeus/disposito/commit/11f03a4294b3cfddb398c1f04ab4f06cd7066747))
- path to wrapper inside `internal.dart` - ([f443f00](https://github.com/arxdeus/disposito/commit/f443f001d89d8a8e1cb832c1a99844c122bd086b))
- remove `createDisposable` and `DisposeWrapper` - ([a3fe6e4](https://github.com/arxdeus/disposito/commit/a3fe6e4a6c3c4def7b51b21dd4583d976f45ff20))

### Documentation

- README - ([36316e9](https://github.com/arxdeus/disposito/commit/36316e90a151204588de3a5f5369ca6fa38394d4))

### Features

- **(disposable)** static `disposeObject` proxies `FutureOr<void>` instead of `void` - ([868ce56](https://github.com/arxdeus/disposito/commit/868ce56fe88eadce5f09736fcedd16acfc280bfc))
- **(dispose_holder)** rethink of prioritization of dispose queue - ([cbb0832](https://github.com/arxdeus/disposito/commit/cbb0832d2232488fda5321f58101b9d7a80602a8))
- **(dispose_registry)** rethink of prioritization of purge callback - ([156dc4c](https://github.com/arxdeus/disposito/commit/156dc4ca81426de62b52fd71f648859e5bc2e53e))
- **(dispose_tracker)** dispose tracker as public global interactor - ([2e03b79](https://github.com/arxdeus/disposito/commit/2e03b79eaf447ea1efdd3b0ecdd1183d51e49806))
- **(dispose_tracker)** purge on create/dispose each other holder - ([f38e5c9](https://github.com/arxdeus/disposito/commit/f38e5c91488b54db900df2fb767bdcb087ef1cbc))
- **(example)** simple example - ([ed12719](https://github.com/arxdeus/disposito/commit/ed127198cb8075339baeea719ff1f02c26ad96ab))
- **(example)** simple now have async callback and disposes - ([a34805e](https://github.com/arxdeus/disposito/commit/a34805ee2cbedf1a518c86b460930afd1c1a20b8))
-  [**BREAKING CHANGE**] disposito - ([ca1db16](https://github.com/arxdeus/disposito/commit/ca1db16623904e79f7ddd2351066d8fe29157857))

### Miscellaneous Chores

- **(disposable)** static method for tear-off - ([2ebea5b](https://github.com/arxdeus/disposito/commit/2ebea5bff8b6623c99616ff57091b13dce8c4247))
- **(dispose_holder)** update naming of methods - ([0ae1aec](https://github.com/arxdeus/disposito/commit/0ae1aec19cc682566899289ad661272d3800361a))
- **(extensions)** change variable input name - ([b4c4247](https://github.com/arxdeus/disposito/commit/b4c42471f4dabef91da61de0ec4a87bd799ca46d))
- **(internal)** disposable wrapper implements disposable - ([5443887](https://github.com/arxdeus/disposito/commit/54438870ac45ac3ab0b7cd18dae0d8886f86b6cf))
- **(pubspec)** update description - ([a200d5e](https://github.com/arxdeus/disposito/commit/a200d5e0c20808282790365ec0d697194dc96e14))
- LICENSE - ([04027fa](https://github.com/arxdeus/disposito/commit/04027fa8a09c3e90d4a3338b155a7d1e23d0ec61))

### Refactoring

- code style + lint matching - ([bf533bb](https://github.com/arxdeus/disposito/commit/bf533bb064e6b6a549548a20cbdcf4dd3b7ac2cc))

### Tests

- update to new syntax - ([4a1cd5c](https://github.com/arxdeus/disposito/commit/4a1cd5cf4c80d7a9bb38f8901a2a68b0d3631335))
- missing comma lint fix - ([412bd71](https://github.com/arxdeus/disposito/commit/412bd716443fe9e82a1d4dc6b524448a82cd1e5c))
- update to new syntax - ([b45039c](https://github.com/arxdeus/disposito/commit/b45039cbb82a7176129bdc9b729bfc43b5803644))

### Ci

- wrong step variable name - ([d329299](https://github.com/arxdeus/disposito/commit/d329299bb9b524bcefaa3e2f9d752023a2a28776))
- fix double slash on pr create - ([322b10f](https://github.com/arxdeus/disposito/commit/322b10f2589d5c23d1dbbc4ddd14d866641a24e5))
- naming for status checks - ([bd4111a](https://github.com/arxdeus/disposito/commit/bd4111ac06edd62a3d08701fac44f9b51d61abdf))
- fix changelog generator typo - ([0ab0833](https://github.com/arxdeus/disposito/commit/0ab0833abae5807c0612a4210f83277262391ef9))
- missing PAT + change versions strategy - ([7bc5260](https://github.com/arxdeus/disposito/commit/7bc5260af08dc2a92882dab0309b15b72b388353))

## [0.1.0](https://github.com/arxdeus/disposito/compare/v0.0.0..0.1.0) - 2025-03-19

### Bug Fixes

- **(extensions)** change signatures to generics to allow subtypes - ([2e2759c](https://github.com/arxdeus/disposito/commit/2e2759cf47b4c7b7a9941a8f9329d3c477732541))

### Features

- **(dispose_tracker)** dispose tracker as public global interactor - ([2e03b79](https://github.com/arxdeus/disposito/commit/2e03b79eaf447ea1efdd3b0ecdd1183d51e49806))
- **(dispose_tracker)** purge on create/dispose each other holder - ([f38e5c9](https://github.com/arxdeus/disposito/commit/f38e5c91488b54db900df2fb767bdcb087ef1cbc))
-  [**BREAKING CHANGE**] disposito main logic - ([ca1db16](https://github.com/arxdeus/disposito/commit/ca1db16623904e79f7ddd2351066d8fe29157857))

### Miscellaneous Chores

- **(disposable)** static method for tear-off - ([2ebea5b](https://github.com/arxdeus/disposito/commit/2ebea5bff8b6623c99616ff57091b13dce8c4247))
- **(pubspec)** update description - ([a200d5e](https://github.com/arxdeus/disposito/commit/a200d5e0c20808282790365ec0d697194dc96e14))

### Refactoring

- code style + lint matching - ([bf533bb](https://github.com/arxdeus/disposito/commit/bf533bb064e6b6a549548a20cbdcf4dd3b7ac2cc))

### Tests

- update to new syntax - ([4a1cd5c](https://github.com/arxdeus/disposito/commit/4a1cd5cf4c80d7a9bb38f8901a2a68b0d3631335))
- missing comma lint fix - ([412bd71](https://github.com/arxdeus/disposito/commit/412bd716443fe9e82a1d4dc6b524448a82cd1e5c))

### Ci

- wrong step variable name - ([d329299](https://github.com/arxdeus/disposito/commit/d329299bb9b524bcefaa3e2f9d752023a2a28776))
- fix double slash on pr create - ([322b10f](https://github.com/arxdeus/disposito/commit/322b10f2589d5c23d1dbbc4ddd14d866641a24e5))

## 0.0.1

- Initial version.
