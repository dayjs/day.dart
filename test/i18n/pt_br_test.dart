import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/relative_time.dart';
import 'package:day/i18n/pt_br.dart' as pt_br_locale;

void main() {
  final d =
      Day.fromString('2019-04-30T10:30:30.000Z').useLocale(pt_br_locale.locale);

  group('PT_BR', () {
    test('Months', () {
      expect(d.format('MMM MMMM'), equals('abr. abril'));
    });

    test('Weekdays', () {
      expect(d.format('WW WWW WWWW'), equals('ter. ter. terça-feira'));
    });

    test('AM', () {
      expect(d.format('A'), equals('AM'));
    });

    test('RelativeTime', () {
      final target = d.add(2, 'm')!;
      expect(d.to(target), 'em 2 minutos');
      expect(d.from(target), 'há 2 minutos');
    });
  });
}
