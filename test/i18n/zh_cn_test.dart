import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/relative_time.dart';
import 'package:day/i18n/zh_cn.dart' as zh_cn_locale;

void main() {
  final d =
      Day.fromString('2019-04-30T10:30:30.000Z').useLocale(zh_cn_locale.locale);

  group('ZH_CN', () {
    test('Months', () {
      expect(d.format('MMM MMMM'), equals('4月 四月'));
    });

    test('Weekdays', () {
      expect(d.format('WW WWW WWWW'), equals('周二 周二 星期二'));
      final names = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
      for (var index = 0; index < names.length; index++) {
        final date = Day.fromDateTime(DateTime.utc(2020, 1, 6 + index))
            .useLocale(zh_cn_locale.locale);
        expect(date.format('WW WWW'), '${names[index]} ${names[index]}');
      }
    });

    test('AM', () {
      expect(d.format('A'), equals('上午'));
    });

    test('RelativeTime', () {
      final units = {'m': '分钟', 'h': '小时', 'd': '天', 'M': '个月', 'y': '年'};
      for (final unit in units.entries) {
        for (final count in [1, 2]) {
          final target = d.add(count, unit.key)!;
          expect(d.to(target), '$count${unit.value}后');
          expect(d.from(target), '$count${unit.value}前');
          expect(d.to(target, true), '$count${unit.value}');
        }
      }
    });
  });
}
