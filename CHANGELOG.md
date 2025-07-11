# Changelog

## [0.2.3](https://github.com/arxdeus/disposito/compare/v0.2.2..0.2.3) - 2025-05-18

### Documentation

- add comprehensive doc comments for classes (#9) - ([6960ec7](https://github.com/arxdeus/disposito/commit/6960ec77c248284bfd17be2ba18fe7803ac7a91a))
- README v2 - ([a0b8747](https://github.com/arxdeus/disposito/commit/a0b87470b20ed270a1c0091d7261d3f0a68dfb5d))

### Ci

- trigger dry publish on `edit` and `synchronized` - ([673d6ec](https://github.com/arxdeus/disposito/commit/673d6ec207b1095bb950bd93df48afb9df0db0ec))

## [0.2.2](https://github.com/arxdeus/disposito/compare/v0.2.1..0.2.2) - 2025-03-23

### Documentation

- **(README)** misspelling and styling fixes - ([070b570](https://github.com/arxdeus/disposito/commit/070b570612456cde7cf8015ee028c33928e05b7c))
- **(dispose_holder_mixin)** internal comment for `debugName` clarification - ([8aa2613](https://github.com/arxdeus/disposito/commit/8aa26138b3a5e3118a664656e1b73de10c2922aa))

### Miscellaneous Chores

- **(example)** oneline dispose in `simple.dart` - ([0343a30](https://github.com/arxdeus/disposito/commit/0343a3006a8849892d12f85ad33d43fb8f20f526))
- **(internal)** more verbose internal class names - ([e41fb98](https://github.com/arxdeus/disposito/commit/e41fb98e2b8476ff58f2999b07d0101fce511fab))

### Refactoring

- **(dispose_holder)** migrate to asynchronous api under the hood - ([c5892ec](https://github.com/arxdeus/disposito/commit/c5892ec25d21a9e9e2c5e3f1e7ecb3f1ee8db573))
- **(dispose_registry)** execute `function` in `purgeAfter` synchronously - ([07a965f](https://github.com/arxdeus/disposito/commit/07a965f3f55bbe3bd81b1ec9f191dfac1f740f0c))
- **(extensions)** asynchronous api without `unawaited` - ([28a7d31](https://github.com/arxdeus/disposito/commit/28a7d3166408221920d5a27a9dde508a156ac384))
- **(internal)** `Callable.call` static for tear-off callback execution - ([15324e6](https://github.com/arxdeus/disposito/commit/15324e6ccaed4e81f4396375789ab69eb7348a76))

### Ci

- **(dry_publish)** fix double dry-run - ([6efd6c7](https://github.com/arxdeus/disposito/commit/6efd6c7595641e4532d2de9e588f39d9ed369a1a))

## [0.2.1](https://github.com/arxdeus/disposito/compare/v0.2.0..0.2.1) - 2025-03-21

### Documentation

- **(README)** fix typos and misspellings - ([e149ae0](https://github.com/arxdeus/disposito/commit/e149ae002cefe10a503edc734aa6230628e36839))

### Ci

- fix release condition - ([2579ac4](https://github.com/arxdeus/disposito/commit/2579ac4404d09fa925464dca72e3eb31eb8b9506))

## [0.2.0](https://github.com/arxdeus/disposito/compare/v0.1.0..0.2.0) - 2025-03-21

### Bug Fixes

- **(dispose_holder)** make dispose async - ([4489a13](https://github.com/arxdeus/disposito/commit/4489a1339b8fde654605c82ca9a4df9dd8e2d40d))
- **(example)** update to new syntax - ([4f993ff](https://github.com/arxdeus/disposito/commit/4f993ff650a4fb7c9d28fabebdd1db7b2bc8f7d7))
- **(extensions)** update extensions to new syntax - ([11f03a4](https://github.com/arxdeus/disposito/commit/11f03a4294b3cfddb398c1f04ab4f06cd7066747))
- path to wrapper inside `internal.dart` - ([f443f00](https://github.com/arxdeus/disposito/commit/f443f001d89d8a8e1cb832c1a99844c122bd086b))
- remove `createDisposable` and `DisposeWrapper` - ([a3fe6e4](https://github.com/arxdeus/disposito/commit/a3fe6e4a6c3c4def7b51b21dd4583d976f45ff20))

### Documentation

- README - ([36316e9](https://github.com/arxdeus/disposito/commit/36316e90a151204588de3a5f5369ca6fa38394d4))

### Features

- **(disposable)** static `disposeObject` proxies `FutureOr<void>` instead of `void` - ([868ce56](https://github.com/arxdeus/disposito/commit/868ce56fe88eadce5f09736fcedd16acfc280bfc))
- **(dispose_holder)** rethink of prioritization of dispose queue - ([cbb0832](https://github.com/arxdeus/disposito/commit/cbb0832d2232488fda5321f58101b9d7a80602a8))
- **(dispose_registry)** rethink of prioritization of purge callback - ([156dc4c](https://github.com/arxdeus/disposito/commit/156dc4ca81426de62b52fd71f648859e5bc2e53e))
- **(example)** simple example - ([ed12719](https://github.com/arxdeus/disposito/commit/ed127198cb8075339baeea719ff1f02c26ad96ab))
- **(example)** simple now have async callback and disposes - ([a34805e](https://github.com/arxdeus/disposito/commit/a34805ee2cbedf1a518c86b460930afd1c1a20b8))

### Miscellaneous Chores

- **(dispose_holder)** update naming of methods - ([0ae1aec](https://github.com/arxdeus/disposito/commit/0ae1aec19cc682566899289ad661272d3800361a))
- **(extensions)** change variable input name - ([b4c4247](https://github.com/arxdeus/disposito/commit/b4c42471f4dabef91da61de0ec4a87bd799ca46d))
- **(internal)** disposable wrapper implements disposable - ([5443887](https://github.com/arxdeus/disposito/commit/54438870ac45ac3ab0b7cd18dae0d8886f86b6cf))

### Tests

- update to new syntax - ([b45039c](https://github.com/arxdeus/disposito/commit/b45039cbb82a7176129bdc9b729bfc43b5803644))

### Ci

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
