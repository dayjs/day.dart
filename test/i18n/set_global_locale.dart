import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/i18n/zh_cn.dart' as zh_cn_locale;

void main() {
  Day.locale = zh_cn_locale.locale;

  final d = Day.fromString('2026-02-04');

  group('Set global locale to ZH_CN', () {
    test('Months', () {
      expect(d.format('MMM MMMM'), equals('2月 二月'));
    });

    test('Weekdays', () {
      expect(d.format('WW WWW WWWW'), equals('三 周三 星期三'));
    });
  });
}
