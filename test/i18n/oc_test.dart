import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/relative_time.dart';
import 'package:day/i18n/oc.dart' as oc_locale;

void main() {
  final d =
      Day.fromDateTime(DateTime.utc(2020, 1, 15)).useLocale(oc_locale.locale);

  group('OC', () {
    test('Months include CLDR prepositions', () {
      final names = [
        'de genièr',
        'de febrièr',
        'de març',
        'd’abril',
        'de mai',
        'de junh',
        'de julhet',
        'd’agost',
        'de setembre',
        'd’octòbre',
        'de novembre',
        'de decembre'
      ];
      for (var month = 1; month <= 12; month++) {
        final date = Day.fromDateTime(DateTime.utc(2020, month, 1))
            .useLocale(oc_locale.locale);
        final name = names[month - 1];
        expect(date.format('MMM MMMM'), '$name $name');
        expect(date.format('D MMMM'), '1 $name');
      }
    });

    test('All weekday widths are available', () {
      final names = [
        'diluns',
        'dimars',
        'dimècres',
        'dijòus',
        'divendres',
        'dissabte',
        'dimenge'
      ];
      for (var index = 0; index < names.length; index++) {
        final date = Day.fromDateTime(DateTime.utc(2020, 1, 6 + index))
            .useLocale(oc_locale.locale);
        final name = names[index];
        expect(date.format('WW WWW WWWW'), '$name $name $name');
      }
    });

    test('RelativeTime preserves Occitan translations', () {
      final cases = [
        (1, 's', 'unas segondas'),
        (1, 'm', 'una minuta'),
        (2, 'm', '2 minutas'),
        (1, 'h', 'un ora'),
        (2, 'h', '2 oras'),
        (1, 'd', 'un jorn'),
        (2, 'd', '2 jorns'),
        (1, 'M', 'un mes'),
        (2, 'M', '2 meses'),
        (1, 'y', 'un an'),
        (2, 'y', '2 ans'),
      ];
      for (final (count, unit, text) in cases) {
        final target = d.add(count, unit)!;
        expect(d.to(target), 'dins $text');
        expect(d.from(target), 'fa $text');
        expect(d.to(target, true), text);
        expect(d.from(target, true), text);
      }
      expect(d.to(d.add(44, 's')!), 'dins unas segondas');
      expect(d.to(d.add(45, 's')!), 'dins una minuta');
      expect(d.to(d.add(90, 's')!), 'dins 2 minutas');
    });
  });
}
