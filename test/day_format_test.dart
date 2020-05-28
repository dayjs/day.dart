import 'package:test/test.dart';
import 'package:day/day.dart';

void main() {
  final d = Day.fromString('2019-04-30T10:30:30.000Z');

  group('Format:', () {
    test('Default', () {
      expect(d.format(), equals('2019-04-30T10:30:30.000Z'));
    });

    test('[YYYYescape]', () {
      expect(d.format('[YYYYescape]'), 'YYYYescape');
    });

    test('Y', () {
      expect(d.format('Y'), equals('19'));
    });

    test('YY', () {
      expect(d.format('YY'), equals('19'));
    });

    test('YYY', () {
      expect(d.format('YYY'), equals('2019'));
    });

    test('YYYY', () {
      expect(d.format('YYYY'), equals('2019'));
    });

    test('M', () {
      expect(d.format('M'), equals('4'));
    });

    test('MM', () {
      expect(d.format('MM'), equals('04'));
    });

    test('MMM', () {
      expect(d.format('MMM'), equals('Apr'));
    });

    test('MMMM', () {
      expect(d.format('MMMM'), equals('April'));
    });

    test('D', () {
      expect(d.format('D'), equals('30'));
    });

    test('DD', () {
      expect(d.format('DD'), equals('30'));
    });

    test('W', () {
      expect(d.format('W'), equals('2'));
    });

    test('WW', () {
      expect(d.format('WW'), equals('Tu'));
    });

    test('WWW', () {
      expect(d.format('WWW'), equals('Tue'));
    });

    test('WWWW', () {
      expect(d.format('WWWW'), equals('Tuesday'));
    });

    test('H', () {
      expect(d.format('H'), equals('10'));
    });

    test('HH', () {
      expect(d.format('HH'), equals('10'));
    });

    test('h', () {
      expect(d.format('h'), equals('10'));
    });

    test('hh', () {
      expect(d.format('hh'), equals('10'));
    });

    test('m', () {
      expect(d.format('m'), equals('30'));
    });

    test('mm', () {
      expect(d.format('mm'), equals('30'));
    });

    test('s', () {
      expect(d.format('s'), equals('30'));
    });

    test('ss', () {
      expect(d.format('ss'), equals('30'));
    });

    test('SSS', () {
      expect(d.format('SSS'), equals('000'));
    });

    test('A', () {
      expect(d.format('A'), equals('AM'));
    });

    test('a', () {
      expect(d.format('a'), equals('am'));
    });

    test('All put together', () {
      expect(d.format('[Today is] YYYY MM DD HH mm ss A'), 'Today is 2019 04 30 10 30 30 AM');
      expect(d.format('[Today is] YYYY-MM-DD-HH-mm-ss:A'), 'Today is 2019-04-30-10-30-30:AM');
    });
  });
}
