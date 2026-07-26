# Day.dart Agent Guide

## Project Layout

- `lib/day.dart` is the public entry point.
- `lib/src/` contains the core `Day` implementation and utilities.
- `lib/plugins/` and `lib/i18n/` contain extensions and locales.
- `test/` mirrors features with `package:test` tests.

## Development

Use Dart SDK 3.x. Before finishing a change, run:

```sh
dart format .
dart analyze
dart test
```

## Conventions

- Keep `Day` operations immutable: methods that change a value must return a new instance.
- Add focused tests for behavior changes, including boundary dates and time zones where relevant.
- Update `API.md`, `PLUGINS.md`, or `I18N.md` when changing a public API, plugin, or locale behavior.
- Preserve the existing straightforward Dart style; avoid unrelated refactors.
