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

    test('RelativeTime uses CLDR numeric fallback patterns', () {
      final units = {
        's': 's',
        'm': 'min',
        'h': 'h',
        'd': 'd',
        'M': 'm',
        'y': 'y'
      };
      for (final unit in units.entries) {
        for (final count in [1, 2]) {
          final target = d.add(count, unit.key)!;
          expect(d.to(target), '+$count ${unit.value}');
          expect(d.from(target), '-$count ${unit.value}');
          expect(d.to(target, true), '$count ${unit.value}');
        }
      }
      expect(d.to(d.add(44, 's')!), '+44 s');
      expect(d.to(d.add(45, 's')!), '+1 min');
      expect(d.to(d.add(90, 's')!), '+2 min');
    });
  });
}
