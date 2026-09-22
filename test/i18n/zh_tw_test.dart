import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/relative_time.dart';
import 'package:day/i18n/zh_tw.dart' as zh_tw_locale;

void main() {
  final d =
      Day.fromString('2019-04-30T10:30:30.000Z').useLocale(zh_tw_locale.locale);

  group('ZH_TW', () {
    test('Months', () {
      for (var month = 1; month <= 12; month++) {
        final date = Day.fromDateTime(DateTime.utc(2020, month, 1))
            .useLocale(zh_tw_locale.locale);
        expect(date.format('MMM MMMM'), '$month月 $month月');
        expect(date.format('D MMMM'), '1 $month月');
      }
    });

    test('Weekdays', () {
      expect(d.format('WW WWW WWWW'), equals('二 週二 星期二'));
    });

    test('AM', () {
      expect(d.format('A'), equals('上午'));
    });

    test('RelativeTime', () {
      final target = d.add(2, 'm')!;
      expect(d.to(target), '2 分鐘後');
      expect(d.from(target), '2 分鐘前');
      expect(d.to(target, true), '2 分鐘');
    });
  });
}
