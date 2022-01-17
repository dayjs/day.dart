import '../day.dart';
import '../src/constants.dart' show Unit;

// f: format, v: value, u: unit
const thresholds = [
  {'f': 's', 'v': 44, 'u': Unit.s},
  {'f': 'm', 'v': 89},
  {'f': 'mm', 'v': 44, 'u': Unit.min},
  {'f': 'h', 'v': 89},
  {'f': 'hh', 'v': 21, 'u': Unit.h},
  {'f': 'd', 'v': 35},
  {'f': 'dd', 'v': 25, 'u': Unit.d},
  {'f': 'M', 'v': 45},
  {'f': 'MM', 'v': 10, 'u': Unit.m},
  {'f': 'y', 'v': 17},
  {'f': 'yy', 'u': Unit.y}
];

/// Adds relative time support.
///
/// This plugin includes four methods: from, fromNow, to, toNow.
/// All of them can help you to format date to a relative time string.
extension RelativeTime on Day {
  // Internal exec func of relative time
  String _relativeTimeExec(Day day, bool withoutSuffix, [bool isFrom = true]) {
    final locale = getLocale();
    final relativeTimeLocale = locale['RelativeTime'];
    late int fromTo;
    late bool isFuture;
    late String result;

    for (final t in thresholds) {
      if (t['u'] != null) {
        final tUnit = t['u'] as String;

        fromTo = isFrom ? diff(day, tUnit) : day.diff(this, tUnit);
        final fromToSeconds =
            (isFrom ? diff(day, 's') : day.diff(this, 's')).abs();

        isFuture = fromTo > 0;

        // if 90 <= s < 120, m = 2
        if (tUnit == Unit.min && fromToSeconds >= 90 && fromToSeconds < 120) {
          fromTo += isFuture ? 1 : -1;
        }

        // if 90 <= m < 120, h = 2
        if (tUnit == Unit.h && fromToSeconds >= 5400 && fromToSeconds < 7200) {
          fromTo += isFuture ? 1 : -1;
        }

        // if 36 <= h < 48, d = 2
        if (tUnit == Unit.d &&
            fromToSeconds >= 129600 &&
            fromToSeconds < 172800) {
          fromTo += isFuture ? 1 : -1;
        }
      }

      final absResult = fromTo.abs();

      if (t['v'] == null || absResult <= (t['v'] as int)) {
        final format = relativeTimeLocale[t['f']];

        result = (format as String).replaceFirst('%d', absResult.toString());

        break;
      }
    }

    if (withoutSuffix) {
      return result;
    }

    return ((isFuture
            ? relativeTimeLocale['future']
            : relativeTimeLocale['past']) as String)
        .replaceFirst('%s', result);
  }

  /// Returns the string of relative time from [day].
  ///
  /// The second param is optional, by set [withoutSuffix] to true, it will remove the suffix(ago).
  String from(Day day, [bool withoutSuffix = false]) =>
      _relativeTimeExec(day, withoutSuffix);

  /// Returns the string of relative time from now.
  String fromNow([bool withoutSuffix = false]) => from(Day(), withoutSuffix);

  /// Returns the string of relative time to [day].
  ///
  /// The second param is optional, by set [withoutPrefix] to true, it will remove the prefix(in).
  String to(Day day, [bool withoutPrefix = false]) =>
      _relativeTimeExec(day, withoutPrefix, false);

  /// Returns the string of relative time to now.
  String toNow([bool withoutPrefix = false]) => to(Day(), withoutPrefix);
}
