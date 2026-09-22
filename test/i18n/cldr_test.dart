import 'dart:convert';
import 'dart:io';

import 'package:day/day.dart';
import 'package:day/i18n/de.dart' as de;
import 'package:day/i18n/es.dart' as es;
import 'package:day/i18n/fr.dart' as fr;
import 'package:day/i18n/ja.dart' as ja;
import 'package:day/i18n/ko.dart' as ko;
import 'package:day/i18n/pt.dart' as pt;
import 'package:day/i18n/pt_br.dart' as pt_br;
import 'package:day/i18n/ru.dart' as ru;
import 'package:day/i18n/zh_tw.dart' as zh_tw;
import 'package:day/plugins/relative_time.dart';
import 'package:test/test.dart';

void main() {
  // Unmodified extracts from the pinned CLDR release, not from our locale maps.
  final fixture = jsonDecode(
    File('test/i18n/fixtures/cldr_48_2_2.json').readAsStringSync(),
  ) as Map<String, dynamic>;
  final locales = {
    'de': de.locale,
    'es': es.locale,
    'fr': fr.locale,
    'ja': ja.locale,
    'ko': ko.locale,
    'pt': pt.locale,
    'pt_br': pt_br.locale,
    'ru': ru.locale,
    'zh_tw': zh_tw.locale,
  };
  // Preserve Day.js-style Chinese month numerals and German weekday labels.
  const chineseMonths = [
    '一月',
    '二月',
    '三月',
    '四月',
    '五月',
    '六月',
    '七月',
    '八月',
    '九月',
    '十月',
    '十一月',
    '十二月'
  ];
  // Integer examples from CLDR's Russian cardinal plural rules. These are
  // explicit categories so a bug in the implementation cannot choose its own
  // expected result. Other tested locales use "other" for these counts.
  const counts = {
    2: 'few',
    3: 'few',
    4: 'few',
    5: 'many',
    10: 'many',
    11: 'many',
    12: 'many',
    13: 'many',
    14: 'many',
    20: 'many',
    21: 'one',
    22: 'few',
    24: 'few',
    25: 'many',
    31: 'one',
    41: 'one',
    44: 'few',
    101: 'one',
    111: 'many',
    112: 'many',
    114: 'many'
  };
  // Stay within each unit's relative-time thresholds.
  const units = {
    'minute': ('m', 44),
    'hour': ('h', 21),
    'day': ('d', 25),
    'month': ('M', 10),
    'year': ('y', 114),
  };

  for (final entry in locales.entries) {
    final name = entry.key;
    final locale = entry.value;
    final expected = fixture['locales'][name] as Map<String, dynamic>;
    Day date(DateTime time) => Day.fromDateTime(time).useLocale(locale);

    group('CLDR $name', () {
      test('all months, standalone and in dates', () {
        for (var month = 1; month <= 12; month++) {
          final d = date(DateTime.utc(2020, month, 1));
          final index = month - 1;
          final wide = name == 'zh_tw'
              ? chineseMonths[index]
              : expected[name == 'ru' ? 'monthsStandalone' : 'months'][index];
          final abbreviated =
              expected[name == 'ru' ? 'monthsShortStandalone' : 'monthsShort']
                  [index];
          expect(d.format('MMMM'), wide, reason: 'month $month');
          expect(d.format('MMM'), abbreviated, reason: 'month $month');
          final dateWide = name == 'zh_tw' ? wide : expected['months'][index];
          expect(d.format('D MMMM'), '1 $dateWide');
          expect(d.format('DD MMM'), '01 ${expected['monthsShort'][index]}');
        }
      });

      test('all weekdays and both abbreviation widths', () {
        for (var index = 0; index < 7; index++) {
          final d = date(DateTime.utc(2020, 1, 6 + index));
          expect(d.format('WWWW'), expected['weekdays'][index]);
          expect(d.format('WWW'), expected['weekdaysShort'][index]);
          final String short = expected['weekdaysMin'][index];
          expect(
              d.format('WW'), name == 'de' ? short.replaceAll('.', '') : short);
        }
      });

      test('AM and PM at midnight, noon, and their boundaries', () {
        for (final hour in [0, 11, 12, 23]) {
          final d = date(DateTime.utc(2020, 1, 1, hour));
          final String period = expected['dayPeriods'][hour < 12 ? 0 : 1];
          expect(d.format('A'), period);
          expect(d.format('a'), period.toLowerCase());
        }
      });

      for (final unit in units.entries) {
        test('${unit.key}: past and future numeric forms', () {
          final base = date(DateTime.utc(2020, 1, 15));
          for (final count in counts.entries) {
            if (count.key > unit.value.$2) continue;
            final target = base.add(count.key, unit.value.$1)!;
            final category = name == 'ru' ? count.value : 'other';
            for (final direction in ['future', 'past']) {
              final String pattern =
                  expected['relativeTime'][unit.key][direction][category];
              final actual =
                  direction == 'future' ? base.to(target) : base.from(target);
              expect(actual, pattern.replaceAll('{0}', '${count.key}'),
                  reason: '${count.key} ${unit.key} $direction');
            }
          }
        });
      }
    });
  }
}
