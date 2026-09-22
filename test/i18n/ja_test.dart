import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/relative_time.dart';
import 'package:day/i18n/ja.dart' as ja_locale;

void main() {
  final d =
      Day.fromString('2019-04-30T10:30:30.000Z').useLocale(ja_locale.locale);

  group('JA', () {
    test('Months', () {
      expect(d.format('MMM MMMM'), equals('4月 4月'));
    });

    test('Weekdays', () {
      expect(d.format('WW WWW WWWW'), equals('火 火 火曜日'));
    });

    test('AM', () {
      expect(d.format('A'), equals('午前'));
    });

    test('RelativeTime spacing and month counter', () {
      final units = {'m': '分', 'h': '時間', 'd': '日', 'M': 'か月', 'y': '年'};
      for (final entry in units.entries) {
        for (final count in [1, 2]) {
          final target = d.add(count, entry.key)!;
          expect(d.to(target), '$count ${entry.value}後');
          expect(d.from(target), '$count ${entry.value}前');
        }
      }
    });
  });
}
