import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/i18n/zh_cn.dart' as zh_cn_locale;
import 'package:day/i18n/en.dart' as en_locale;

void main() {
  Day.locale = zh_cn_locale.locale;

  final d = Day.fromString('2026-02-04');

  group('Override global locale to EN', () {
    test('Months', () {
      expect(d.useLocale(en_locale.locale).format('MMM MMMM'),
          equals('Feb February'));
    });

    test('useLocale clones a new Day instance', () {
      expect(d.format('MMM MMMM'), equals('2月 二月'));
    });
  });
}
