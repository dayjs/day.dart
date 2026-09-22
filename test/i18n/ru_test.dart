import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/relative_time.dart';
import 'package:day/i18n/ru.dart' as ru_locale;

void main() {
  final d =
      Day.fromString('2019-04-30T10:30:30.000Z').useLocale(ru_locale.locale);

  group('RU', () {
    test('Months', () {
      expect(d.format('MMM MMMM'), equals('апр. апрель'));
    });

    test('Months in dates', () {
      final names = [
        'января',
        'февраля',
        'марта',
        'апреля',
        'мая',
        'июня',
        'июля',
        'августа',
        'сентября',
        'октября',
        'ноября',
        'декабря'
      ];
      final shortNames = [
        'янв.',
        'февр.',
        'мар.',
        'апр.',
        'мая',
        'июн.',
        'июл.',
        'авг.',
        'сент.',
        'окт.',
        'нояб.',
        'дек.'
      ];
      for (var month = 1; month <= 12; month++) {
        final date = Day.fromDateTime(DateTime.utc(2020, month, 1))
            .useLocale(ru_locale.locale);
        expect(date.format('D MMMM YYYY'), '1 ${names[month - 1]} 2020');
        expect(date.format('DD MMM'), '01 ${shortNames[month - 1]}');
      }
    });

    test('Month context respects literals and individual tokens', () {
      final date = Day.fromString('2020-05-01').useLocale(ru_locale.locale);
      expect(date.format('MMM MMMM'), 'май май');
      expect(date.format('D [day] MMMM'), '1 day мая');
      expect(date.format('[D] MMMM'), 'D май');
      expect(date.format('[D MMMM]'), 'D MMMM');
      expect(date.format('MMMM / D MMMM'), 'май / 1 мая');
      expect(date.format('D MMMM / MMMM'), '1 мая / май');
    });

    test('Weekdays', () {
      expect(d.format('WW WWW WWWW'), equals('вт вт вторник'));
    });

    test('AM', () {
      expect(d.format('A'), equals('AM'));
    });

    group('RelativeTime plural', () {
      final base = Day.fromString('2019-04-30T10:30:30.001Z')
          .useLocale(ru_locale.locale);

      String rel(Day target) => base.from(target, true);

      test('days', () {
        expect(rel(base.add(1, 'd')!), equals('день'));
        expect(rel(base.add(2, 'd')!), equals('2 дня'));
        expect(rel(base.add(21, 'd')!), equals('21 день'));
        expect(rel(base.add(25, 'd')!), equals('25 дней'));
      });

      test('minutes', () {
        expect(rel(base.add(1, 'm')!), equals('минута'));
        expect(rel(base.add(2, 'm')!), equals('2 минуты'));
        expect(rel(base.add(5, 'm')!), equals('5 минут'));
        expect(rel(base.add(21, 'm')!), equals('21 минута'));
        expect(rel(base.add(44, 'm')!), equals('44 минуты'));
      });

      test('minutes with and without suffixes', () {
        final cases = [
          (1, 'минута', 'минуту'),
          (2, '2 минуты', '2 минуты'),
          (5, '5 минут', '5 минут'),
          (11, '11 минут', '11 минут'),
          (21, '21 минута', '21 минуту'),
          (22, '22 минуты', '22 минуты'),
          (25, '25 минут', '25 минут'),
          (31, '31 минута', '31 минуту'),
          (41, '41 минута', '41 минуту'),
        ];
        for (final (count, standalone, withSuffix) in cases) {
          final target = base.add(count, 'm')!;
          expect(base.to(target), 'через $withSuffix');
          expect(base.from(target), '$withSuffix назад');
          expect(base.to(target, true), standalone);
          expect(base.from(target, true), standalone);
        }
        expect(base.to(base.add(44, 's')!), 'через несколько секунд');
        expect(base.to(base.add(45, 's')!), 'через минуту');
        expect(base.to(base.add(89, 's')!), 'через минуту');
        expect(base.to(base.add(90, 's')!), 'через 2 минуты');
      });

      test('years', () {
        expect(rel(base.add(2, 'y')!), equals('2 года'));
        expect(rel(base.add(21, 'y')!), equals('21 год'));
        expect(rel(base.add(5, 'y')!), equals('5 лет'));
        expect(rel(base.add(11, 'y')!), equals('11 лет'));
        expect(rel(base.add(12, 'y')!), equals('12 лет'));
        expect(rel(base.add(111, 'y')!), equals('111 лет'));
      });
    });
  });
}
