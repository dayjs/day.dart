import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/i18n/zh_cn.dart' as zhCNLocale;

void main() {
  final d =
      Day.fromString('2019-04-30T10:30:30.000Z').useLocale(zhCNLocale.locale);

  group('En', () {
    test('Months', () {
      expect(d.format('MMM MMMM'), equals('4月 四月'));
    });

    test('Weekdays', () {
      expect(d.format('WW WWW WWWW'), equals('二 周二 星期二'));
    });

    test('AM', () {
      expect(d.format('A'), equals('上午'));
    });
  });
}
