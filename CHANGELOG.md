# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.8.0] - 2022-02-04

### Added

- feat: add method `addRound` to prevent date overflow by @g1eny0ung in <https://github.com/dayjs/day.dart/pull/41>
- feat: add method `subtractRound` to prevent date overflow by @g1eny0ung in <https://github.com/dayjs/day.dart/pull/42>

### Changed

- chore!: now `.add()` and `.subtract()` return nullable

### Removed

- chore!: remove useless `.isValid()`

## [0.7.2] - 2022-01-17

- Refactor internal `Unit`
- Enhance doc comments

## [0.7.1] - 2021-05-04

- Update docs

## [0.7.0] - 2021-05-03

- Support null safety

## [0.7.0-nullsafety.0] - 2020-12-21

- Migrate to null safety

## [0.6.4]

- Lint with [pedantic](https://pub.dev/packages/pedantic)

## [0.6.3]

- Fix some issues

## [0.6.2]

- Add [`Quarter Of Year`](https://github.com/dayjs/day.dart/blob/master/PLUGINS.md#quarter-of-year) plugin

## [0.6.1]

- Add [`Day Of Year`](https://github.com/dayjs/day.dart/blob/master/PLUGINS.md#day-of-year) plugin

## [0.6.0]

- Now `.diff()` method return no abs value
- Fix issues of `y` and `M` shorthands in `.add()` and `.substract()`
- Add [`Relative Time`](https://github.com/dayjs/day.dart/blob/master/PLUGINS.md#relative-time) plugin

## [0.5.5]

- Now can escape string in `.format()` method

## [0.5.4]

- Add `.toDateTime()` method

## [0.5.3]

- Update docs

## [0.5.2]

- Follow health suggestions

## [0.5.1] - 2019-12-16

- Fix the version of dart

## [0.5.0] - 2019-12-16

- **Breaking change: rewrite plugins system with extension syntax**
- Add [`Is Leap Year`](https://github.com/dayjs/day.dart/blob/master/PLUGINS.md#is-leap-year) plugin
- Update some details
- Update docs

## [0.4.1] - 2019-11-17

- Follow health suggestions

## [0.4.0] - 2019-09-03

- Add i18n support

## [0.3.2] - 2019-07-12

- Update pubspec

## [0.3.1] - 2019-07-12

- Now Day.dart join into the dayjs organization

## [0.3.0] - 2019-05-31

- Plugin system supported

## [0.2.2] - 2019-05-29

- Update docs
- Fix `.weekday()` method's problem
- Update the type checking

## [0.2.1] - 2019-05-09

- Add API reference
- Now `.timezoneOffset` returns `Duration`

## [0.2.0] - 2019-05-08

Add `.format()` method

## [0.1.2] - 2019-05-03

Update README and example

## [0.1.1] - 2019-05-03

Fix pub related info

## [0.1.0] - 2019-05-03

First version
