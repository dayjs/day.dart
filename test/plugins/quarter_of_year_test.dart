import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/quarter_of_year.dart';

void main() {
  test('Plugin => Quarter Of Year', () {
    final d = Day.fromString('2019-04-30T10:30:30.001Z');
    final Day dMonth10 = d.quarter(4);
    final dMonth10Quarter2 = dMonth10.quarter(2);

    expect(d.quarter(), equals(2));
    expect(dMonth10.month(), equals(10));
    expect(dMonth10Quarter2.month(), equals(4));

    final Day dMonth12 = d.month(12);
    final dMonth12Quarter2 = dMonth12.quarter(2);

    expect(dMonth12Quarter2.month(), equals(6));

    final d2020 = Day.fromString('2020-01-01');
    final d2020Quarter3 = d2020.quarter(3);

    expect(d2020.quarter(), equals(1));
    expect(d2020Quarter3.month(), equals(7));

    final d20130205 = Day.fromString('2013-02-05T05:06:07.000');

    expect(d20130205.quarter(2).month(), equals(5));
  });
}
