import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/relative_time.dart';

void main() {
  group('Plugin => Relative Time =>', () {
    final d = Day.fromString('2019-04-30T10:30:30.001Z');
    final d1 = d.add(1, 's');
    final d2 = d.add(44, 's');

    final d3 = d.add(45, 's');
    final d4 = d.add(89, 's');

    final d5 = d.add(90, 's');
    final d6 = d.add(120, 's');
    final d7 = d.add(44, 'm');

    final d8 = d.add(45, 'm');
    final d9 = d.add(89, 'm');

    final d10 = d.add(90, 'm');
    final d11 = d.add(120, 'm');
    final d12 = d.add(21, 'h');

    final d13 = d.add(22, 'h');
    final d14 = d.add(35, 'h');

    final d15 = d.add(36, 'h');
    final d16 = d.add(48, 'h');
    final d17 = d.add(25, 'd');

    final d18 = d.add(26, 'd');
    final d19 = d.add(45, 'd');

    final d20 = d.add(46, 'd');
    final d21 = d.add(60, 'd');
    final d22 = d.add(4, 'M');

    final d2020 = d.year(2020);
    final d2021 = d.year(2021);
    final d2022 = d.year(2022);

    test('from', () {
      final fromD1 = d.from(d1);
      final fromD2 = d.from(d2);
      final fromD3 = d.from(d3);
      final fromD4 = d.from(d4);
      final fromD5 = d.from(d5);
      final fromD6 = d.from(d6);
      final fromD7 = d.from(d7);
      final fromD8 = d.from(d8);
      final fromD9 = d.from(d9);
      final fromD10 = d.from(d10);
      final fromD11 = d.from(d11);
      final fromD12 = d.from(d12);
      final fromD13 = d.from(d13);
      final fromD14 = d.from(d14);
      final fromD15 = d.from(d15);
      final fromD16 = d.from(d16);
      final fromD17 = d.from(d17);
      final fromD18 = d.from(d18);
      final fromD19 = d.from(d19);
      final fromD20 = d.from(d20);
      final fromD21 = d.from(d21);
      final fromD22 = d.from(d22);
      final from2020 = d.from(d2020);
      final from2021 = d.from(d2021);
      final from2022 = d.from(d2022);

      expect(fromD1, equals('a few seconds ago'));
      expect(fromD2, equals('a few seconds ago'));

      expect(fromD3, equals('a minute ago'));
      expect(fromD4, equals('a minute ago'));

      expect(fromD5, equals('2 minutes ago'));
      expect(fromD6, equals('2 minutes ago'));
      expect(fromD7, equals('44 minutes ago'));

      expect(fromD8, equals('an hour ago'));
      expect(fromD9, equals('an hour ago'));

      expect(fromD10, equals('2 hours ago'));
      expect(fromD11, equals('2 hours ago'));
      expect(fromD12, equals('21 hours ago'));

      expect(fromD13, equals('a day ago'));
      expect(fromD14, equals('a day ago'));

      expect(fromD15, equals('2 days ago'));
      expect(fromD16, equals('2 days ago'));
      expect(fromD17, equals('25 days ago'));

      expect(fromD18, equals('a month ago'));
      expect(fromD19, equals('a month ago'));

      expect(fromD20, equals('2 months ago'));
      expect(fromD21, equals('2 months ago'));
      expect(fromD22, equals('4 months ago'));

      expect(from2020, equals('a year ago'));
      expect(from2021, equals('2 years ago'));
      expect(from2022, equals('3 years ago'));
    });

    test('to', () {
      final toD1 = d.to(d1);
      final toD2 = d.to(d2);
      final toD3 = d.to(d3);
      final toD4 = d.to(d4);
      final toD5 = d.to(d5);
      final toD6 = d.to(d6);
      final toD7 = d.to(d7);
      final toD8 = d.to(d8);
      final toD9 = d.to(d9);
      final toD10 = d.to(d10);
      final toD11 = d.to(d11);
      final toD12 = d.to(d12);
      final toD13 = d.to(d13);
      final toD14 = d.to(d14);
      final toD15 = d.to(d15);
      final toD16 = d.to(d16);
      final toD17 = d.to(d17);
      final toD18 = d.to(d18);
      final toD19 = d.to(d19);
      final toD20 = d.to(d20);
      final toD21 = d.to(d21);
      final toD22 = d.to(d22);
      final to2020 = d.to(d2020);
      final to2021 = d.to(d2021);
      final to2022 = d.to(d2022);

      expect(toD1, equals('in a few seconds'));
      expect(toD2, equals('in a few seconds'));

      expect(toD3, equals('in a minute'));
      expect(toD4, equals('in a minute'));

      expect(toD5, equals('in 2 minutes'));
      expect(toD6, equals('in 2 minutes'));
      expect(toD7, equals('in 44 minutes'));

      expect(toD8, equals('in an hour'));
      expect(toD9, equals('in an hour'));

      expect(toD10, equals('in 2 hours'));
      expect(toD11, equals('in 2 hours'));
      expect(toD12, equals('in 21 hours'));

      expect(toD13, equals('in a day'));
      expect(toD14, equals('in a day'));

      expect(toD15, equals('in 2 days'));
      expect(toD16, equals('in 2 days'));
      expect(toD17, equals('in 25 days'));

      expect(toD18, equals('in a month'));
      expect(toD19, equals('in a month'));

      expect(toD20, equals('in 2 months'));
      expect(toD21, equals('in 2 months'));
      expect(toD22, equals('in 4 months'));

      expect(to2020, equals('in a year'));
      expect(to2021, equals('in 2 years'));
      expect(to2022, equals('in 3 years'));
    });

    test('without suffix', () {
      final fromD1 = d.from(d1, true);
      final toD1 = d.to(d1, true);

      expect(fromD1, equals('a few seconds'));
      expect(toD1, equals('a few seconds'));
    });
  });
}
