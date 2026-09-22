import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/relative_time.dart';
import 'package:day/i18n/pt.dart' as pt_locale;

void main() {
  final d =
      Day.fromString('2019-04-30T10:30:30.000Z').useLocale(pt_locale.locale);

  group('PT', () {
    test('Months', () {
      expect(d.format('MMM MMMM'), equals('abr. abril'));
    });

    test('Weekdays', () {
      expect(d.format('WW WWW WWWW'), equals('ter. terça terça-feira'));
    });

    test('AM', () {
      expect(d.format('A'), equals('a.m.'));
    });

    test('Saturday and PM', () {
      final date =
          Day.fromString('2020-09-05T13:00:00Z').useLocale(pt_locale.locale);
      expect(date.format('WW WWW A'), 'sáb. sábado p.m.');
    });

    test('RelativeTime', () {
      final target = d.add(2, 'm')!;
      expect(d.to(target), 'dentro de 2 minutos');
      expect(d.from(target), 'há 2 minutos');
    });
  });
}
